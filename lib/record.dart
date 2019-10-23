import 'package:cloud_firestore/cloud_firestore.dart';

class Record {
  final String name;
  final String responsable;
  final DocumentReference reference;

  Record.fromMap(Map<String, dynamic> map, {this.reference})
      : assert(map['name'] != null),
        assert(map['responsable'] != null),
        name = map['name'],
        responsable = map['responsable'];

  Record.fromSnapshot(DocumentSnapshot snapshot)
      : this.fromMap(snapshot.data, reference: snapshot.reference);

  @override
  String toString() => "Record<$name:$responsable>";
}
