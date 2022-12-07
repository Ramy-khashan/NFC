import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../Data_access_layer/Conts/constant.dart';
import '../../tag/read_tag/view/tag_read.dart';
import '../../tag/write_tag/view/write_tag.dart';

class Home extends StatelessWidget {
  showToken() async {
    if (kDebugMode) {
      print((await SharedPreferences.getInstance())
          .get(SharedPrefConstants.accessToken));
    }
  }

  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    showToken();
    return Scaffold(
      appBar: AppBar(
        title: const Text('NFC'),
        centerTitle: true,
      ),
      body: ListView(
        padding: const EdgeInsets.all(2),
        children: [
          Card(
            elevation: 7,
            child: ListTile(
              title: const Text('Read Tag'),
              onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => TagReadPage.withDependency(),
                  )),
            ),
          ),
          Card(
            elevation: 7,
            child: ListTile(
              title: const Text('Write Tag'),
              onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => TagWriteScreen.withDependency(),
                  )),
            ),
          ),
        ],
      ),
    );
  }
}
