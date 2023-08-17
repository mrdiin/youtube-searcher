import 'dart:convert';
import 'dart:typed_data';

import '../../flutter_flow/flutter_flow_util.dart';

import 'api_manager.dart';

export 'api_manager.dart' show ApiCallResponse;

const _kPrivateApiFunctionName = 'ffPrivateApiCall';

class SearchYouTubeCall {
  static Future<ApiCallResponse> call({
    String? queryParameter = '',
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'Search YouTube',
      apiUrl: 'https://youtube-data8.p.rapidapi.com/search/',
      callType: ApiCallType.GET,
      headers: {
        'X-RapidAPI-Key': '9e8349dd62msh5e7d02625229c1ap153530jsn597447f51f90',
        'X-RapidAPI-Host': 'youtube-data8.p.rapidapi.com',
      },
      params: {
        'q': queryParameter,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }

  static dynamic video(dynamic response) => getJsonField(
        response,
        r'''$.contents.*.video''',
        true,
      );
  static dynamic refinements(dynamic response) => getJsonField(
        response,
        r'''$.refinements''',
        true,
      );
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
