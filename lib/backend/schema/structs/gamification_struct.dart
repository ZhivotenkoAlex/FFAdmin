// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import '/flutter_flow/flutter_flow_util.dart';

class GamificationStruct extends FFFirebaseStruct {
  GamificationStruct({
    String? id,
    String? start,
    String? finish,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _id = id,
        _start = start,
        _finish = finish,
        super(firestoreUtilData);

  // "id" field.
  String? _id;
  String get id => _id ?? '';
  set id(String? val) => _id = val;
  bool hasId() => _id != null;

  // "start" field.
  String? _start;
  String get start => _start ?? '';
  set start(String? val) => _start = val;
  bool hasStart() => _start != null;

  // "finish" field.
  String? _finish;
  String get finish => _finish ?? '';
  set finish(String? val) => _finish = val;
  bool hasFinish() => _finish != null;

  static GamificationStruct fromMap(Map<String, dynamic> data) =>
      GamificationStruct(
        id: data['id'] as String?,
        start: data['start'] as String?,
        finish: data['finish'] as String?,
      );

  static GamificationStruct? maybeFromMap(dynamic data) => data is Map
      ? GamificationStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'id': _id,
        'start': _start,
        'finish': _finish,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'id': serializeParam(
          _id,
          ParamType.String,
        ),
        'start': serializeParam(
          _start,
          ParamType.String,
        ),
        'finish': serializeParam(
          _finish,
          ParamType.String,
        ),
      }.withoutNulls;

  static GamificationStruct fromSerializableMap(Map<String, dynamic> data) =>
      GamificationStruct(
        id: deserializeParam(
          data['id'],
          ParamType.String,
          false,
        ),
        start: deserializeParam(
          data['start'],
          ParamType.String,
          false,
        ),
        finish: deserializeParam(
          data['finish'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'GamificationStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is GamificationStruct &&
        id == other.id &&
        start == other.start &&
        finish == other.finish;
  }

  @override
  int get hashCode => const ListEquality().hash([id, start, finish]);
}

GamificationStruct createGamificationStruct({
  String? id,
  String? start,
  String? finish,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    GamificationStruct(
      id: id,
      start: start,
      finish: finish,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

GamificationStruct? updateGamificationStruct(
  GamificationStruct? gamification, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    gamification
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addGamificationStructData(
  Map<String, dynamic> firestoreData,
  GamificationStruct? gamification,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (gamification == null) {
    return;
  }
  if (gamification.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && gamification.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final gamificationData =
      getGamificationFirestoreData(gamification, forFieldValue);
  final nestedData =
      gamificationData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = gamification.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getGamificationFirestoreData(
  GamificationStruct? gamification, [
  bool forFieldValue = false,
]) {
  if (gamification == null) {
    return {};
  }
  final firestoreData = mapToFirestore(gamification.toMap());

  // Add any Firestore field values
  gamification.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getGamificationListFirestoreData(
  List<GamificationStruct>? gamifications,
) =>
    gamifications?.map((e) => getGamificationFirestoreData(e, true)).toList() ??
    [];
