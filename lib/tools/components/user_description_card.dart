import 'package:flutter/material.dart';

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
      decoration: BoxDecoration(
        color: Colors.orange.shade100,
        borderRadius: const BorderRadius.all(Radius.circular(10)),
      ),
      child: ListTile(
        leading: CircleAvatar(
            radius: 30,
            backgroundImage: NetworkImage(
              image,
            )),
        title: Text("Nom complet: $fullName"),
        subtitle: Text(phoneNumber),
      ),
    );
  }
}
