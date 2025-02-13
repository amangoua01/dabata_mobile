import 'package:dabata_mobile/tools/extensions/types/datetime.dart';
import 'package:flutter/material.dart';
import 'package:dabata_mobile/tools/constants/app_colors.dart';
import 'package:dabata_mobile/tools/extensions/types/string.dart';
import 'package:flutter_animate/flutter_animate.dart';

class HistoricPaymentCard extends StatelessWidget {
  final String title;
  final double amount;
  final String categorie;
  final DateTime? dateTime;

  const HistoricPaymentCard({
    super.key,
    this.dateTime,
    required this.title,
    required this.amount,
    required this.categorie,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.grey.shade200,
          borderRadius: BorderRadius.circular(10),
        ),
        child: ListTile(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          contentPadding: const EdgeInsets.all(10),
          leading: CircleAvatar(
            radius: 25,
            backgroundColor: Colors.white,
            child: Image.asset(
              'assets/icons/payer.png',
              color: AppColors.primary.shade300,
              height: 35,
            ),
          ),
          title: Text(
            title,
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
          subtitle: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(categorie),
              Text(
                dateTime!.toFrenchDateTime,
                //categorie,
              ),
            ],
          ),
          trailing: Text(
            amount.toString().toAmount(),
            style: const TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
          ),
        ).animate().scale().move(
              //delay: 900.ms,
              duration: 1000.ms,
            ),
      ),
    );
  }
}
