import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:evently/models/Event_Model.dart';
import 'package:evently/models/user_model.dart';
import 'package:firebase_auth/firebase_auth.dart';

class firebase_services {
  static CollectionReference<EventModel> getcollection() => FirebaseFirestore
      .instance
      .collection('events')
      .withConverter<EventModel>(
        fromFirestore: (snapshot, _) => EventModel.FormJson(snapshot.data()!),
        toFirestore: (event, _) => event.toJson(),
      );
  static CollectionReference<UserModel> getusercollection() => FirebaseFirestore
      .instance
      .collection('users')
      .withConverter<UserModel>(
        fromFirestore: (snapshot, _) => UserModel.FormJson(snapshot.data()!),
        toFirestore: (user, _) => user.toJson(),
      );

  static Future<void> createEvent(EventModel event) {
    CollectionReference<EventModel> collection = getcollection();
    DocumentReference<EventModel> doc = collection.doc();
    event.id = doc.id;
    return doc.set(event);
  }

  static Future<List<EventModel>> getevent() async {
    CollectionReference<EventModel> collection = getcollection();
    QuerySnapshot<EventModel> querySnapshot = await collection
        .orderBy('date')
        .get();
    return querySnapshot.docs.map((docSnapshot) => docSnapshot.data()).toList();
  }

  static Future<UserModel> register({
    required String name,
    required String email,
    required String password,
  }) async {
    UserCredential credential = await FirebaseAuth.instance
        .createUserWithEmailAndPassword(email: email, password: password);
    CollectionReference<UserModel> usercollection = getusercollection();
    UserModel user = UserModel(
      id: credential.user!.uid,
      name: name,
      email: email,
    );
    await usercollection.doc(user.id).set(user);
    return user;
  }

 static Future<UserModel> login({
    required String email,
    required String password,
  }) async {
    UserCredential credential = await FirebaseAuth.instance
        .signInWithEmailAndPassword(email: email, password: password);
    CollectionReference<UserModel> usercollection = getusercollection();
    DocumentSnapshot<UserModel> docSnapshot = await usercollection
        .doc(credential.user!.uid)
        .get();
    return docSnapshot.data()!;
  }
}
