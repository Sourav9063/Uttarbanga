import 'dart:io';

import 'package:Uttarbanga/GlobalVar.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_picker/image_picker.dart';

class UploadIMG {
  static PickedFile pickedImage;
  static File imageUser;
  static File imageBook;

  final _picker = ImagePicker();

  Future<File> getPicGallery() async {
    pickedImage = await _picker.getImage(
        source: ImageSource.gallery,
        imageQuality: 80,
        maxHeight: 1080,
        maxWidth: 1080);
    imageUser = File(pickedImage.path);
    return imageUser;
    // String dir = (await getApplicationDocumentsDirectory()).path;
    // String newPath = path.join(dir, 'case01wd03id01.jpg');
    // imageUser = await File(pickedImage.path).copy(newPath);
  }

  Future<File> getPicCamera() async {
    pickedImage = await _picker.getImage(
        source: ImageSource.camera,
        imageQuality: 80,
        maxHeight: 1080,
        maxWidth: 1080);
    imageBook = File(pickedImage.path);
    return imageBook;
  }

  uploadProfilePic(String phoneNumber, bool cam) async {
    String tmpid = UsefulFunc.getSetMillisecondsId();
    File pic;
    if (cam) {
      pic = await getPicCamera();
    } else
      pic = await getPicGallery();

    Reference userPic = FirebaseStorage.instance
        .ref()
        .child('Menbers')
        .child(phoneNumber)
        .child(tmpid);

    await userPic.putFile(pic).whenComplete(() => null);
    return await userPic.getDownloadURL();
  }

  // uploadBookPic(String email, String id) async {
  //   StorageReference bookPic = FirebaseStorage.instance
  //       .ref()
  //       .child('Books')
  //       .child('Upload')
  //       .child(email)
  //       // .child(id)
  //       .child(id);
  //   await bookPic.putFile(imageBook).onComplete;
  //   // print('upload Complete book');
  //   return await bookPic.getDownloadURL();
  // }

  // uploadRequstPic(String email, String id) async {
  //   StorageReference bookPic = FirebaseStorage.instance
  //       .ref()
  //       .child('Books')
  //       .child('Request')
  //       .child(email)
  //       // .child(id)
  //       .child(id);
  //   await bookPic.putFile(imageUser).onComplete;
  //   // print('upload Complete book');
  //   return await bookPic.getDownloadURL();
  // }
}
