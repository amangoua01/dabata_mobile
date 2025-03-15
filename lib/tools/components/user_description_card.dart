import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UserDescriptionCard extends StatelessWidget {
  final String image;
  final String fullName;
  //final  void Function()? onTap;

  final String phoneNumber;

  const UserDescriptionCard({
    super.key,
    required this.image,
    required this.fullName,
    required this.phoneNumber,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      dense: true,
      leading: CircleAvatar(
        backgroundColor: Colors.orange.shade50,
        radius: 20,
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
      trailing: const Icon(
        Icons.arrow_forward_ios,
        size: 15,
      ),
    );
  }
}
