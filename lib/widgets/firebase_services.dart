import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:evently/models/Event_Model.dart';
import 'package:evently/models/user_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

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

  static Future<void> logout() async => await FirebaseAuth.instance.signOut();

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
      favoriteeventID: [],
    );
    await usercollection.doc(user.id).set(user);
    return user;
  }

  static Future<UserModel> login({
    required String email,
    required String password,
  }) async {
    final trimmedEmail = email.trim();
    final trimmedPassword = password.trim();

    UserCredential credential = await FirebaseAuth.instance
        .signInWithEmailAndPassword(
          email: trimmedEmail,
          password: trimmedPassword,
        );

    CollectionReference<UserModel> usercollection = getusercollection();
    DocumentSnapshot<UserModel> docSnapshot = await usercollection
        .doc(credential.user!.uid)
        .get();

    if (!docSnapshot.exists || docSnapshot.data() == null) {
      final fallbackUser = UserModel(
        id: credential.user!.uid,
        name:
            credential.user!.displayName ??
            (credential.user!.email ?? trimmedEmail).split('@').first,
        email: credential.user!.email ?? trimmedEmail,
        favoriteeventID: [],
      );
      await usercollection.doc(fallbackUser.id).set(fallbackUser);
      return fallbackUser;
    }

    return docSnapshot.data()!;
  }

  static Future<void> addtoEventFavorites(eventId) async {
    CollectionReference<UserModel> usercollection = getusercollection();
    DocumentReference<UserModel> userDoc = usercollection.doc(
      FirebaseAuth.instance.currentUser!.uid,
    );
    userDoc.update({
      'favoriteeventID': FieldValue.arrayUnion([eventId]),
    });
  }

  static Future<void> removeEventFromFavorites(eventId) async {
    CollectionReference<UserModel> usercollection = getusercollection();
    DocumentReference<UserModel> userDoc = usercollection.doc(
      FirebaseAuth.instance.currentUser!.uid,
    );
    userDoc.update({
      'favoriteeventID': FieldValue.arrayRemove([eventId]),
    });
  }

  static Future<User?> _googleAuth() async {
    final googleSignIn = GoogleSignIn();
    // Clear the cached Google account so the account picker is shown each time.
    await googleSignIn.signOut();
    final googleUser = await googleSignIn.signIn();
    if (googleUser == null) return null;

    final auth = await googleUser.authentication;
    final credential = GoogleAuthProvider.credential(
      accessToken: auth.accessToken,
      idToken: auth.idToken,
    );
    return (await FirebaseAuth.instance.signInWithCredential(credential)).user;
  }

  static Future<UserModel?> loginwithGoogle() async {
    final user = await _googleAuth();
    if (user == null) return null;

    final ref = getusercollection().doc(user.uid);
    final doc = await ref.get();
    if (doc.exists && doc.data() != null) return doc.data();

    final newUser = UserModel(
      id: user.uid,
      name: user.displayName ?? user.email?.split('@').first ?? '',
      email: user.email ?? '',
      favoriteeventID: [],
    );
    await ref.set(newUser);
    return newUser;
  }

  static Future<UserModel?> signupwithGoogle() async {
    final user = await _googleAuth();
    if (user == null) return null;

    final ref = getusercollection().doc(user.uid);
    final doc = await ref.get();
    if (doc.exists) return doc.data(); //

    final newUser = UserModel(
      id: user.uid,
      name: user.displayName ?? '',
      email: user.email ?? '',
      favoriteeventID: [],
    );
    await ref.set(newUser);
    return newUser;
  }
}
