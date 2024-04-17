// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class BillsResStruct extends FFFirebaseStruct {
  BillsResStruct({
    List<BillsStruct>? data,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _data = data,
        super(firestoreUtilData);

  // "data" field.
  List<BillsStruct>? _data;
  List<BillsStruct> get data => _data ?? const [];
  set data(List<BillsStruct>? val) => _data = val;
  void updateData(Function(List<BillsStruct>) updateFn) =>
      updateFn(_data ??= []);
  bool hasData() => _data != null;

  static BillsResStruct fromMap(Map<String, dynamic> data) => BillsResStruct(
        data: getStructList(
          data['data'],
          BillsStruct.fromMap,
        ),
      );

  static BillsResStruct? maybeFromMap(dynamic data) =>
      data is Map ? BillsResStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'data': _data?.map((e) => e.toMap()).toList(),
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'data': serializeParam(
          _data,
          ParamType.DataStruct,
          true,
        ),
      }.withoutNulls;

  static BillsResStruct fromSerializableMap(Map<String, dynamic> data) =>
      BillsResStruct(
        data: deserializeStructParam<BillsStruct>(
          data['data'],
          ParamType.DataStruct,
          true,
          structBuilder: BillsStruct.fromSerializableMap,
        ),
      );

  @override
  String toString() => 'BillsResStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    const listEquality = ListEquality();
    return other is BillsResStruct && listEquality.equals(data, other.data);
  }

  @override
  int get hashCode => const ListEquality().hash([data]);
}

BillsResStruct createBillsResStruct({
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    BillsResStruct(
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

BillsResStruct? updateBillsResStruct(
  BillsResStruct? billsRes, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    billsRes
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addBillsResStructData(
  Map<String, dynamic> firestoreData,
  BillsResStruct? billsRes,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (billsRes == null) {
    return;
  }
  if (billsRes.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && billsRes.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final billsResData = getBillsResFirestoreData(billsRes, forFieldValue);
  final nestedData = billsResData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = billsRes.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getBillsResFirestoreData(
  BillsResStruct? billsRes, [
  bool forFieldValue = false,
]) {
  if (billsRes == null) {
    return {};
  }
  final firestoreData = mapToFirestore(billsRes.toMap());

  // Add any Firestore field values
  billsRes.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getBillsResListFirestoreData(
  List<BillsResStruct>? billsRess,
) =>
    billsRess?.map((e) => getBillsResFirestoreData(e, true)).toList() ?? [];
