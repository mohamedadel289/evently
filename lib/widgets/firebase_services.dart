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
 static Future<UserModel?> loginwithGoogle() async {
  // 1. السطر ده هو اللي بيفتح Bottom Sheet لاختيار الإيميل من الجهاز
  final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
  
  // لو المستخدم قفل الشاشة بدون ما يختار إيميل
  if (googleUser == null) return null;

  // 2. استخراج التوكن للتوثيق مع فايربيز
  final GoogleSignInAuthentication googleAuth = await googleUser.authentication;
  final AuthCredential credential = GoogleAuthProvider.credential(
    accessToken: googleAuth.accessToken,
    idToken: googleAuth.idToken,
  );

  // 3. إتمام الدخول في FirebaseAuth
  UserCredential userCredential =
      await FirebaseAuth.instance.signInWithCredential(credential);

  // 4. جلب أو حفظ بيانات اليوزر في Firestore
  final usercollection = getusercollection();
  final docSnapshot = await usercollection.doc(userCredential.user!.uid).get();

  if (!docSnapshot.exists || docSnapshot.data() == null) {
    final fallbackUser = UserModel(
      id: userCredential.user!.uid,
      name: userCredential.user!.displayName ??
          googleUser.displayName ??
          (userCredential.user!.email ?? '').split('@').first,
      email: userCredential.user!.email ?? googleUser.email,
      favoriteeventID: [],
    );
    await usercollection.doc(fallbackUser.id).set(fallbackUser);
    return fallbackUser;
  }

  return docSnapshot.data()!;
}
}
