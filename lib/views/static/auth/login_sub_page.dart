import 'package:dabata_mobile/tools/widgets/inputs/buttons/c_button.dart';
import 'package:dabata_mobile/tools/widgets/inputs/c_text_form_field.dart';
import 'package:dabata_mobile/views/controllers/auth/login_vctl.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

class LoginSubPage extends StatelessWidget {
  final bool withReturn;
  const LoginSubPage(this.withReturn, {super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<LoginVctl>(
      init: LoginVctl(withReturn: withReturn),
      builder: (ctl) {
        return Scaffold(
          body: Form(
            key: ctl.formKey,
            child: Container(
              color: Colors.white,
              child: ListView(
                padding: const EdgeInsets.only(left: 20, right: 20, bottom: 20),
                children: [
                  Lottie.asset("assets/lotties/epargner.json", height: 250),
                  CTextFormField(
                    require: true,
                    controller: ctl.emailController,
                    prefixIcon: const Icon(Icons.person),
                    labelText: "Email*",
                  ),
                  CTextFormField(
                    controller: ctl.passwordController,
                    obscureText: ctl.hidePass,
                    prefixIcon: const Icon(Icons.lock),
                    require: true,
                    keyboardType: TextInputType.number,
                    maxLength: 8,
                    labelText: "Mot de passe*",
                    suffixIcon: IconButton(
                      onPressed: () {
                        ctl.hidePass = !ctl.hidePass;
                        ctl.update();
                      },
                      icon: ctl.hidePass
                          ? const Icon(Icons.visibility)
                          : const Icon(Icons.visibility_off),
                    ),
                  ),
                  const Gap(20),
                  CButton(
                    onPressed: ctl.submit,
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.login),
                        Gap(5),
                        Text("Connexion"),
                      ],
                    ),
                  ),
                  const Gap(10),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
