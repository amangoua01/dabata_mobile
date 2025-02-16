import 'package:dabata_mobile/tools/constants/app_colors.dart';
import 'package:flutter/material.dart';

class Gains extends StatelessWidget {
  const Gains({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Gains"),
      ),
      body: ListView.builder(
        itemCount: 10,
        itemBuilder: (context, index) => Container(
          child: ListTile(
            leading: CircleAvatar(
              backgroundColor: AppColors.primary,
              child: Image.asset("assets/icons/cadeau.png"),
            ),
            title: Text("Article de gain ${index + 1}"),
            trailing: CircleAvatar(
              radius: 17,
              child: Text("${index + 1}"),
            ),
          ),
        ),
      ),
    );
  }
}
