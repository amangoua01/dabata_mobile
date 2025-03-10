import 'package:dabata_mobile/tools/components/card_suscribe.dart';
import 'package:dabata_mobile/tools/extensions/types/double.dart';
import 'package:dabata_mobile/tools/extensions/types/int.dart';
import 'package:dabata_mobile/views/controllers/home/user/user_card_subscribed_vctl.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';

class UserCardSubscribedSubPage extends StatelessWidget {
  const UserCardSubscribedSubPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<UserCardSubscribedVctl>(
      init: UserCardSubscribedVctl(),
      builder: (ctl) {
        return ListView(
          children: [
            Gap(20.h),
            ...ctl.cartes.map(
              (e) => Padding(
                padding: const EdgeInsets.symmetric(horizontal: 5.0),
                child: CardSuscribe(
                  e,
                  value: e.montantJournalier!.value / 73000 * 100,
                ),
              ),
            )
          ]
              .animate(interval: 500.ms)
              .slideX(delay: NumDurationExtensions(1).seconds)
              .fade(),
        );
      },
    );
  }
}
