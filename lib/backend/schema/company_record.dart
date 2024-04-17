import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';

class CompanyRecord extends FirestoreRecord {
  CompanyRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "id" field.
  String? _id;
  String get id => _id ?? '';
  bool hasId() => _id != null;

  // "url_name" field.
  String? _urlName;
  String get urlName => _urlName ?? '';
  bool hasUrlName() => _urlName != null;

  // "domain" field.
  String? _domain;
  String get domain => _domain ?? '';
  bool hasDomain() => _domain != null;

  // "gamification" field.
  DocumentReference? _gamification;
  DocumentReference? get gamification => _gamification;
  bool hasGamification() => _gamification != null;

  // "external_fillout" field.
  DocumentReference? _externalFillout;
  DocumentReference? get externalFillout => _externalFillout;
  bool hasExternalFillout() => _externalFillout != null;

  void _initializeFields() {
    _id = snapshotData['id'] as String?;
    _urlName = snapshotData['url_name'] as String?;
    _domain = snapshotData['domain'] as String?;
    _gamification = snapshotData['gamification'] as DocumentReference?;
    _externalFillout = snapshotData['external_fillout'] as DocumentReference?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('company');

  static Stream<CompanyRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => CompanyRecord.fromSnapshot(s));

  static Future<CompanyRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => CompanyRecord.fromSnapshot(s));

  static CompanyRecord fromSnapshot(DocumentSnapshot snapshot) =>
      CompanyRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static CompanyRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      CompanyRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'CompanyRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is CompanyRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createCompanyRecordData({
  String? id,
  String? urlName,
  String? domain,
  DocumentReference? gamification,
  DocumentReference? externalFillout,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'id': id,
      'url_name': urlName,
      'domain': domain,
      'gamification': gamification,
      'external_fillout': externalFillout,
    }.withoutNulls,
  );

  return firestoreData;
}

class CompanyRecordDocumentEquality implements Equality<CompanyRecord> {
  const CompanyRecordDocumentEquality();

  @override
  bool equals(CompanyRecord? e1, CompanyRecord? e2) {
    return e1?.id == e2?.id &&
        e1?.urlName == e2?.urlName &&
        e1?.domain == e2?.domain &&
        e1?.gamification == e2?.gamification &&
        e1?.externalFillout == e2?.externalFillout;
  }

  @override
  int hash(CompanyRecord? e) => const ListEquality().hash(
      [e?.id, e?.urlName, e?.domain, e?.gamification, e?.externalFillout]);

  @override
  bool isValidKey(Object? o) => o is CompanyRecord;
}
