import 'package:dabata_mobile/models/carte.dart';
import 'package:dabata_mobile/models/souscription.dart';
import 'package:dabata_mobile/models/users.dart';
import 'package:dabata_mobile/tools/constants/etat_souscription.dart';
import 'package:flutter/material.dart';
import 'package:dabata_mobile/api/souscription_api_ctl.dart';
import 'package:get/get.dart';

class DashboardVctl extends GetxController
    with GetSingleTickerProviderStateMixin {
  var user = Get.find<User>();

  List<Carte> cartes = [];
  List<Souscription> souscriptions = [];

  List<Souscription> get souscriptionsSoldees => souscriptions
      .where((s) => s.etat == EtatSouscription.soldee.code)
      .toList();

  List<Carte> get cartesSoldees =>
      souscriptionsSoldees.map((s) => s.carte!).toList();

  List<Souscription> get souscriptionsEnCours => souscriptions
      .where((s) => s.etat == EtatSouscription.enCours.code)
      .toList();

  List<Carte> get cartesEnCours =>
      souscriptionsEnCours.map((s) => s.carte!).toList();

  List<Souscription> get souscriptionsAnnuler => souscriptions
      .where((s) => s.etat == EtatSouscription.annulee.code)
      .toList();

  List<Carte> get cartesAnnuler =>
      souscriptionsAnnuler.map((s) => s.carte!).toList();

  Future<void> getUserAllSubscriptionCard() async {
    var res = await SouscriptionApiCtl.getUserSubscrition(user.id.toString());
    if (res.status) {
      //cartes = res.data!.map((s) => Carte.fromJson(s.carte!.toJson())).toList();
      souscriptions = res.data!;
    }
    update();
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
    getUserAllSubscriptionCard();
  }
}
