import 'dart:convert';
import 'dart:typed_data';
import '../schema/structs/index.dart';

import 'package:flutter/foundation.dart';

import '/flutter_flow/flutter_flow_util.dart';
import 'api_manager.dart';

export 'api_manager.dart' show ApiCallResponse;

const _kPrivateApiFunctionName = 'ffPrivateApiCall';

class BuscarPerguntasCall {
  static Future<ApiCallResponse> call({
    String? categoria = 'eq.1',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'Buscar Perguntas',
      apiUrl: 'https://suoljqkuwkeuzcemzhlz.supabase.co/rest/v1/fe4_perguntas',
      callType: ApiCallType.GET,
      headers: {
        'apikey':
            'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InN1b2xqcWt1d2tldXpjZW16aGx6Iiwicm9sZSI6ImFub24iLCJpYXQiOjE3Mjc4NTk2NzgsImV4cCI6MjA0MzQzNTY3OH0.CkwF2JWWJvQaLGrUOHwauA9GbfQBH0j7pHlG_bT6LGA',
      },
      params: {
        'c_ncategoria': categoria,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class BuscarOpcoesCall {
  static Future<ApiCallResponse> call({
    String? categoria = 'eq.1',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'Buscar Opcoes',
      apiUrl:
          'https://suoljqkuwkeuzcemzhlz.supabase.co/rest/v1/view_perguntas_opcoes',
      callType: ApiCallType.GET,
      headers: {
        'apikey':
            'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InN1b2xqcWt1d2tldXpjZW16aGx6Iiwicm9sZSI6ImFub24iLCJpYXQiOjE3Mjc4NTk2NzgsImV4cCI6MjA0MzQzNTY3OH0.CkwF2JWWJvQaLGrUOHwauA9GbfQBH0j7pHlG_bT6LGA',
      },
      params: {
        'ncategoria': categoria,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
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

String _toEncodable(dynamic item) {
  return item;
}

String _serializeList(List? list) {
  list ??= <String>[];
  try {
    return json.encode(list, toEncodable: _toEncodable);
  } catch (_) {
    if (kDebugMode) {
      print("List serialization failed. Returning empty list.");
    }
    return '[]';
  }
}

String _serializeJson(dynamic jsonVar, [bool isList = false]) {
  jsonVar ??= (isList ? [] : {});
  try {
    return json.encode(jsonVar, toEncodable: _toEncodable);
  } catch (_) {
    if (kDebugMode) {
      print("Json serialization failed. Returning empty json.");
    }
    return isList ? '[]' : '{}';
  }
}
