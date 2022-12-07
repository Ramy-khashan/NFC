import 'package:flutter/material.dart'; 

class ViewUserInfo extends StatelessWidget {
  final String title;
  final String content;
  const ViewUserInfo({
    Key? key,
    required this.title,
    required this.content,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 7),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(fontSize: 16, color: Colors.grey.shade500),
          ),
          Text(
            content,
            style:const TextStyle(
              fontSize: 19,
              fontWeight: FontWeight.w500,
            ),
          )
        ],
      ),
    );
  }
}
