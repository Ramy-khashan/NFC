import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../Data_access_layer/Conts/constant.dart';

class TagApi {
  Future getTag({required String tagId}) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    log(sharedPreferences
        .getString(SharedPrefConstants.accessToken)
        .toString());
    return Dio().post(
      'https://test.msyc-eg.com/auth-service/api/v1/dashboard/getMemberByCardNumber-mobile',
      data: {"card_number": tagId},
      options: Options(
        headers: {
          'Authorization':
              "Bearer ${sharedPreferences.getString(SharedPrefConstants.accessToken)}",
        },
      ),
    );
  }

  Future setTag(
      {required String tagId,
      required String userType,
      required int memberCode,
      required int branchId}) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    return Dio().post(
        'https://test.msyc-eg.com/auth-service/api/v1/dashboard/add-cardNumber-mobile',
        data: {
          "member_code": memberCode,
          "userType": userType,
          "branchId": branchId,
          "card_number": tagId
        },
        options: Options(headers: {
          'Authorization':
              "Bearer ${sharedPreferences.getString(SharedPrefConstants.accessToken)}",
        }));
  }
}
