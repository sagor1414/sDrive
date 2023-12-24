import 'package:cloud_firestore/cloud_firestore.dart';

//collection name
CollectionReference<Map<String, dynamic>> userCollection =
    FirebaseFirestore.instance.collection('users');
