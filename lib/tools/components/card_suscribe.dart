import 'package:dabata_mobile/tools/extensions/types/double.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

class CardSuscribe extends StatelessWidget {
  final double? amount;
  final String title;
  final String image;
  final String category;
  const CardSuscribe(
      {super.key,
      required this.title,
      required this.image,
      required this.amount,
      required this.category});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8.h),
      child: Container(
          padding: const EdgeInsets.all(5).w,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              //mainAxisSize: MainAxisSize.max,
              children: [
                Container(
                  color: Colors.amber,
                  height: 30,
                  width: 30,
                  child: Center(
                    child: Image.network(
                      image,
                      fit: BoxFit.cover,
                      height: 100,
                    ),
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(title),
                    const Gap(10),
                    Text(category),
                    const Gap(10),
                    Row(mainAxisAlignment: MainAxisAlignment.start, children: [
                      Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              "Payé",
                              style: TextStyle(color: Colors.green),
                            ),
                            const Gap(5),
                            Text(amount.toAmount()),
                          ]),
                      const Gap(10),
                      const Text(
                        "/",
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: 30,
                        ),
                      ),
                      const Gap(10),
                      Column(
                          //crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              "Restant",
                              style: TextStyle(color: Colors.red),
                            ),
                            const Gap(5),
                            Text(amount.toAmount()),
                          ]),
                    ])
                  ],
                ),
              ])),
    );
  }
}
