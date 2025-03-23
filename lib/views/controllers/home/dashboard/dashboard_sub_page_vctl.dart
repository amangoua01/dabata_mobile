import 'package:dabata_mobile/api/souscription_api_ctl.dart';
import 'package:dabata_mobile/api/statistique_api_ctl.dart';
import 'package:dabata_mobile/models/carte.dart';
import 'package:dabata_mobile/models/montant_souscrit_stats.dart';
import 'package:dabata_mobile/models/souscription.dart';
import 'package:dabata_mobile/tools/alert_widgets/c_alert_dialog.dart';
import 'package:dabata_mobile/tools/constants/etat_souscription.dart';
import 'package:dabata_mobile/tools/extensions/types/int.dart';
import 'package:dabata_mobile/views/controllers/abstract/auth_view_controller.dart';
import 'package:dabata_mobile/views/static/home/card_pages/card_liste_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DashboardSubPageVctl extends AuthViewController
    with GetSingleTickerProviderStateMixin {
  List<Souscription> souscriptions = [];
  MontantSouscritStats? amountStatData;
  bool isLoading = true;

  List<Souscription> get souscriptionsSoldees => souscriptions
      .where((s) => s.etat == EtatSouscription.soldee.code)
      .toList();

  List<Carte> get cartesSoldees =>
      souscriptionsSoldees.map((s) => s.carte!).toList();

  List<Souscription> get souscriptionsEnCours => souscriptions
      .where((s) => s.etat == EtatSouscription.enCours.code)
      .toList();

  List<Souscription> get souscriptionsAnnuler => souscriptions
      .where((s) => s.etat == EtatSouscription.annulee.code)
      .toList();

  List<Carte> get cartesAnnuler =>
      souscriptionsAnnuler.map((s) => s.carte!).toList();

  Future<void> getUserAllSubscriptionCard() async {
    isLoading = true;
    update();
    var res = await SouscriptionApiCtl.getUserSubscrition(user!.id.value);
    isLoading = false;
    update();
    if (res.status) {
      souscriptions = res.data!;
      update();
    } else {
      CAlertDialog.show(message: res.message);
    }
  }

  Future<void> getAllAmountTypeStats() async {
    var res = await StatistiqueApiCtl.getAllSubcriptionByAmountTypeForUser();
    if (res.status && res.data != null && res.data!.isNotEmpty) {
      amountStatData = res.data!.first;
      update();
    }
  }

  double get totalAmount => amountStatData?.montantTotal ?? 0;
  double get totalAmountBuyed => amountStatData?.montantPaye ?? 0;
  double get totalAmountRest => amountStatData?.montantRestant ?? 0;

  late final TabController controller;

  Future<void> subscribe() async =>
      Get.to(() => const CardListePage(withProfil: false));

  @override
  void onInit() {
    super.onInit();
    controller = TabController(length: 3, vsync: this);
  }

  @override
  void onReady() {
    super.onReady();
    getUserAllSubscriptionCard();
    getAllAmountTypeStats();
  }
}
