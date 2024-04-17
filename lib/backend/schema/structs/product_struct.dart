// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ProductStruct extends FFFirebaseStruct {
  ProductStruct({
    String? name,
    int? number,
    String? vatCode,
    double? priceSingle,
    double? priceTotal,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _name = name,
        _number = number,
        _vatCode = vatCode,
        _priceSingle = priceSingle,
        _priceTotal = priceTotal,
        super(firestoreUtilData);

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  set name(String? val) => _name = val;
  bool hasName() => _name != null;

  // "number" field.
  int? _number;
  int get number => _number ?? 0;
  set number(int? val) => _number = val;
  void incrementNumber(int amount) => _number = number + amount;
  bool hasNumber() => _number != null;

  // "vat_code" field.
  String? _vatCode;
  String get vatCode => _vatCode ?? '';
  set vatCode(String? val) => _vatCode = val;
  bool hasVatCode() => _vatCode != null;

  // "price_single" field.
  double? _priceSingle;
  double get priceSingle => _priceSingle ?? 0.0;
  set priceSingle(double? val) => _priceSingle = val;
  void incrementPriceSingle(double amount) =>
      _priceSingle = priceSingle + amount;
  bool hasPriceSingle() => _priceSingle != null;

  // "price_total" field.
  double? _priceTotal;
  double get priceTotal => _priceTotal ?? 0.0;
  set priceTotal(double? val) => _priceTotal = val;
  void incrementPriceTotal(double amount) => _priceTotal = priceTotal + amount;
  bool hasPriceTotal() => _priceTotal != null;

  static ProductStruct fromMap(Map<String, dynamic> data) => ProductStruct(
        name: data['name'] as String?,
        number: castToType<int>(data['number']),
        vatCode: data['vat_code'] as String?,
        priceSingle: castToType<double>(data['price_single']),
        priceTotal: castToType<double>(data['price_total']),
      );

  static ProductStruct? maybeFromMap(dynamic data) =>
      data is Map ? ProductStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'name': _name,
        'number': _number,
        'vat_code': _vatCode,
        'price_single': _priceSingle,
        'price_total': _priceTotal,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'name': serializeParam(
          _name,
          ParamType.String,
        ),
        'number': serializeParam(
          _number,
          ParamType.int,
        ),
        'vat_code': serializeParam(
          _vatCode,
          ParamType.String,
        ),
        'price_single': serializeParam(
          _priceSingle,
          ParamType.double,
        ),
        'price_total': serializeParam(
          _priceTotal,
          ParamType.double,
        ),
      }.withoutNulls;

  static ProductStruct fromSerializableMap(Map<String, dynamic> data) =>
      ProductStruct(
        name: deserializeParam(
          data['name'],
          ParamType.String,
          false,
        ),
        number: deserializeParam(
          data['number'],
          ParamType.int,
          false,
        ),
        vatCode: deserializeParam(
          data['vat_code'],
          ParamType.String,
          false,
        ),
        priceSingle: deserializeParam(
          data['price_single'],
          ParamType.double,
          false,
        ),
        priceTotal: deserializeParam(
          data['price_total'],
          ParamType.double,
          false,
        ),
      );

  @override
  String toString() => 'ProductStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is ProductStruct &&
        name == other.name &&
        number == other.number &&
        vatCode == other.vatCode &&
        priceSingle == other.priceSingle &&
        priceTotal == other.priceTotal;
  }

  @override
  int get hashCode => const ListEquality()
      .hash([name, number, vatCode, priceSingle, priceTotal]);
}

ProductStruct createProductStruct({
  String? name,
  int? number,
  String? vatCode,
  double? priceSingle,
  double? priceTotal,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    ProductStruct(
      name: name,
      number: number,
      vatCode: vatCode,
      priceSingle: priceSingle,
      priceTotal: priceTotal,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

ProductStruct? updateProductStruct(
  ProductStruct? product, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    product
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addProductStructData(
  Map<String, dynamic> firestoreData,
  ProductStruct? product,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (product == null) {
    return;
  }
  if (product.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && product.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final productData = getProductFirestoreData(product, forFieldValue);
  final nestedData = productData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = product.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getProductFirestoreData(
  ProductStruct? product, [
  bool forFieldValue = false,
]) {
  if (product == null) {
    return {};
  }
  final firestoreData = mapToFirestore(product.toMap());

  // Add any Firestore field values
  product.firestoreUtilData.fieldValues.forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getProductListFirestoreData(
  List<ProductStruct>? products,
) =>
    products?.map((e) => getProductFirestoreData(e, true)).toList() ?? [];
