import 'package:dabata_mobile/tools/constants/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Gains extends StatelessWidget {
  const Gains({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Gains"),
        automaticallyImplyLeading: false,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 15, left: 10, bottom: 20),
            child: Text(
              "Mes articles",
              style: TextStyle(
                fontSize: 15.sp,
                color: Colors.grey.shade600,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
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
          ),
        ],
      ),
    );
  }
}
