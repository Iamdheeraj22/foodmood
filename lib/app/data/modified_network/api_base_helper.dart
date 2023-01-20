import 'dart:async';
import 'dart:convert';
import 'dart:developer' as dev;
import 'dart:developer';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:foodmood/app/data/modified_network/api_response.dart';
import 'package:foodmood/app/data/network/api_config.dart';
import 'package:foodmood/app/data/network/api_msg_strings.dart';
import 'package:foodmood/app/data/network/app_exception.dart';
import 'package:foodmood/app/data/network/connectivity.dart';
import 'package:foodmood/app/data/shared_pref/shared_preference_helper.dart';
import 'package:foodmood/app/res/strings/strings.dart';
import 'package:foodmood/app/services/navigator_service.dart';
import 'package:foodmood/app/utils/debug_utils/debug_utils.dart';
import 'package:foodmood/app/utils/mixin/permission/permission_util.dart';
import 'package:http/http.dart' as http;


class ApiBaseHelper {
  ApiBaseHelper._internal();

  factory ApiBaseHelper.getInstance() {
    _instance ??= ApiBaseHelper._internal();
    return _instance!;
  }
  static const String _baseUrl = ApiConfig.baseUrlUat;

  static ApiBaseHelper? _instance;

  // ApiHeaders:--------------------------------get/set api headers---------------------------------------
  Map<String, String> getApiHeaders(Map<String, String>? authToken) {
    final map = {
      'Content-Type': 'application/json; charset=UTF-8',
      'accept': 'text/plain',
    };
    map.addEntries(authToken!.entries);
    return map;
  }

/*
  Map<String, String> getApiHeaders(String? authToken) {
    return {
      'Content-Type': 'application/json; charset=UTF-8',
      'accept': 'text/plain',
      'Authorization': 'Bearer $authToken',
    };
  }
*/

// Get:--------------------------------get api call with query params---------------------------------------
  Future<ApiResponse?> getApiCallWithQuery(
      String url, Map<String, String> queryParameters) async {
    var uri = Uri.parse(_baseUrl + url);
    uri = uri.replace(queryParameters: queryParameters);
    final headers = await getHeadersValues();
    if (kDebugMode) {
      dev.log('Api Get with params, url $uri');
    }
    final response = await safeApiCall(http.get(
      uri,
      headers: headers,
    ));
    return response;
  }

// Get:-----------------------------------------------------------------------
  Future<ApiResponse?> get(String url) async {
    if (kDebugMode) {
      dev.log('Api Get, url $url');
    }
    final headers = await getHeadersValues();
    final response = await safeApiCall(http.get(
      Uri.parse(_baseUrl + url),
      headers: headers,
    ));
    return response;
  }

// Post:-----------------------------------------------------------------------
  Future<ApiResponse?> post(String url, Map<String, dynamic> jsonData) async {
    if (kDebugMode) {
      print('Api Post, url $url');
      print('Api request- ${jsonEncode(jsonData)}');
    }
    final headers = await getHeadersValues();
    if (await ConnectionStatus.getInstance().checkConnection()) {
      final response = safeApiCall(http.post(Uri.parse(_baseUrl + url),
          headers: headers,
          body: jsonData.isNotEmpty ? jsonEncode(jsonData) : null));

      return response;
    } else {
      return ApiResponse.error(ApiMsgStrings.txtNoInternetConnection);
    }
  }

// Put:-----------------------------------------------------------------------
  Future<ApiResponse?> put(String url, Map<String, dynamic> jsonData) async {
    if (kDebugMode) {
      dev.log('Api Put, url $url');
    }
    if (kDebugMode) {
      dev.log('Api request- ${jsonEncode(jsonData)}');
    }
    final headers = await getHeadersValues();
    final response = safeApiCall(http.put(Uri.parse(_baseUrl + url),
        headers: headers, body: jsonEncode(jsonData)));
    return response;
  }

// Delete:------------------------------------------------------
  Future<ApiResponse?> delete(String url) async {
    if (kDebugMode) {
      dev.log('Api delete, url $url');
    }
    final headers = await getHeadersValues();
    final response = safeApiCall(http.delete(
      Uri.parse(_baseUrl + url),
      headers: headers,
    ));
    return response;
  }

// Post multipart file to server with json data:----------------------
  Future<ApiResponse?> postApiCallMultipart(
      String url, Map<String, String> jsonData, File file,
      {multiPartParameterName}) async {
    final request = http.MultipartRequest('POST', Uri.parse(_baseUrl + url));
    final headers = await getHeadersValues();
    request.headers.addAll(headers);
    request.fields.addAll(jsonData);
    if (file.existsSync()) {
      request.files.add(
        http.MultipartFile(
          multiPartParameterName ?? 'file',
          http.ByteStream(Stream.castFrom(file.openRead())),
          await file.length(),
          filename: file.path.split('/').last,
        ),
      );
    }
    if (await ConnectionStatus.getInstance().checkConnection()) {
      final response =
          safeApiCall(http.Response.fromStream(await request.send()));
      return response;
    } else {
      return ApiResponse.error(ApiMsgStrings.txtNoInternetConnection);
    }
  }

