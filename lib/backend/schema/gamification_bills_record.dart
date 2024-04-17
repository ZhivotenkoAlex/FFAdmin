import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';

class GamificationBillsRecord extends FirestoreRecord {
  GamificationBillsRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "id" field.
  String? _id;
  String get id => _id ?? '';
  bool hasId() => _id != null;

  // "companyId" field.
  String? _companyId;
  String get companyId => _companyId ?? '';
  bool hasCompanyId() => _companyId != null;

  // "api_id" field.
  String? _apiId;
  String get apiId => _apiId ?? '';
  bool hasApiId() => _apiId != null;

  void _initializeFields() {
    _id = snapshotData['id'] as String?;
    _companyId = snapshotData['companyId'] as String?;
    _apiId = snapshotData['api_id'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('gamificationBills');

  static Stream<GamificationBillsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => GamificationBillsRecord.fromSnapshot(s));

  static Future<GamificationBillsRecord> getDocumentOnce(
          DocumentReference ref) =>
      ref.get().then((s) => GamificationBillsRecord.fromSnapshot(s));

  static GamificationBillsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      GamificationBillsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static GamificationBillsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      GamificationBillsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'GamificationBillsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is GamificationBillsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createGamificationBillsRecordData({
  String? id,
  String? companyId,
  String? apiId,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'id': id,
      'companyId': companyId,
      'api_id': apiId,
    }.withoutNulls,
  );

  return firestoreData;
}

class GamificationBillsRecordDocumentEquality
    implements Equality<GamificationBillsRecord> {
  const GamificationBillsRecordDocumentEquality();

  @override
  bool equals(GamificationBillsRecord? e1, GamificationBillsRecord? e2) {
    return e1?.id == e2?.id &&
        e1?.companyId == e2?.companyId &&
        e1?.apiId == e2?.apiId;
  }

  @override
  int hash(GamificationBillsRecord? e) =>
      const ListEquality().hash([e?.id, e?.companyId, e?.apiId]);

  @override
  bool isValidKey(Object? o) => o is GamificationBillsRecord;
}
