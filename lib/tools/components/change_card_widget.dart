import 'package:dabata_mobile/tools/extensions/types/double.dart';
import 'package:flutter/material.dart';

class ChangeCardWidget extends StatelessWidget {
  final String title;
  final Widget? radio;
  final String image;
  final double amount;
  final String category;

  const ChangeCardWidget(
      {super.key,
      this.radio,
      required this.title,
      required this.image,
      required this.amount,
      required this.category});

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.all(10),
        height: 100,
        //width: 150,
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: Colors.orange.shade100),
          borderRadius: BorderRadius.circular(10),
          /* boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 1,
                blurRadius: 4,
                offset: const Offset(0, 3), // changes position of shadow
              )
            ] */
        ),
        child: ListTile(
          contentPadding: const EdgeInsets.all(8),
          leading: Image.network(image, height: 60),
          title: Text(
            title,
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          subtitle: Text(
            '$category / ${amount.toAmount()}',
            style: const TextStyle(fontSize: 18),
          ),
          trailing: radio,
        ));
  }
}
