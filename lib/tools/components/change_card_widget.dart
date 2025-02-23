import 'package:flutter/material.dart';
import 'package:dabata_mobile/tools/extensions/types/double.dart';

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
      height: 100,
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.orange.shade100),
        borderRadius: BorderRadius.circular(10),
      ),
      child: ListTile(
        contentPadding: const EdgeInsets.all(8),
        leading: Image.network(
          image,
          height: 100,
          width: 100,
          fit: BoxFit.cover,
        ),
        title: Text(
          title,
          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              category,
              style: const TextStyle(fontSize: 18),
            ),
            Text("${amount.toAmount()} / jour")
          ],
        ),
        trailing: radio,
      ),
    );
  }
}
