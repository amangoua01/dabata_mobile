import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:flutter/material.dart';
import 'package:dabata_mobile/models/users.dart';
import 'package:dabata_mobile/views/controllers/auth/login_vctl.dart';
import 'package:dabata_mobile/tools/widgets/inputs/buttons/c_button.dart';
import 'package:dabata_mobile/tools/widgets/inputs/c_text_form_field.dart';

class LoginSubPage extends StatelessWidget {
  const LoginSubPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<LoginVctl>(
      init: LoginVctl(),
      builder: (ctl) {
        return Scaffold(
          body: Container(
            color: Colors.white,
            child: ListView(
              padding: const EdgeInsets.only(left: 20, right: 20, bottom: 20),
              children: [
                Lottie.asset("assets/lotties/epargner.json", height: 250),
                CTextFormField(
                  controller: ctl.emailController,
                  prefixIcon: const Icon(Icons.person),
                  labelText: "email",
                ),
                CTextFormField(
                  controller: ctl.passwordController,
                  obscureText: true,
                  prefixIcon: const Icon(Icons.lock),
                  labelText: "Mot de passe",
                ),
                const Gap(20),
                CButton(
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.login),
                        Gap(5),
                        Text("Connexion"),
                      ],
                    ),
                    onPressed: () {
                      var user = User(
                        email: ctl.emailController.text,
                        password: ctl.passwordController.text,
                      );

                      ctl.submit(user);
                      //Get.to(() => const Home());
                    }),

                /* CButton(
                    child: const Text("Connexion admin"),
                    onPressed: () {
                      var user = User(
                        email: ctl.emailController.text,
                        password: ctl.passwordController.text,
                      );

                      ctl.submit(user);
                      //Get.to(() => const AdminDashboard());
                    }), */
                const Gap(10),
                // Row(
                //   mainAxisAlignment: MainAxisAlignment.end,
                //   children: [
                //     CTextButton(
                //       onPressed: () {},
                //       child: const Text(
                //         "Mot de passe oublié?",
                //         style: TextStyle(color: AppColors.primary),
                //       ),
                //     ),
                //   ],
                // ),
              ],
            ),
          ),
        );
      },
    );
  }
}
