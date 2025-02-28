import 'package:dabata_mobile/tools/constants/app_colors.dart';
import 'package:dabata_mobile/tools/extensions/types/datetime.dart';
import 'package:flutter/material.dart';
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
      padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 5),
      child: Container(
        /*  decoration: BoxDecoration(
          color: Colors.grey.shade200,
          borderRadius: BorderRadius.circular(10),
        ), */
        child: ListTile(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          contentPadding: const EdgeInsets.all(0),
          leading: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50),
              border: Border.all(
                color: Colors.grey.shade300,
                width: 1,
              ),
            ),
            child: CircleAvatar(
              radius: 25,
              backgroundColor: Colors.white,
              child: Image.asset(
                'assets/icons/payer.png',
                color: AppColors.primary.shade300,
                height: 35,
              ),
            ),
          ),
          title: Text(
            title,
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
          subtitle: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              //Text(categorie),
              Text(
                dateTime!.toFrenchDateTime,
              ),
              Container(
                decoration: BoxDecoration(
                  color: Colors.green.shade100,
                  borderRadius: BorderRadius.circular(5),
                ),
                margin: const EdgeInsets.only(left: 10),
                child: const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 2),
                  child: Text('Payé', style: TextStyle(color: Colors.green)),
                ),
              )
            ],
          ),
          trailing: Text(
            '$amount F',
            style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.bold,
                color: Colors.grey.shade400),
          ),
        ).animate().scale().move(
              //delay: 900.ms,
              duration: 1000.ms,
            ),
      ),
    );
  }
}
