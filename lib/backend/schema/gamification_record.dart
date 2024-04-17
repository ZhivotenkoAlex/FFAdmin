import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class GamificationRecord extends FirestoreRecord {
  GamificationRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "bill_allow_fv" field.
  int? _billAllowFv;
  int get billAllowFv => _billAllowFv ?? 0;
  bool hasBillAllowFv() => _billAllowFv != null;

  // "bill_embed_domain" field.
  String? _billEmbedDomain;
  String get billEmbedDomain => _billEmbedDomain ?? '';
  bool hasBillEmbedDomain() => _billEmbedDomain != null;

  // "company_id" field.
  String? _companyId;
  String get companyId => _companyId ?? '';
  bool hasCompanyId() => _companyId != null;

  // "gamification_type" field.
  String? _gamificationType;
  String get gamificationType => _gamificationType ?? '';
  bool hasGamificationType() => _gamificationType != null;

  // "id" field.
  String? _id;
  String get id => _id ?? '';
  bool hasId() => _id != null;

  // "is_off" field.
  int? _isOff;
  int get isOff => _isOff ?? 0;
  bool hasIsOff() => _isOff != null;

  // "total_limit" field.
  int? _totalLimit;
  int get totalLimit => _totalLimit ?? 0;
  bool hasTotalLimit() => _totalLimit != null;

  // "used_limit" field.
  int? _usedLimit;
  int get usedLimit => _usedLimit ?? 0;
  bool hasUsedLimit() => _usedLimit != null;

  // "gamification_bill" field.
  DocumentReference? _gamificationBill;
  DocumentReference? get gamificationBill => _gamificationBill;
  bool hasGamificationBill() => _gamificationBill != null;

  void _initializeFields() {
    _billAllowFv = castToType<int>(snapshotData['bill_allow_fv']);
    _billEmbedDomain = snapshotData['bill_embed_domain'] as String?;
    _companyId = snapshotData['company_id'] as String?;
    _gamificationType = snapshotData['gamification_type'] as String?;
    _id = snapshotData['id'] as String?;
    _isOff = castToType<int>(snapshotData['is_off']);
    _totalLimit = castToType<int>(snapshotData['total_limit']);
    _usedLimit = castToType<int>(snapshotData['used_limit']);
    _gamificationBill = snapshotData['gamification_bill'] as DocumentReference?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('gamification');

  static Stream<GamificationRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => GamificationRecord.fromSnapshot(s));

  static Future<GamificationRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => GamificationRecord.fromSnapshot(s));

  static GamificationRecord fromSnapshot(DocumentSnapshot snapshot) =>
      GamificationRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static GamificationRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      GamificationRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'GamificationRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is GamificationRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createGamificationRecordData({
  int? billAllowFv,
  String? billEmbedDomain,
  String? companyId,
  String? gamificationType,
  String? id,
  int? isOff,
  int? totalLimit,
  int? usedLimit,
  DocumentReference? gamificationBill,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'bill_allow_fv': billAllowFv,
      'bill_embed_domain': billEmbedDomain,
      'company_id': companyId,
      'gamification_type': gamificationType,
      'id': id,
      'is_off': isOff,
      'total_limit': totalLimit,
      'used_limit': usedLimit,
      'gamification_bill': gamificationBill,
    }.withoutNulls,
  );

  return firestoreData;
}

class GamificationRecordDocumentEquality
    implements Equality<GamificationRecord> {
  const GamificationRecordDocumentEquality();

  @override
  bool equals(GamificationRecord? e1, GamificationRecord? e2) {
    return e1?.billAllowFv == e2?.billAllowFv &&
        e1?.billEmbedDomain == e2?.billEmbedDomain &&
        e1?.companyId == e2?.companyId &&
        e1?.gamificationType == e2?.gamificationType &&
        e1?.id == e2?.id &&
        e1?.isOff == e2?.isOff &&
        e1?.totalLimit == e2?.totalLimit &&
        e1?.usedLimit == e2?.usedLimit &&
        e1?.gamificationBill == e2?.gamificationBill;
  }

  @override
  int hash(GamificationRecord? e) => const ListEquality().hash([
        e?.billAllowFv,
        e?.billEmbedDomain,
        e?.companyId,
        e?.gamificationType,
        e?.id,
        e?.isOff,
        e?.totalLimit,
        e?.usedLimit,
        e?.gamificationBill
      ]);

  @override
  bool isValidKey(Object? o) => o is GamificationRecord;
}
