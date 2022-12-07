// import 'dart:convert' as convert;
// import 'package:http/http.dart' as http;
// import 'package:http/http.dart';
//
// class HttpClient {
//   bool _loggingEnabled = true;
//
//   Future<dynamic> post(String url,
//       {Map<String, String> headers, String body}) async {
//     Response response =
//         await http.post(Uri.parse(url), headers: headers, body: body);
//     log(response);
//     if (response.statusCode <= 500) {
//       var jsonResponse;
//       try {
//         jsonResponse = convert.jsonDecode(response.body);
//       } catch (e) {
//         jsonResponse = response.body;
//       }
//       return jsonResponse;
//     } else {
//       try {
//         return response.body;
//       } catch (e) {
//         return Exception();
//       }
//     }
//   }
//
//   Future<dynamic> get(
//     String url, {
//     Map<String, String> headers,
//   }) async {
//     var response = await http.get(
//       Uri.parse(url),
//       headers: headers,
//     );
//     if (response.statusCode <= 500) {
//       var jsonResponse;
//       try {
//         jsonResponse = convert.jsonDecode(response.body);
//       } catch (e) {
//         jsonResponse = response.body;
//       }
//       return jsonResponse;
//     } else {
//       try {
//         return response.body;
//       }
//       catch (e) {
//         return Exception();
//       }
//     }
//   }
//   // Future<dynamic> post(String url,
//   //     {Map<String, String> headers, String body}) async {
//   //   Response response;
//   //   try {
//   //  response =
//   //         await http.post(Uri.parse(url), headers: headers, body: body).timeout(
//   //           Duration(seconds: 5),
//   //           onTimeout: () {
//   //             // Time has run out, do what you wanted to do.
//   //             return http.Response('Error', 500); // Replace 500 with your http code.
//   //           },
//   //         );
//   //     if (response.statusCode == 200 || response.statusCode == 201) {
//   //       var jsonResponse;
//   //       try {
//   //         jsonResponse = convert.jsonDecode(response.body);
//   //       } catch (e) {
//   //         jsonResponse = response.body;
//   //       }
//   //       return jsonResponse;
//   //     }
//   //     else {
//   //       try {
//   //         MainProvider.checkStatusCode(
//   //             MainProvider.navigatorKey.currentContext, response.statusCode,
//   //             data: convert.jsonDecode(response.body)['message'], login: true);
//   //       } catch (e) {
//   //         MainProvider.checkStatusCode(
//   //             MainProvider.navigatorKey.currentContext, response.statusCode,
//   //             data: "error", login: true);
//   //       }
//   //       return response.body;
//   //     }
//   //   } catch (e) {
//   //     MainProvider.checkStatusCode(
//   //         MainProvider.navigatorKey.currentContext, 1000,
//   //         data: "error", login: true);
//   //   }
//   // }
//   //
//   // Future<dynamic> get(
//   //   String url, {
//   //   Map<String, String> headers,
//   // }) async {
//   //   try {
//   //     var response = await http.get(
//   //       Uri.parse(url),
//   //       headers: headers,
//   //     ).timeout(
//   //       Duration(seconds: 5),
//   //       onTimeout: () {
//   //         // Time has run out, do what you wanted to do.
//   //         return http.Response('Error', 500); // Replace 500 with your http code.
//   //       },
//   //     );
//   //     if (response.statusCode == 200 || response.statusCode == 201) {
//   //       var jsonResponse;
//   //       try {
//   //         jsonResponse = convert.jsonDecode(response.body);
//   //       } catch (e) {
//   //         jsonResponse = response.body;
//   //       }
//   //       return jsonResponse;
//   //     } else {
//   //       try {
//   //         MainProvider.checkStatusCode(
//   //             MainProvider.navigatorKey.currentContext, response.statusCode,
//   //             data: convert.jsonDecode(response.body)['message'], login: true);
//   //       } catch (e) {
//   //         MainProvider.checkStatusCode(
//   //             MainProvider.navigatorKey.currentContext, response.statusCode,
//   //             data: "error", login: true);
//   //       }
//   //
//   //       return response.body;
//   //     }
//   //   } catch (e) {
//   //     MainProvider.checkStatusCode(
//   //         MainProvider.navigatorKey.currentContext, 1000,
//   //         data: "error", login: true);
//   //   }
//   // }
//   log(Response response) {
//     if (_loggingEnabled) {
//     }
//   }
// }
//
// class ApiUrl {
//   static String apiUrl = "https://pharmacastle-ksa.org/";
// }
