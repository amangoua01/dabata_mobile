import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UserDescriptionCard extends StatelessWidget {
  final String image;
  final String fullName;
  final String phoneNumber;

  const UserDescriptionCard({
    super.key,
    required this.image,
    required this.fullName,
    required this.phoneNumber,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        //color: Colors.orange.shade100,
        borderRadius: BorderRadius.all(Radius.circular(10)),
      ),
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: Colors.orange.shade50,
          radius: 30,
          backgroundImage:
              (!image.isURL) ? AssetImage(image) : NetworkImage(image),
        ),
        title: Text(
          fullName,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        subtitle: Text(phoneNumber),
      ),
    );
  }
}
