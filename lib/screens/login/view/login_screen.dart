import 'package:flutter/material.dart';
 import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';
import '../../../constant/widgets/text_field_item.dart';
import '../controller/login_controller.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => LoginProvider(),
      child: Consumer(
        builder: (context, LoginProvider value, child) => Scaffold(
          body: Column(
            children: [
              const Expanded(flex: 3,
                  child: Center(
                    child: Text(
                "Login",
                style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
              ),
                  )),
              Expanded(
                flex: 4,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    TextEditingItem(
                      controller: value.username,
                      lable: 'Username',
                      type: 'text',
                    ),
                    TextEditingItem(
                      controller: value.password,
                      lable: 'Password',
                      type: 'text',
                      isSecure: true,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 30, vertical: 10),
                      child: value.isLoading?const Center(child:  CircularProgressIndicator(),):ElevatedButton(
                        style: ButtonStyle(
                            padding: MaterialStateProperty.all(
                                const EdgeInsets.symmetric(vertical: 16))),
                        onPressed: () async {
                          if (value.username.value.text.isNotEmpty &&
                              value.password.value.text.isNotEmpty) {
                            await value.login(context);
                          } else {
                            Fluttertoast.showToast(
                                msg: "Must Fill Empty Fields");
                          }
                        },
                        child: const Text(
                          'Login',
                          style: TextStyle(fontSize: 18),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
