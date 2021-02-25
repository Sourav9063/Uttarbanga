import 'package:Uttarbanga/Backend/Data/UserData.dart';
import 'package:Uttarbanga/GlobalVar.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class UttarbangaFirestoreReq {
  final _userCollRef =
      FirebaseFirestore.instance.collection(Allkeys.requestCol);

  Future<UserData> getUserDataFromUID(String uid) async {
    DocumentSnapshot doc = await _userCollRef.doc(uid).get();

    return UserData.fromMap(doc.data());
  }

  // UserData getUserDataFromDocSnp(QueryDocumentSnapshot queryDocumentSnapshot) {
  //   return UserData.fromMap(queryDocumentSnapshot.data());
  // }

  Future<List<UserData>> getUserList() async {
    List<UserData> userDataList = [];
    await _userCollRef.get().then((QuerySnapshot value) {
      value.docs.forEach((QueryDocumentSnapshot element) {
        userDataList.add(UserData.fromMap(element.data()));
      });
    });
    return userDataList;
  }

  setDocumentwithUID(String uid, Map mapData) async {
    await _userCollRef.doc(uid).set(mapData);
  }
}

// class GetObjects {
//   getUserObjectsFromDocSnapshot(DocumentSnapshot documentSnapshot) {
//     Map<String, dynamic> map = documentSnapshot.data();

//     // map.map((key, value) => null)
//   }
// }
