import 'package:flutter/material.dart';

import '../../../controller/tag_reader_provider.dart';

class UserRentShape extends StatelessWidget {
  final TagReadProvider value;
  const UserRentShape({Key? key, required this.value}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Rent",
          style: TextStyle(fontSize: 16, color: Colors.grey.shade500),
        ),
        const SizedBox(
          height: 16,
        ),
        value.userRent!.isEmpty
            ? const Text(
                "User Not have rent",
                style: TextStyle(
                  fontSize: 19,
                  fontWeight: FontWeight.w500,
                ),
              )
            : SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                    children: List.generate(
                  value.userRent!.length,
                  (index) => Container(height: 120,
                    margin: const EdgeInsets.only(left: 10, bottom: 5,top: 10),
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(15),
                        boxShadow: [
                          BoxShadow(
                              color: Colors.grey.shade300,
                              spreadRadius: 3,
                              blurRadius: 3)
                        ]),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            value.userRent![index]["rentName"],
                            style: const TextStyle(
                                fontSize: 16, fontWeight: FontWeight.w500),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Text(
                            "Model : ${value.userRent![index]["rents"]["model"]}  ${ value.userRent![index]["rentName"]!="دولاب"?"\n\n":"  "}Size : ${value.userRent![index]["rents"]["size"]}",
                            style: const TextStyle(
                                fontSize: 14, fontWeight: FontWeight.w500),
                          ),
                            SizedBox(
                            height:value.userRent![index]["rentName"]=="دولاب"? 10:0,
                          ),
                        value.userRent![index]["rentName"]=="دولاب"?  Text(
                            "Location : ${value.userRent![index]["rents"]["location"]}",
                            style: const TextStyle(
                                fontSize: 14, fontWeight: FontWeight.w500),
                          ):SizedBox()
                        ]),
                  ),
                )),
              )
      ],
    );
  }
}
