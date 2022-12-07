import 'dart:developer';
import 'dart:io';
import 'dart:typed_data';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
  import 'package:nfc_manager/nfc_manager.dart';
import 'package:nfc_manager/platform_tags.dart';
import 'package:nfc_new_version/common/extensions.dart';
import '../../../common/nfc_session.dart';
import '../../../constant/widgets/my_toast.dart';
import '../api/tag_api.dart';
import '../model/user_info.dart';

class TagReadProvider with ChangeNotifier {
  TextEditingController memberCode = TextEditingController();
  TextEditingController branchId = TextEditingController();
  TextEditingController userType = TextEditingController();
  final formKey = GlobalKey<FormState>();
  NfcTag? tag;
  Map<String, dynamic>? additionalData;
  Future<String?> handleTag(NfcTag tag) async {
    this.tag = tag;
    additionalData = {};

    Object? tech;

    if (Platform.isIOS) {
      tech = FeliCa.from(tag);
      if (tech is FeliCa) {
        final polling = await tech.polling(
          systemCode: tech.currentSystemCode,
          requestCode: FeliCaPollingRequestCode.noRequest,
          timeSlot: FeliCaPollingTimeSlot.max1,
        );
        additionalData!['manufacturerParameter'] =
            polling.manufacturerParameter;
      }
    }

    notifyListeners();
    return '[Tag - Read] is completed.';
  }

  late String message;
  UserInfoModel? userInfo;

  bool isLoading = false;
  bool isDataLoaded = false;
  List? userRent;
  getMemberData(context) async {
    try {
      await startSession(
        context: context,
        handleTag: handleTag,
      );
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }
    //Api section
      if (tag != null) {
    isLoading = true;
    notifyListeners();
    // get tag id
    String id = 
    filterTagId(tag);
    userRent = [];
    try {
      final response = await TagApi().getTag(tagId: id);
      if (response.data['status']) {
        if (kDebugMode) {
          if (kDebugMode) {
            log(response.data['message'].toString());
            log(response.data['data'][0].toString());
            print(response.data['data'][0].toString());
          }
        }
        try {
          userInfo = UserInfoModel.fromJson(response.data);
          userRent = response.data['data'][0]['user']['userRent'];
           //print(response.data['data'][0]['user']['userRent']);
        } catch (e) {
          MyToast("Convert Issue");
          showDialog(
            context: context,
            builder: (context) => AlertDialog(
              content: Column(
                children: [
                  Text("id : $id \n"),
                  Text(e.toString()),
                ],
              ),
            ),
          );
        }
        isDataLoaded = true;
        isLoading = false;
        log("============================");
        log(userRent.toString());
        log("============================");

        // print(userRent);
        showDialogItem(context, false);
        notifyListeners();
      } else {
        isLoading = false;

        message = response.data['message'];
      }
    } catch (e) {
      MyToast("Something went wrong");
      print(e);
      // showDialog(
      //   context: context,
      //   builder: (context) => AlertDialog(
      //     content: Text(e.toString()),
      //   ),
      // );
    }

    notifyListeners();
    } else {
      isDataLoaded = false;
      isLoading = false;
      Fluttertoast.showToast(msg: "Invalid Operation");
    }
  }

  addMemberTagId(context) async {
    if (kDebugMode) {
      log((int.parse(branchId.text) + 1).toString());
      log((int.parse(memberCode.text) + 1).toString());
      log(userType.text);
    }
    await startSession(
      context: context,
      handleTag: handleTag,
    );

    //Api section
    if (tag != null) {
      // get tag id
      String id = filterTagId(tag);
      final response = await TagApi().setTag(
        tagId: id,
        branchId: int.parse(branchId.text),
        memberCode: int.parse(memberCode.text),
        userType: userType.text,
      );
      if (response.data['status']) {
        log(response.data['message'].toString());
        log(response.data['data'].toString());
        showDialogItem(context, true);
      } else {
        MyToast("Something went wrong");
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            content: Text(id),
          ),
        );
      }
    } else {
      Fluttertoast.showToast(msg: "Invalid Operation");
    }
    notifyListeners();
  }

  String filterTagId(tag) {
    String? id;
    //get ID
    if (Platform.isAndroid) {
      id = (NfcA.from(tag!)?.identifier ??
              NfcB.from(tag!)?.identifier ??
              NfcF.from(tag!)?.identifier ??
              NfcV.from(tag!)?.identifier ??
              Uint8List(0))
          .toHexString();
    }
    if (Platform.isIOS) {
      id = getTagIdIos(tag!);
    }
    return id!;
  }

  showDialogItem(context, bool isSet) {
    showDialog(
      context: context,
      builder: (BuildContext context) => AlertDialog(
        content: isSet
            ? const Text("Member Card Set successfully")
            : const Text("Member Card Get successfully"),
      ),
    );
  }

//get tag id filter ios
  String getTagIdIos(NfcTag tag) {
    String? id;
    Object? tech;

    tech = FeliCa.from(tag);
    if (tech is FeliCa) {
      id = tech.currentIDm.toHexString().toString();
    }

    tech = Iso15693.from(tag);
    if (tech is Iso15693) {
      id = tech.identifier.toHexString().toString();
    }

    tech = Iso7816.from(tag);
    if (tech is Iso7816) {
      id = tech.identifier.toHexString().toString();
    }
    tech = MiFare.from(tag);
    if (tech is MiFare) {
      id = tech.identifier.toHexString().toString();
    }
    return id!;
  }
}
