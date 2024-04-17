// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class BillsStruct extends FFFirebaseStruct {
  BillsStruct({
    String? billImage,
    String? userId,
    String? status,
    int? markedByUserToRecheck,
    int? isSuccess,
    int? number,
    int? points,
    String? userComment,
    List<ProductStruct>? products,
    double? sum,
    String? date,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _billImage = billImage,
        _userId = userId,
        _status = status,
        _markedByUserToRecheck = markedByUserToRecheck,
        _isSuccess = isSuccess,
        _number = number,
        _points = points,
        _userComment = userComment,
        _products = products,
        _sum = sum,
        _date = date,
        super(firestoreUtilData);

  // "bill_image" field.
  String? _billImage;
  String get billImage => _billImage ?? '';
  set billImage(String? val) => _billImage = val;
  bool hasBillImage() => _billImage != null;

  // "user_id" field.
  String? _userId;
  String get userId => _userId ?? '';
  set userId(String? val) => _userId = val;
  bool hasUserId() => _userId != null;

  // "status" field.
  String? _status;
  String get status => _status ?? '';
  set status(String? val) => _status = val;
  bool hasStatus() => _status != null;

  // "marked_by_user_to_recheck" field.
  int? _markedByUserToRecheck;
  int get markedByUserToRecheck => _markedByUserToRecheck ?? 0;
  set markedByUserToRecheck(int? val) => _markedByUserToRecheck = val;
  void incrementMarkedByUserToRecheck(int amount) =>
      _markedByUserToRecheck = markedByUserToRecheck + amount;
  bool hasMarkedByUserToRecheck() => _markedByUserToRecheck != null;

  // "is_success" field.
  int? _isSuccess;
  int get isSuccess => _isSuccess ?? 0;
  set isSuccess(int? val) => _isSuccess = val;
  void incrementIsSuccess(int amount) => _isSuccess = isSuccess + amount;
  bool hasIsSuccess() => _isSuccess != null;

  // "number" field.
  int? _number;
  int get number => _number ?? 0;
  set number(int? val) => _number = val;
  void incrementNumber(int amount) => _number = number + amount;
  bool hasNumber() => _number != null;

  // "points" field.
  int? _points;
  int get points => _points ?? 0;
  set points(int? val) => _points = val;
  void incrementPoints(int amount) => _points = points + amount;
  bool hasPoints() => _points != null;

  // "user_comment" field.
  String? _userComment;
  String get userComment => _userComment ?? '';
  set userComment(String? val) => _userComment = val;
  bool hasUserComment() => _userComment != null;

  // "products" field.
  List<ProductStruct>? _products;
  List<ProductStruct> get products => _products ?? const [];
  set products(List<ProductStruct>? val) => _products = val;
  void updateProducts(Function(List<ProductStruct>) updateFn) =>
      updateFn(_products ??= []);
  bool hasProducts() => _products != null;

  // "sum" field.
  double? _sum;
  double get sum => _sum ?? 0.0;
  set sum(double? val) => _sum = val;
  void incrementSum(double amount) => _sum = sum + amount;
  bool hasSum() => _sum != null;

  // "date" field.
  String? _date;
  String get date => _date ?? '';
  set date(String? val) => _date = val;
  bool hasDate() => _date != null;

  static BillsStruct fromMap(Map<String, dynamic> data) => BillsStruct(
        billImage: data['bill_image'] as String?,
        userId: data['user_id'] as String?,
        status: data['status'] as String?,
        markedByUserToRecheck:
            castToType<int>(data['marked_by_user_to_recheck']),
        isSuccess: castToType<int>(data['is_success']),
        number: castToType<int>(data['number']),
        points: castToType<int>(data['points']),
        userComment: data['user_comment'] as String?,
        products: getStructList(
          data['products'],
          ProductStruct.fromMap,
        ),
        sum: castToType<double>(data['sum']),
        date: data['date'] as String?,
      );

  static BillsStruct? maybeFromMap(dynamic data) =>
      data is Map ? BillsStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'bill_image': _billImage,
        'user_id': _userId,
        'status': _status,
        'marked_by_user_to_recheck': _markedByUserToRecheck,
        'is_success': _isSuccess,
        'number': _number,
        'points': _points,
        'user_comment': _userComment,
        'products': _products?.map((e) => e.toMap()).toList(),
        'sum': _sum,
        'date': _date,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'bill_image': serializeParam(
          _billImage,
          ParamType.String,
        ),
        'user_id': serializeParam(
          _userId,
          ParamType.String,
        ),
        'status': serializeParam(
          _status,
          ParamType.String,
        ),
        'marked_by_user_to_recheck': serializeParam(
          _markedByUserToRecheck,
          ParamType.int,
        ),
        'is_success': serializeParam(
          _isSuccess,
          ParamType.int,
        ),
        'number': serializeParam(
          _number,
          ParamType.int,
        ),
        'points': serializeParam(
          _points,
          ParamType.int,
        ),
        'user_comment': serializeParam(
          _userComment,
          ParamType.String,
        ),
        'products': serializeParam(
          _products,
          ParamType.DataStruct,
          true,
        ),
        'sum': serializeParam(
          _sum,
          ParamType.double,
        ),
        'date': serializeParam(
          _date,
          ParamType.String,
        ),
      }.withoutNulls;

  static BillsStruct fromSerializableMap(Map<String, dynamic> data) =>
      BillsStruct(
        billImage: deserializeParam(
          data['bill_image'],
          ParamType.String,
          false,
        ),
        userId: deserializeParam(
          data['user_id'],
          ParamType.String,
          false,
        ),
        status: deserializeParam(
          data['status'],
          ParamType.String,
          false,
        ),
        markedByUserToRecheck: deserializeParam(
          data['marked_by_user_to_recheck'],
          ParamType.int,
          false,
        ),
        isSuccess: deserializeParam(
          data['is_success'],
          ParamType.int,
          false,
        ),
        number: deserializeParam(
          data['number'],
          ParamType.int,
          false,
        ),
        points: deserializeParam(
          data['points'],
          ParamType.int,
          false,
        ),
        userComment: deserializeParam(
          data['user_comment'],
          ParamType.String,
          false,
        ),
        products: deserializeStructParam<ProductStruct>(
          data['products'],
          ParamType.DataStruct,
          true,
          structBuilder: ProductStruct.fromSerializableMap,
        ),
        sum: deserializeParam(
          data['sum'],
          ParamType.double,
          false,
        ),
        date: deserializeParam(
          data['date'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'BillsStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    const listEquality = ListEquality();
    return other is BillsStruct &&
        billImage == other.billImage &&
        userId == other.userId &&
        status == other.status &&
        markedByUserToRecheck == other.markedByUserToRecheck &&
        isSuccess == other.isSuccess &&
        number == other.number &&
        points == other.points &&
        userComment == other.userComment &&
        listEquality.equals(products, other.products) &&
        sum == other.sum &&
        date == other.date;
  }

  @override
  int get hashCode => const ListEquality().hash([
        billImage,
        userId,
        status,
        markedByUserToRecheck,
        isSuccess,
        number,
        points,
        userComment,
        products,
        sum,
        date
      ]);
}

BillsStruct createBillsStruct({
  String? billImage,
  String? userId,
  String? status,
  int? markedByUserToRecheck,
  int? isSuccess,
  int? number,
  int? points,
  String? userComment,
  double? sum,
  String? date,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    BillsStruct(
      billImage: billImage,
      userId: userId,
      status: status,
      markedByUserToRecheck: markedByUserToRecheck,
      isSuccess: isSuccess,
      number: number,
      points: points,
      userComment: userComment,
      sum: sum,
      date: date,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

BillsStruct? updateBillsStruct(
  BillsStruct? bills, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    bills
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addBillsStructData(
  Map<String, dynamic> firestoreData,
  BillsStruct? bills,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (bills == null) {
    return;
  }
  if (bills.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && bills.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final billsData = getBillsFirestoreData(bills, forFieldValue);
  final nestedData = billsData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = bills.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getBillsFirestoreData(
  BillsStruct? bills, [
  bool forFieldValue = false,
]) {
  if (bills == null) {
    return {};
  }
  final firestoreData = mapToFirestore(bills.toMap());

  // Add any Firestore field values
  bills.firestoreUtilData.fieldValues.forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getBillsListFirestoreData(
  List<BillsStruct>? billss,
) =>
    billss?.map((e) => getBillsFirestoreData(e, true)).toList() ?? [];
