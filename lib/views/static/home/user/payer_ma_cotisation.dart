import 'package:dabata_mobile/models/mode_paiement.dart';
import 'package:dabata_mobile/models/souscription.dart';
import 'package:dabata_mobile/models/users.dart';
import 'package:dabata_mobile/tools/extensions/types/string.dart';
import 'package:dabata_mobile/tools/widgets/inputs/buttons/c_button.dart';
import 'package:dabata_mobile/tools/widgets/inputs/c_date_form_field.dart';
import 'package:dabata_mobile/tools/widgets/inputs/c_drop_down_form_field.dart';
import 'package:dabata_mobile/tools/widgets/inputs/c_text_form_field.dart';
import 'package:dabata_mobile/views/controllers/home/user/payer_ma_cotisation_vctl.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

class PayerMaCotisation extends StatelessWidget {
  final User? user;
  const PayerMaCotisation({this.user, super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<PayerMaCotisationVctl>(
      init: PayerMaCotisationVctl(user),
      builder: (ctl) {
        return Scaffold(
          appBar: AppBar(
            title: const Text("Faire un paiement"),
          ),
          body: Form(
            key: ctl.formKey,
            child: ListView(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              children: [
                const Gap(30),
                CDropDownFormField<User>(
                  labelText: "Utilisateur",
                  require: true,
                  enabled: user == null,
                  items: (e, props) => ctl.getUser(),
                  compareFn: (a, b) => true,
                  selectedItem: ctl.selectedUser,
                  popupProps: const PopupProps.menu(
                    showSearchBox: true,
                  ),
                  itemAsString: (e) =>
                      "${e.fullname.value}(${e.telephone.value})",
                  onChanged: (e) {
                    ctl.selectedUser = e;
                    ctl.selectedSubscription = null;
                    ctl.update();
                  },
                ),
                CDropDownFormField<Souscription>(
                  labelText: "Carte",
                  require: true,
                  items: (e, props) => ctl.getUserSubscription(),
                  compareFn: (a, b) => true,
                  enabled: ctl.selectedUser != null,
                  selectedItem: ctl.selectedSubscription,
                  popupProps: const PopupProps.menu(
                    showSearchBox: true,
                  ),
                  itemAsString: (e) =>
                      "${e.carte!.libelle.value} - ${e.carte!.categorie!.libelle.value}",
                  onChanged: (e) {
                    ctl.selectedSubscription = e;
                    ctl.update();
                  },
                ),
                CDropDownFormField<ModePaiement>(
                  labelText: "Mode de paiement",
                  require: true,
                  items: (e, props) => ctl.getModePaiement(),
                  compareFn: (a, b) => true,
                  enabled: ctl.selectedUser != null,
                  selectedItem: ctl.selectedModePaiement,
                  popupProps: const PopupProps.menu(
                    showSearchBox: true,
                  ),
                  itemAsString: (e) => e.libelle.value,
                  onChanged: (e) {
                    ctl.selectedModePaiement = e;
                    ctl.update();
                  },
                ),
                CTextFormField(
                  labelText: "Montant*",
                  require: true,
                  controller: ctl.montantCtl,
                  keyboardType: TextInputType.number,
                ),
                const Gap(10),
                CDateFormField(
                  labelText: "Date de paiement*",
                  require: true,
                  controller: ctl.dateCtl,
                  onChange: (e) {
                    ctl.dateCtl.date = e;
                    ctl.update();
                  },
                ),
                const Gap(10),
                CButton(
                  height: 50,
                  onPressed: ctl.submit,
                  child: const Text("Valider"),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
