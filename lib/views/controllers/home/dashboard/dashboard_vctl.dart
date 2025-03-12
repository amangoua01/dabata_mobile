import 'package:dabata_mobile/models/souscription.dart';
import 'package:dabata_mobile/models/users.dart';
import 'package:flutter/material.dart';
import 'package:dabata_mobile/models/carte.dart';
import 'package:dabata_mobile/models/categorie.dart';
import 'package:dabata_mobile/api/souscription_api_ctl.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_ticket_provider_mixin.dart';

class DashboardVctl extends GetxController
    with GetSingleTickerProviderStateMixin {
  var user = Get.find<User>();

  List<Souscription> souscriptions = [];

/*   List<Carte> cartes = [
    Carte(
      id: 1,
      libelle: "Carte 1",
      //image:"https://img.freepik.com/psd-gratuit/conception-boite-cadeau-coloree-anniversaire_23-2150318126.jpg",
      debut: "2025-01-01",
      fin: "2023-12-31",
      montantJournalier: 2000,
      montantTotal: 2000,
      categorie: Categorie(id: 1, libelle: "Categorie 1"),
    ),
    Carte(
      id: 2,
      libelle: "Carte 2",
      //image:"https://img.freepik.com/vecteurs-premium/collection-cadeaux-noel-comprenant-sac-cadeau-rouge-motif-flocon-neige-plusieurs-cadeaux-emballes-tous-fond-blanc_444390-25259.jpg",
      debut: "2023-01-01",
      fin: "2023-12-31",
      montantJournalier: 800,
      montantTotal: 2000,
      categorie: Categorie(id: 2, libelle: "Categorie 2"),
    ),
    Carte(
      id: 3,
      libelle: "Carte 3",
      //image:"https://media.istockphoto.com/id/93236487/fr/photo/pile-de-cadeaux.jpg?s=612x612&w=0&k=20&c=SRePc-NG_QIjO2NN94qpynpdaZLDfL_9TjoF_u43gkQ=",
      debut: "2023-01-01",
      fin: "2023-12-31",
      montantJournalier: 150,
      montantTotal: 2000,
      categorie: Categorie(id: 3, libelle: "Categorie 3"),
    ),
    Carte(
      id: 4,
      libelle: "Carte 4",
      //image:"https://bloguelesnackbar.com/wp-content/uploads/2021/01/idee-cadeau-St-Valentin-Le-Snack-Bar.jpg",
      debut: "2023-01-01",
      fin: "2023-12-31",
      montantJournalier: 1650,
      montantTotal: 2000,
      categorie: Categorie(id: 4, libelle: "Categorie 4"),
    ),
  ]; */

  Future<void> getUserAllSubscription() async {
    var res = await SouscriptionApiCtl.getUserSubscrition(user.id.toString());
    if (res.status) {
      souscriptions = res.data!;
      print("souscriptions ${souscriptions.map((s) => s.toJson()).toList()}");
      print("USER ID ${user.id}");
      //souscriptions = res.data!;
      update();
    }
  }

  late final TabController controller;

  @override
  void onInit() {
    super.onInit();
    controller = TabController(length: 3, vsync: this);
  }

  @override
  void onClose() {
    controller.dispose();
    super.onClose();
  }

  @override
  void onReady() {
    super.onReady();
    getUserAllSubscription();
  }
}
