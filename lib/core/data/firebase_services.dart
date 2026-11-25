import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:evently/features/events/models/event_model.dart';

class firebase_services {
  static CollectionReference<EventModel> getcollection() => FirebaseFirestore
      .instance
      .collection('events')
      .withConverter<EventModel>(
        fromFirestore: (snapshot, _) => EventModel.FormJson(snapshot.data()!),
        toFirestore: (event, _) => event.toJson(),
      );
  static Future<void> createEvent(EventModel event)  {
    CollectionReference<EventModel> collection = getcollection();
    DocumentReference<EventModel> doc=collection.doc();
    event.id=doc.id; 
    return doc.set(event);
  }
  static Future<List<EventModel>> getevent()async{
 CollectionReference<EventModel> collection = getcollection();
 QuerySnapshot<EventModel> querySnapshot =await collection.orderBy('date').get();
  return querySnapshot.docs.map((docSnapshot) => docSnapshot.data()).toList();
  }

}
