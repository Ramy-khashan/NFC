import 'package:flutter/material.dart';
 
import 'screens/login/view/login_screen.dart';

class App extends StatelessWidget {
// Future<bool>  mainClass() async => (await SharedPreferences.getInstance()).containsKey(SharedPrefConstants.accessToken);
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LoginScreen(),
    );
  }
}
