import 'package:flutter/material.dart';

class TextEditingItem extends StatelessWidget {
  final TextEditingController controller;
  final String lable;
  final String type;
  final bool isSecure;
  const TextEditingItem(
      {Key? key,
      required this.controller,
      required this.lable,
      required this.type,
        this.isSecure=false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 7),
      child: TextField(
      obscureText: isSecure,
          keyboardType: type == "number"
              ? TextInputType.number
              : TextInputType.emailAddress,
          controller: controller,
          decoration: InputDecoration(
            labelText: lable,
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
            focusedBorder:
                OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
            enabledBorder:
                OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
          )),
    );
  }
}
