import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
 import 'package:provider/provider.dart';
 import '../../../../constant/widgets/text_field_item.dart';
 import '../../controller/tag_reader_provider.dart';

class TagWriteScreen extends StatelessWidget {
  const TagWriteScreen({Key? key}) : super(key: key);

  static Widget withDependency() => ChangeNotifierProvider<TagReadProvider>(
        create: (context) => TagReadProvider(),
        child: const TagWriteScreen(),
      );

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, TagReadProvider value, child) => Scaffold(
        appBar: AppBar(
          title: const Text('Write Card'),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextEditingItem(controller: value.memberCode, lable: "Member Code",type:"number"),
            TextEditingItem(controller: value.branchId, lable: "Branch Id",type:"number"),
            TextEditingItem(controller: value.userType, lable: "User Type",type:"text"),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
              child: ElevatedButton(
                style: ButtonStyle(
                    padding: MaterialStateProperty.all(
                        const EdgeInsets.symmetric(vertical: 16))),
                onPressed: () async {
                  if (value.branchId.value.text.isNotEmpty &&
                      value.memberCode.value.text.isNotEmpty &&
                      value.userType.value.text.isNotEmpty) {
                      await value.addMemberTagId(context);
                  } else {
                    Fluttertoast.showToast(msg: "Must Fill Empty Fields");
                  }
                },
                child: const Text(
                  'Set Tag',
                  style: TextStyle(fontSize: 18),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
