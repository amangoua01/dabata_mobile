import 'package:dabata_mobile/tools/components/user_description_card.dart';
import 'package:dabata_mobile/tools/constants/app_colors.dart';
import 'package:dabata_mobile/tools/extensions/types/string.dart';
import 'package:dabata_mobile/tools/widgets/inputs/c_text_field.dart';
import 'package:dabata_mobile/views/controllers/admin/user_list_sub_page_vctl.dart';
import 'package:dabata_mobile/views/static/admin/home/edtion_user_page.dart';
import 'package:dabata_mobile/views/static/home/user/details_user/user_detail_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

class UsersListSubPage extends StatelessWidget {
  const UsersListSubPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<UserListSubPageVctl>(
      init: UserListSubPageVctl(),
      builder: (ctl) {
        return Scaffold(
          appBar: AppBar(
            title: const Text("Liste des utilisateurs"),
          ),
          body: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                const CTextField(
                  hintText: "Rechercher un utilisateur",
                  suffixIcon: Icon(Icons.search),
                ),
                const Gap(10),
                Expanded(
                    child: ListView(children: [
                  ...ctl.users.map((e) => UserDescriptionCard(
                        leading: CircleAvatar(
                          radius: 25,
                          backgroundColor: AppColors.primary.shade100,
                          backgroundImage:
                              const AssetImage("assets/icons/user2.png"),
                        ), //Image.asset("assets/icons/user2.png"),
                        title: Text(
                          '${e.fullname.value} ',
                        ),
                        subtitle: Text(e.telephone ?? '',
                            style: const TextStyle(
                              fontSize: 12,
                            )),
                        trailing: const Icon(Icons.arrow_forward_ios),
                        onTap: () => Get.to(
                          () => UserDetailPage(e),
                        ),
                      ))
                ])),
              ],
            ),
          ),
          floatingActionButton: FloatingActionButton(
            backgroundColor: Colors.orange,
            child: const Icon(Icons.add),
            onPressed: () => Get.to(() => const EdtionUserPage()),
          ),
        );
      },
    );
  }
}
