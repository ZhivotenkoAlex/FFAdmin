import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';

class ExternalFilloutRecord extends FirestoreRecord {
  ExternalFilloutRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "id" field.
  String? _id;
  String get id => _id ?? '';
  bool hasId() => _id != null;

  // "external_id" field.
  String? _externalId;
  String get externalId => _externalId ?? '';
  bool hasExternalId() => _externalId != null;

  // "company_id" field.
  String? _companyId;
  String get companyId => _companyId ?? '';
  bool hasCompanyId() => _companyId != null;

  void _initializeFields() {
    _id = snapshotData['id'] as String?;
    _externalId = snapshotData['external_id'] as String?;
    _companyId = snapshotData['company_id'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('externalFillout');

  static Stream<ExternalFilloutRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => ExternalFilloutRecord.fromSnapshot(s));

  static Future<ExternalFilloutRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => ExternalFilloutRecord.fromSnapshot(s));

  static ExternalFilloutRecord fromSnapshot(DocumentSnapshot snapshot) =>
      ExternalFilloutRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static ExternalFilloutRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      ExternalFilloutRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'ExternalFilloutRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is ExternalFilloutRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createExternalFilloutRecordData({
  String? id,
  String? externalId,
  String? companyId,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'id': id,
      'external_id': externalId,
      'company_id': companyId,
    }.withoutNulls,
  );

  return firestoreData;
}

class ExternalFilloutRecordDocumentEquality
    implements Equality<ExternalFilloutRecord> {
  const ExternalFilloutRecordDocumentEquality();

  @override
  bool equals(ExternalFilloutRecord? e1, ExternalFilloutRecord? e2) {
    return e1?.id == e2?.id &&
        e1?.externalId == e2?.externalId &&
        e1?.companyId == e2?.companyId;
  }

  @override
  int hash(ExternalFilloutRecord? e) =>
      const ListEquality().hash([e?.id, e?.externalId, e?.companyId]);

  @override
  bool isValidKey(Object? o) => o is ExternalFilloutRecord;
}
