import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:notes_and_events/repository/event/model/event_entity.dart';

class FirebaseDatabase {
  FirebaseFirestore db = FirebaseFirestore.instance;

  Stream<List<EventEntity>> getEvents() =>
      db.collection('events').snapshots().map((snapshot) => snapshot.docs
          .map((doc) => EventEntity.fromJson(doc.data()))
          .toList());

  Future<void> addEvent(EventEntity event) async {
    await FirebaseFirestore.instance
        .collection('events')
        .add(event.toJson())
        .then((value) => print('Event Added'))
        .catchError((error) => print('Failed to add event: $error'));
  }

  Future<void> updateEvent(EventEntity event) async {
    QuerySnapshot query = await FirebaseFirestore.instance
        .collection('events')
        .where('id', isEqualTo: event.id)
        .get();

    await FirebaseFirestore.instance
        .collection('events')
        .doc(query.docs.first.id)
        .update(event.toJson())
        .then((_) => print('Event Updated'))
        .catchError((error) => print('Failed to update event: $error'));
  }

  Future<void> deleteById(String id) async {
    await FirebaseFirestore.instance
        .collection('events')
        .where('id', isEqualTo: id)
        .get()
        .then((value) {
      for (var element in value.docs) {
        FirebaseFirestore.instance
            .collection('events')
            .doc(element.id)
            .delete();
      }
    });
  }
}
