import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../controller/tag_reader_provider.dart';
import 'widgets/textView.dart';
import 'widgets/user_rent.dart';

class TagReadPage extends StatelessWidget {
  const TagReadPage({Key? key}) : super(key: key);

  static Widget withDependency() => ChangeNotifierProvider<TagReadProvider>(
        create: (context) => TagReadProvider(),
        child: const TagReadPage(),
      );

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, TagReadProvider value, child) => Scaffold(
        appBar: value.tag != null
            ? AppBar(
                title: const Text('Read Card'),
              )
            : null,
        body: value.isDataLoaded
            ? SafeArea(
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(10),
                        child: Container(
                          height: 150,
                          clipBehavior: Clip.antiAliasWithSaveLayer,
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                          ),
                          child: value.userInfo!.data![0].user!.photo == null
                              ?
                               Image.asset("assets/images/userImg.png")
                              : Image.network(
                                  value.userInfo!.data![0].user!.photo!),
                        ),
                      ),
                      Center(
                          child: Text(
                        "${value.userInfo!.data![0].user!.userName ?? ""}  ( ${value.userInfo!.data![0].user!.category!.groupName!} )",
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      )),
                      const SizedBox(
                        height: 10,
                      ),
                      Expanded(
                        child: SingleChildScrollView(
                          physics: const BouncingScrollPhysics(),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              ViewUserInfo(
                                  title: "Birthdate",
                                  content: value
                                          .userInfo!.data![0].user!.birthdate ??
                                      ""),
                              ViewUserInfo(
                                  title: "Member code",
                                  content: value.userInfo!.data![0].user!
                                          .memberCode ??
                                      ""),
                              ViewUserInfo(
                                  title: "Member Type",
                                  content: value.userInfo!.data![0].user!
                                          .arabicMemberType ??
                                      ""),
                              ViewUserInfo(
                                  title: "Last Payment Date ",
                                  content: value
                                      .userInfo!.data![0].user!.lastPaymentDate!
                                      .split("T")[0]),
                              ViewUserInfo(
                                  title: "Activity",
                                  content: value.userInfo!.data![0]
                                          .userActivities!.isEmpty
                                      ? "No Activity Found"
                                      : value.userInfo!.data![0]
                                          .userActivities![0].activityName
                                          .toString()),
                              ViewUserInfo(
                                  title: "Branch",
                                  content: value.userInfo!.data![0].branch!
                                          .branchName ??
                                      ""),
                              const SizedBox(
                                height: 7,
                              ),
                              UserRentShape(value: value)
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 30, vertical: 10),
                        child: value.isLoading
                            ? const Center(
                                child: CircularProgressIndicator(),
                              )
                            : ElevatedButton(
                                style: ButtonStyle(
                                    padding: MaterialStateProperty.all(
                                        const EdgeInsets.symmetric(
                                            vertical: 16))),
                                onPressed: () async =>
                                    await value.getMemberData(context),
                                child: const Text(
                                  'Read Tag',
                                  style: TextStyle(fontSize: 18),
                                ),
                              ),
                      ),
                    ],
                  ),
                ),
              )
            : Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 30, vertical: 10),
                    child: value.isLoading
                        ? const Center(
                            child: CircularProgressIndicator(),
                          )
                        : ElevatedButton(
                            style: ButtonStyle(
                                padding: MaterialStateProperty.all(
                                    const EdgeInsets.symmetric(vertical: 16))),
                            onPressed: () async =>
                                await value.getMemberData(context),
                            child: const Text(
                              'Read Tag',
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
