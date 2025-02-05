import 'package:dabata_mobile/tools/components/bottom_sheet_dot.dart';
import 'package:dabata_mobile/tools/constants/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

abstract class CBottomSheet {
  static Future<T?> show<T>({
    required Widget child,
    bool isDismissible = true,
    double? height,
    bool isScrollControlled = false,
  }) =>
      Get.bottomSheet<T>(
        Container(
          height: height,
          decoration: const BoxDecoration(
            color: AppColors.primary,
            borderRadius: BorderRadius.vertical(
              top: Radius.circular(20),
            ),
          ),
          child: Column(
            children: [
              const BottomSheetDot(),
              const Gap(10),
              Expanded(
                child: Container(
                  padding: const EdgeInsets.only(left: 5, right: 5, top: 20),
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.vertical(
                      top: Radius.circular(20),
                    ),
                  ),
                  child: child,
                ),
              ),
            ],
          ),
        ),
        isScrollControlled: isScrollControlled,
        isDismissible: isDismissible,
      );
}