  /*----------------------------Get_Headers_Values----------------------*/

  Future<Map<String, String>> getHeadersValues() async {
    final apiToken = await SharedPreferenceHelper.getInstance().apiToken;
    final deviceToken = await SharedPreferenceHelper.getInstance().deviceToken;
    final headers = {
      'Content-Type': 'application/json; charset=UTF-8',
      'accept': 'text/plain',
      'Authorization': 'Bearer $apiToken',
      'ApiToken': '$apiToken',
      'DeviceToken': deviceToken ?? '',
      'UtcOffsetInSecond': DateTime.now().timeZoneOffset.inSeconds.toString()
    };

    log(headers.toString());

    // show headers
    DebugUtils.showLog(DateTime.now().timeZoneOffset.inSeconds.toString(),
        prefix: 'UtcOffsetInSecond > ');

    return Future.value(headers);
  }

  Future<Map<String, String>> getHeadersForMultipartForm() async {
    final apiToken = await SharedPreferenceHelper.getInstance().apiToken;
    final deviceToken = await SharedPreferenceHelper.getInstance().deviceToken;
    final headers = {
      'Content-Type': 'multipart/form-data; charset=UTF-8',
      'accept': 'text/plain',
      'Authorization': 'Bearer $apiToken',
      'ApiToken': '$apiToken',
      'DeviceToken': deviceToken ?? '',
      'UtcOffsetInSecond': DateTime.now().timeZoneOffset.inSeconds.toString()
    };

    log(headers.toString());

    // show headers
    DebugUtils.showLog(DateTime.now().timeZoneOffset.inSeconds.toString(),
        prefix: 'UtcOffsetInSecond > ');

    return Future.value(headers);
  }

// SafeApiCall:--------------------------------safe api call---------------------------------------
  Future<ApiResponse?> safeApiCall(Future<http.Response> apiResponse) async {
    if (await ConnectionStatus.getInstance().checkConnection()) {
      try {
        final response = await apiResponse.timeout(const Duration(seconds: 60));
        final formattedResponse = _returnResponse(response);
        if (formattedResponse['responseCode'] == 223) {
          PermissionUtil.showActionDialog(
              context: NavigationService.navigatorKey.currentContext,
              description: formattedResponse['failureMsg'].toString(),
              shouldShowNegative: false,
              positiveText: AppStrings.txtOk,
              onPositiveClick: () {
                //AppServices.getInstance().outFromApp();
                // SharedPreferenceHelper.getInstance()
                //     .logout(NavigationService.navigatorKey.currentContext);
              });
        }
        return ApiResponse.success(formattedResponse);
      } on BadRequestException {
        return ApiResponse.error(ApiMsgStrings.txtInvalidRequest);
      } on UnauthorisedException {
        PermissionUtil.showActionDialog(
            context: NavigationService.navigatorKey.currentContext,
            description: AppStrings.sessionExpire,
            shouldShowNegative: false,
            positiveText: AppStrings.txtOk,
            onPositiveClick: () {
              //AppServices.getInstance().outFromApp();
              // SharedPreferenceHelper.getInstance()
              //     .logout(NavigationService.navigatorKey.currentContext);
            });
        return ApiResponse.error(ApiMsgStrings.txtUnauthorised);
      } on FetchDataException {
        return ApiResponse.error(ApiMsgStrings.txtSomethingWentWrong);
      } on TimeoutException {
        return ApiResponse.error(ApiMsgStrings.txtConnectionTimeOut);
      } on SocketException {
        return ApiResponse.error(ApiMsgStrings.txtNoInternetConnection);
      } catch (e) {
        return ApiResponse.error(e.toString());
      }
    } else {
      return ApiResponse.error(ApiMsgStrings.txtNoInternetConnection);
    }
  }
}

dynamic _returnResponse(http.Response response) {
  if (kDebugMode) {
    log('hereResCode> ${response.statusCode} ');
  }
  switch (response.statusCode) {
    case 200:
      final responseJson = json.decode(utf8.decode(response.bodyBytes));
      if (kDebugMode) {
        log(responseJson.toString());
      }

      if (responseJson['responseCode'].toString() == '403') {
        throw UnauthorisedException(response.body.toString());
      }

      return responseJson;
    case 400:
      throw BadRequestException(response.body.toString());
    case 401:
    case 403:
      throw UnauthorisedException(response.body.toString());
    case 500:
    default:
      throw FetchDataException(
          '${ApiMsgStrings.txtServerError} ${response.statusCode}');
  }
}
