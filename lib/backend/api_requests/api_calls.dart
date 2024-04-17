import 'dart:convert';

import 'api_manager.dart';

export 'api_manager.dart' show ApiCallResponse;

const _kPrivateApiFunctionName = 'ffPrivateApiCall';

class GetBillsListCall {
  static Future<ApiCallResponse> call({
    String? token = '\'\'',
    String? company = '',
    String? transactionId = '',
    String? date = '',
    String? receiptNumber = '',
    String? isMarked = '',
    String? status = '',
    String? companyId = '',
    String? check = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'getBillsList',
      apiUrl:
          'https://us-central1-development-417611.cloudfunctions.net/app/gamification-bill/filtered',
      callType: ApiCallType.GET,
      headers: {
        'Authorization': 'Bearer $token',
      },
      params: {
        'company': company,
        'transactionId': transactionId,
        'date': date,
        'receiptNumber': receiptNumber,
        'isMarked': isMarked,
        'status': status,
        'companyId': companyId,
        'check': check,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }
}

class GetBillsListFilteredCall {
  static Future<ApiCallResponse> call({
    String? token = '\'\'',
    String? company = '',
    String? transactionId = '',
    String? date = '',
    String? receiptNumber = '',
    String? isMarked = '',
    String? status = '',
    String? companyId = '',
    String? startDate = '',
    String? endDate = '',
    String? check = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'getBillsListFiltered',
      apiUrl:
          'https://us-central1-development-417611.cloudfunctions.net/app/gamification-bill/filtered',
      callType: ApiCallType.GET,
      headers: {
        'Authorization': 'Bearer $token',
      },
      params: {
        'company': company,
        'transactionId': transactionId,
        'receiptNumber': receiptNumber,
        'isMarked': isMarked,
        'status': status,
        'companyId': companyId,
        'startDate': startDate,
        'endDate': endDate,
        'check': check,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }
}

class GetCompanyListCall {
  static Future<ApiCallResponse> call({
    String? companyName = '',
    String? profileId = '',
    String? startDate = '',
    String? endDate = '',
    String? token = '',
    String? check = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'getCompanyList',
      apiUrl:
          'https://us-central1-development-417611.cloudfunctions.net/app/company/list',
      callType: ApiCallType.GET,
      headers: {
        'Authorization': 'Bearer $token',
      },
      params: {
        'companyName': companyName,
        'profileId': profileId,
        'startDate': startDate,
        'endDate': endDate,
        'check': check,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }
}

class GetPaginatedCompanyListCall {
  static Future<ApiCallResponse> call({
    String? companyName = '',
    String? profileId = '',
    String? startDate = '',
    String? endDate = '',
    String? token = '',
    String? firstId = '',
    String? lastId = '',
    String? toNext = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'getPaginatedCompanyList ',
      apiUrl:
          'https://us-central1-development-417611.cloudfunctions.net/app/company/paginated',
      callType: ApiCallType.GET,
      headers: {
        'Authorization': 'Bearer $token',
      },
      params: {
        'companyName': companyName,
        'profileId': profileId,
        'startDate': startDate,
        'endDate': endDate,
        'firstId': firstId,
        'lastId': lastId,
        'toNext': toNext,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }
}

class UpdateBillCall {
  static Future<ApiCallResponse> call({
    String? token = '',
    String? billId = '',
    String? pathName = '',
    String? data = '',
  }) async {
    final ffApiRequestBody = '''
{
  "$pathName": "$data"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'updateBill',
      apiUrl:
          'https://us-central1-development-417611.cloudfunctions.net/app/gamification-bill/update/$billId',
      callType: ApiCallType.PATCH,
      headers: {
        'Authorization': 'Bearer $token',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }
}

class GetBillsCountCall {
  static Future<ApiCallResponse> call({
    String? token = '',
    String? companyId = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'getBillsCount',
      apiUrl:
          'https://us-central1-development-417611.cloudfunctions.net/app/gamification_bill/count',
      callType: ApiCallType.GET,
      headers: {
        'Authorization': 'Bearer $token',
      },
      params: {
        'companyId': companyId,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }
}

class GetCompanyNamesCall {
  static Future<ApiCallResponse> call({
    String? token = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'getCompanyNames',
      apiUrl:
          'https://us-central1-development-417611.cloudfunctions.net/app/company/nameList',
      callType: ApiCallType.GET,
      headers: {
        'Authorization': 'Bearer $token',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: true,
      alwaysAllowBody: false,
    );
  }
}

class GetPaginatedBillsCall {
  static Future<ApiCallResponse> call({
    String? companyId = '',
    String? lastId = '',
    String? firstId = 'null',
    String? toNext = '',
    String? transactionId = '',
    String? startDate = '',
    String? endDate = '',
    String? receiptNumber = '',
    String? isMarked = '',
    String? token = '',
    String? status = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'getPaginatedBills',
      apiUrl:
          'https://us-central1-development-417611.cloudfunctions.net/app/gamification-bill/list/paginated',
      callType: ApiCallType.GET,
      headers: {
        'Authorization': 'Bearer $token',
      },
      params: {
        'companyId': companyId,
        'lastId': lastId,
        'firstId': firstId,
        'toNext': toNext,
        'transactionId': transactionId,
        'startDate': startDate,
        'endDate': endDate,
        'receiptNumber': receiptNumber,
        'isMarked': isMarked,
        'status': status,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }
}

class ApiPagingParams {
  int nextPageNumber = 0;
  int numItems = 0;
  dynamic lastResponse;

  ApiPagingParams({
    required this.nextPageNumber,
    required this.numItems,
    required this.lastResponse,
  });

  @override
  String toString() =>
      'PagingParams(nextPageNumber: $nextPageNumber, numItems: $numItems, lastResponse: $lastResponse,)';
}

String _serializeList(List? list) {
  list ??= <String>[];
  try {
    return json.encode(list);
  } catch (_) {
    return '[]';
  }
}

String _serializeJson(dynamic jsonVar, [bool isList = false]) {
  jsonVar ??= (isList ? [] : {});
  try {
    return json.encode(jsonVar);
  } catch (_) {
    return isList ? '[]' : '{}';
  }
}
