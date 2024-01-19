import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreServices {
  late final FirebaseFirestore firebaseFirestore;
  late final CollectionReference projectsRef;
  late final CollectionReference storiesRef;

  FirestoreServices() {
    firebaseFirestore = FirebaseFirestore.instance;
    projectsRef = firebaseFirestore.collection("Projects");
    storiesRef = firebaseFirestore.collection("Stories");
  }
}
