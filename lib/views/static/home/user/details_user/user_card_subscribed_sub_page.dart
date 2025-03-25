import 'package:dabata_mobile/tools/components/card_suscribe.dart';
import 'package:dabata_mobile/tools/constants/app_colors.dart';
import 'package:dabata_mobile/tools/widgets/empty_list_content.dart';
import 'package:dabata_mobile/tools/widgets/placeholder_widget.dart';
import 'package:dabata_mobile/views/controllers/home/user/user_card_subscribed_vctl.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';

import '../../../../../models/users.dart';

class UserCardSubscribedSubPage extends StatelessWidget {
  final User user;
  const UserCardSubscribedSubPage(this.user, {super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<UserCardSubscribedVctl>(
      init: UserCardSubscribedVctl(user: user),
      builder: (ctl) {
        return ctl.isLoading
            ? const Center(
                child: CircularProgressIndicator(
                  color: AppColors.primary,
                ),
              )
            : PlaceHolderWidget(
                condition: ctl.allcardGetted.isNotEmpty,
                placeholder: const EmptyListContent(
                  mainAxisAlignment: MainAxisAlignment.center,
                ),
                child: ListView(
                  children: [
                    Gap(20.h),
                    ...ctl.allcardGetted.map(
                      (e) => CardSuscribe(
                        e,
                        value: e.tauxCotisation,
                      ),
                    ),
                  ]
                      .animate(interval: 500.ms)
                      .slideX(delay: NumDurationExtensions(1).seconds)
                      .fade(),
                ),
              );
      },
    );
  }
}
