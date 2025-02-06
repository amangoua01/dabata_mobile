import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DescriptionCard extends StatelessWidget {
  final int nombre;
  final String title;
  const DescriptionCard({super.key, required this.nombre, required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(5),
      height: 80.h,
      width: 160.w,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Colors.orange.shade100),
        /* boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 1,
              blurRadius: 1,
              offset: const Offset(0, 1), // changes position of shadow
            )
          ] */
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Text(
            title,
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 15.sp,
                color: Colors.blueGrey.shade400),
          ),
          const Spacer(),
          Text(
            '${nombre.toString()} Personnes',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 18.sp,
            ),
          ),
        ],
      ),
    );
  }
}
