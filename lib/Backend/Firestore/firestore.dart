import 'package:Uttarbanga/GlobalVar.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';

class UttarbangaFirestore {
  final _userCollRef = FirebaseFirestore.instance.collection(Allkeys.requestCol);

  getDocumentsFromDocID(String docID) async {
    _userCollRef.get().then((value) => print(value.docs));
    _userCollRef.doc(docID).get().then((value) {
      print(value.data().keys.toList());
    });
  }
}

class GetObjects {
  getUserObjectsFromDocSnapshot(DocumentSnapshot documentSnapshot) {
    Map<String, dynamic> map = documentSnapshot.data();

    // map.map((key, value) => null)
  }
}
