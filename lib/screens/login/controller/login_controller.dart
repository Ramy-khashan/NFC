import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../Data_access_layer/Conts/constant.dart';
import '../../home/view/home_screen.dart';
import '../api/login_api.dart';

class LoginProvider extends ChangeNotifier {
  TextEditingController username = TextEditingController();
  TextEditingController password = TextEditingController();
  bool isLoading = false;
  Future login(context) async {
    isLoading = true;
    notifyListeners();
    final response = await LogainApi().login(
        username: username.value.text.trim(),
        password: password.value.text.trim());
    if (response['status']) {
      (await SharedPreferences.getInstance())
          .setString(
        SharedPrefConstants.accessToken,
        response['data']['access_token'],
      )
          .whenComplete(() {
        Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (context) => const Home()),
            (route) => false);
      });
    }
    isLoading = false;
    notifyListeners();
  }
}
