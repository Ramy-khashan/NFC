// ignore_for_file: avoid_print, body_might_complete_normally_nullable

import 'dart:io';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
 import 'package:shared_preferences/shared_preferences.dart';

import '../constant/widgets/my_toast.dart';
import '../mainProvider.dart';
import '../screens/login/view/login_screen.dart';

class ApiConnection {
  Dio? _connection;

  ApiConnection() {
    _connection = Dio();
    _connection!.options.contentType = 'application/json; charset=UTF-8';
    _connection!.options.baseUrl = 'https://eds.pharmacastle-ksa.org/';
    // dotenv.env['BASE_URL']!;

    ///--------------------------///
    _connection!.options.validateStatus = (status) {
      return status! < 500;
    };
    _connection!.options.followRedirects = false;

    ///------------------------///

    _connection!.options.connectTimeout = 5000; //5s
    _connection!.options.receiveTimeout = 5000; //5s
  }

  Future<bool> checkConnection() async {
    bool connected = false;
    try {
      await InternetAddress.lookup('example.com').then((value) {
        if (value.isNotEmpty && value[0].rawAddress.isNotEmpty) {
          connected = true;
        }
      }).onError((error, stackTrace) {
        connected = false;
      }).timeout(const Duration(seconds: 15), onTimeout: () {
        connected = false;
      });
    } on SocketException catch (_) {
      connected = false;
    }
    return connected;
  }

  Future<Map?> get(String url, {Map<String, dynamic>? query, options}) async {
    Map? returnData;

    if (await MyConnection().check()) {
      Response response = await _connection!
          .get(url, queryParameters: query, options: options)
          .onError((error, stackTrace) {
        // MyToast(
        //     FlutterI18n.translate(
        //         GlobalKey<NavigatorState>().currentContext,'ItSeemsYouHaveUnstableNetworkConnection!,tryAgainPlease'));
        returnData = {
          'data': null,
          'status': false,
          'action_code': -1,
          'message': 'tryAgainPlease'
        };
        throw error.toString();
        //   Response(
        //   data:{
        //     'data': null,
        //     'status': false,
        //     'action_code': -1,
        //     'message': FlutterI18n.translate(
        //         GlobalKey<NavigatorState>().currentContext,'ItSeemsYouHaveUnstableNetworkConnection!,tryAgainPlease')
        //   } ,
        //   statusCode: -1,
        // );
      });

      try {
        ///-------------(status = false)-----------//
        if (!response.data['status']) {
          // print(response.data);
          if (response.data['message']
              .toString()
              .contains("it's seems you opened another session")) {
            unAuthorizedDialog(response.data['message'].toString());
          } else {
            // print("ddddddddddddddddddddddddddddd++++++++++++++++++++");
            MyToast(response.data['message'].toString().split(":")[1]);
          }
        }

        ///----------------(response)--------------//
        returnData = {
          'data': response.data['data'],
          'status': response.data['status'],
          'action_code': checkCode(response.statusCode),
          'message': response.data['message']
        };
      } catch (e) {
        // connectivityDialog(url, query: query, options: options);
        // returnData = {
        //   'data': null,
        //   'status': false,
        //   'action_code': -2,
        //   'message': e.toString()
        // };
      }

      return returnData;
    } else {
      // connectivityDialog(url, query: query, options: options);
      // MyToast("It's seems you have unstable Network connection! ");
      // return  {
      //   'data': null,
      //   'status': false,
      //   'action_code': -2,
      //   'message': "It's seems you have unstable Network connection! "
      // };
    }
  }

  Future<Map?> post(String url,
      {dynamic data, Map<String, dynamic>? query, options}) async {
    Map? returnData;
    if (await MyConnection().check()) {
      Response response = await _connection!
          .post(url, data: data, options: options)
          .onError((error, stackTrace) {
        // MyToast(
        //     FlutterI18n.translate(
        //         GlobalKey<NavigatorState>().currentContext,'ItSeemsYouHaveUnstableNetworkConnection!,tryAgainPlease'));
        print("onerror===========================+++++++");
        print(error.toString());
        print(data);
        returnData = {
          'data': null,
          'status': false,
          'action_code': -1,
          'message': 'ItSeemsYouHaveUnstableNetworkConnection!,tryAgainPlease'
        };
        throw error.toString();
        //   Response(
        //   data:{
        //     'data': null,
        //     'status': false,
        //     'action_code': -1,
        //     'message': FlutterI18n.translate(GlobalKey<NavigatorState>().currentContext,'ItSeemsYouHaveUnstableNetworkConnection!,tryAgainPlease')
        //   } ,
        //   statusCode: -1,
        // );
      });

      ///-------------(status = false)-----------//
      try {
        if (!response.data['status']) {
          // print(response.data);
          if (response.data['message']
              .toString()
              .contains("it's seems you opened another session")) {
            unAuthorizedDialog(response.data['message'].toString());
          } else {
            // print("ccccccccccccccccccc ===================");
            MyToast(response.data['message'].toString().split(":")[1]);
          }
        }
      } catch (e) {
        // print("catch post ===================");
        // MyToast(FlutterI18n.translate(GlobalKey<NavigatorState>().currentContext,'ItSeemsYouHaveUnstableNetworkConnection!,tryAgainPlease'));
        MyToast(e.toString());
      }
      // print(response);
      ///----------------(response)--------------//
      returnData = {
        'data': response.data['data'],
        'status': response.data['status'],
        'action_code': checkCode(response.statusCode),
        'message': response.data['message']
      };

      return returnData;
    } else {
      // connectivityDialog(url,query: query,options: options);
      // MyToast( FlutterI18n.translate(
      //     GlobalKey<NavigatorState>().currentContext,'ItSeemsYouHaveUnstableNetworkConnection!,tryAgainPlease'));
      return {'data': null, 'status': false, 'action_code': -2, 'message': ""};
    }
  }

