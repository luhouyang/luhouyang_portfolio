import 'package:firebase_storage/firebase_storage.dart';

class StorageServices {
  late final Reference firebaseStorage;
  late final Reference projectStrRef;
  late final Reference storiesStrRef;

  StorageServices() {
    firebaseStorage = FirebaseStorage.instance.ref();
    projectStrRef = firebaseStorage.child("Projects");
    storiesStrRef = firebaseStorage.child("Stories");
  }
}
