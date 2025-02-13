import 'package:dabata_mobile/tools/components/user_description_card.dart';
import 'package:dabata_mobile/tools/widgets/inputs/c_text_field.dart';
import 'package:dabata_mobile/views/static/admin/home/edtion_user_page.dart';
import 'package:dabata_mobile/views/static/home/User/user_profile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

class UsersListSubPage extends StatelessWidget {
  const UsersListSubPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Liste des utilisateurs"),
      ),
      body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(children: [
            const CTextField(
              labelText: "Rechercher un utilisateur",
              suffixIcon: Icon(Icons.search),
            ),
            const Gap(10),
            Expanded(
                child: ListView.separated(
              separatorBuilder: (context, index) => const Gap(10),
              itemCount: 10,
              itemBuilder: (context, index) => GestureDetector(
                onTap: () => Get.to(
                  () => const UserProfile(isUserView: false),
                ),
                child: const UserDescriptionCard(
                  image: "assets/icons/user2.png",
                  fullName: 'Hassan Dabata',
                  phoneNumber: '07 000 000 00',
                ),
              ),
            )),
          ])),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.orange,
        child: const Icon(Icons.add),
        onPressed: () => Get.to(() => const EdtionUserPage()),
      ),
    );
  }
}