  Future<String> postPayment(String url,
      {Map<String, dynamic>? data, options}) async {
    Response response = await _connection!
        .post(url, data: data, options: options)
        .onError((error, stackTrace) {
      // MyToast(
      //     FlutterI18n.translate(
      //         GlobalKey<NavigatorState>().currentContext,'ItSeemsYouHaveUnstableNetworkConnection!,tryAgainPlease'));
      throw error.toString();
    });
    print(response.data);
    print("response.data======================");
    return response.data;
  }

  int checkCode(code) {
    switch (int.parse(code.toString())) {

      ///------------(connection error)-----------//
      case 201:
        return 0;
        break;

      ///------------(server error)-----------//
      case 404:
        return 1;
        break;

      ///------------(request error)-----------//
      case 500:
        return 2;
        break;

      case 401:
        unAuthorizedDialog('yourSessionIsExpired,bye!');
        return -3;

        break;

      ///------------(request error)-----------//
      case 429:
        unAuthorizedDialog('yourSessionExpiredForSecurity');
        return -4;
        break;

      ///------------(invalid data)-----------//
      case 400:
        return 3;
        break;

      ///------------(valid)-----------//
      case 200:
        return 100;
        break;

      ///------------(default)-----------//
      default:
        return -1;
    }
  }

  void connectivityDialog(String url, {Map<String, dynamic>? query, options}) {
    showGeneralDialog(
        context: GlobalKey<NavigatorState>().currentContext!,
        barrierDismissible: true,
        barrierLabel: MaterialLocalizations.of(
                GlobalKey<NavigatorState>().currentContext!)
            .modalBarrierDismissLabel,
        barrierColor: Colors.black45,
        transitionDuration: const Duration(milliseconds: 200),
        pageBuilder: (BuildContext buildContext, Animation animation,
            Animation secondaryAnimation) {
          return Card(
            child: SafeArea(
              child: Center(
                child: Container(
                  width:
                      MediaQuery.of(GlobalKey<NavigatorState>().currentContext!)
                          .size
                          .width,
                  height:
                      MediaQuery.of(GlobalKey<NavigatorState>().currentContext!)
                          .size
                          .height,
                  padding: const EdgeInsets.all(20),
                  color: Colors.white,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Center(
                          child: Image.asset(
                        'assets/images/approve.png',
                        width: 250,
                        height: 200,
                        fit: BoxFit.fill,
                      )),
                      const SizedBox(
                        height: 20,
                      ),
                      const Text(
                        'ItSeemsYouHaveUnstableNetworkConnection!',
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 22, color: Colors.grey),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 20, right: 20),
                        child: ElevatedButton(
                          onPressed: () async {
                            Navigator.of(
                                    GlobalKey<NavigatorState>().currentContext!)
                                .pop('dialog');
                            await get(url, query: query, options: options);
                          },
                          child: Text('tryAgain'),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        });
  }

  void unAuthorizedDialog(String message) {
    showGeneralDialog(
        context: MainProvider.navigatorKey.currentContext!,
        barrierDismissible: true,
        barrierLabel: MaterialLocalizations.of(
                GlobalKey<NavigatorState>().currentContext!)
            .modalBarrierDismissLabel,
        barrierColor: Colors.black45,
        transitionDuration: const Duration(milliseconds: 200),
        pageBuilder: (BuildContext buildContext, Animation animation,
            Animation secondaryAnimation) {
          return Card(
            child: SafeArea(
              child: Center(
                child: Container(
                  width:
                      MediaQuery.of(GlobalKey<NavigatorState>().currentContext!)
                          .size
                          .width,
                  height:
                      MediaQuery.of(GlobalKey<NavigatorState>().currentContext!)
                          .size
                          .height,
                  padding: const EdgeInsets.all(20),
                  color: Colors.white,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // Center(
                      //     child: Image.asset(
                      //   'assets/images/approve.png',
                      //   width: 250,
                      //   height: 200,
                      //   fit: BoxFit.fill,
                      // )),
                      // const SizedBox(
                      //   height: 20,
                      // ),
                      Text(
                        message,
                        textAlign: TextAlign.center,
                        maxLines: 3,
                        style: TextStyle(fontSize: 22, color: Colors.grey),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 20, right: 20),
                        child: ElevatedButton(
                          onPressed: () async {
                            SharedPreferences prefs =
                                await SharedPreferences.getInstance();
                            await prefs.clear();
                            // await prefs.remove(SharedPrefConstants.userState);
                            Navigator.of(
                                    GlobalKey<NavigatorState>().currentContext!)
                                .pushAndRemoveUntil(
                                    MaterialPageRoute(
                                        builder: (BuildContext context) =>
                                            const LoginScreen()),
                                    (Route<dynamic> route) => false);
                          },
                          child: Text('logOut'),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        });
  }
}

class MyConnection {
  Future<bool> check() async {
    bool connectionStatus = false;
    try {
      await Connectivity().checkConnectivity().then((value) {
        if (value == ConnectivityResult.mobile ||
            value == ConnectivityResult.wifi) {
          connectionStatus = true;
        } else {
          connectionStatus = false;
        }
      });
    } catch (_) {
      connectionStatus = false;
    }
    return connectionStatus;
  }
}
