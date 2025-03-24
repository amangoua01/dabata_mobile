import 'package:dabata_mobile/api/mode_paiement_api_vctl.dart';
import 'package:dabata_mobile/api/paiement_api_ctl.dart';
import 'package:dabata_mobile/api/souscription_api_ctl.dart';
import 'package:dabata_mobile/api/user_api_ctl.dart';
import 'package:dabata_mobile/models/mode_paiement.dart';
import 'package:dabata_mobile/models/paiement.dart';
import 'package:dabata_mobile/models/souscription.dart';
import 'package:dabata_mobile/models/users.dart';
import 'package:dabata_mobile/tools/alert_widgets/c_alert_dialog.dart';
import 'package:dabata_mobile/tools/alert_widgets/c_snackbar.dart';
import 'package:dabata_mobile/tools/components/date_time_editing_controller.dart';
import 'package:dabata_mobile/tools/extensions/types/future.dart';
import 'package:dabata_mobile/tools/extensions/types/int.dart';
import 'package:dabata_mobile/tools/extensions/types/string.dart';
import 'package:dabata_mobile/views/controllers/abstract/auth_view_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PayerMaCotisationVctl extends AuthViewController {
  User? selectedUser;
  Souscription? selectedSubscription;
  ModePaiement? selectedModePaiement;
  var montantCtl = TextEditingController();
  var dateCtl = DateTimeEditingController();
  var formKey = GlobalKey<FormState>();

  PayerMaCotisationVctl(this.selectedUser);

  Future<List<User>> getUser() async {
    var res = await UserApiCtl.getAllUser();
    if (res.status) {
      return res.data!;
    } else {
      return [];
    }
  }

  Future<List<Souscription>> getUserSubscription() async {
    if (selectedUser?.uuId != null) {
      var res =
          await SouscriptionApiCtl.getUserSubscrition(selectedUser!.id.value);
      if (res.status) {
        return res.data!;
      } else {
        return [];
      }
    }
    return [];
  }

  Future<List<ModePaiement>> getModePaiement() async {
    if (selectedUser?.uuId != null) {
      var res = await ModePaiementApiVctl.getAll();
      if (res.status) {
        return res.data!;
      } else {
        return [];
      }
    }
    return [];
  }

  Future<void> submit() async {
    if (formKey.currentState!.validate()) {
      var res = await PaiementApiCtl.addPaiement(
        Paiement(
          user: selectedUser,
          modePaiement: selectedModePaiement,
          datePaiement: dateCtl.date?.toIso8601String(),
          montant: montantCtl.text.toDouble(),
        ),
        selectedSubscription!.id.value,
      ).load();
      if (res.status) {
        Get.back();
        CSnackbar.show(
          message: "Vous venez de payer la cotisation de"
              " ${selectedUser?.fullname} avec succès.",
        );
      } else {
        CAlertDialog.show(message: res.message);
      }
    }
  }
}
