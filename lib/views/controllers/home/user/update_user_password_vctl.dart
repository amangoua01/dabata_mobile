import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UpdateUserPasswordVctl extends GetxController {
  var formKey = GlobalKey<FormState>();
  var oldPassword = TextEditingController();
  var newPassword = TextEditingController();
  var confirmPassword = TextEditingController();

  Future<void> submit() async {
    if (formKey.currentState!.validate()) {}
  }
}
