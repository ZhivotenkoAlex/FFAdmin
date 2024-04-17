import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';

class GuestUserRecord extends FirestoreRecord {
  GuestUserRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "id" field.
  String? _id;
  String get id => _id ?? '';
  bool hasId() => _id != null;

  // "token" field.
  String? _token;
  String get token => _token ?? '';
  bool hasToken() => _token != null;

  void _initializeFields() {
    _id = snapshotData['id'] as String?;
    _token = snapshotData['token'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('guestUser');

  static Stream<GuestUserRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => GuestUserRecord.fromSnapshot(s));

  static Future<GuestUserRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => GuestUserRecord.fromSnapshot(s));

  static GuestUserRecord fromSnapshot(DocumentSnapshot snapshot) =>
      GuestUserRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static GuestUserRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      GuestUserRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'GuestUserRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is GuestUserRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createGuestUserRecordData({
  String? id,
  String? token,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'id': id,
      'token': token,
    }.withoutNulls,
  );

  return firestoreData;
}

class GuestUserRecordDocumentEquality implements Equality<GuestUserRecord> {
  const GuestUserRecordDocumentEquality();

  @override
  bool equals(GuestUserRecord? e1, GuestUserRecord? e2) {
    return e1?.id == e2?.id && e1?.token == e2?.token;
  }

  @override
  int hash(GuestUserRecord? e) => const ListEquality().hash([e?.id, e?.token]);

  @override
  bool isValidKey(Object? o) => o is GuestUserRecord;
}
