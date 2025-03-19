import 'package:dabata_mobile/api/statistique_api_ctl.dart';
import 'package:dabata_mobile/models/carte.dart';
import 'package:dabata_mobile/models/montant_souscrit_stats.dart';
import 'package:dabata_mobile/models/souscription.dart';
import 'package:dabata_mobile/models/users.dart';
import 'package:dabata_mobile/tools/cache/cache.dart';
import 'package:dabata_mobile/tools/constants/etat_souscription.dart';
import 'package:flutter/material.dart';
import 'package:dabata_mobile/api/souscription_api_ctl.dart';
import 'package:get/get.dart';

class DashboardVctl extends GetxController
    with GetSingleTickerProviderStateMixin {
  var user = Get.find<User>();
  var userToken = '';

  MontantSouscritStats? amountStatData;

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

/*   Future<void> getUserAllSubscriptionCard() async {
    var res = await SouscriptionApiCtl.getUserSubscrition(user.id.toString());
    if (res.status) {
      cartes = res.data!.map((s) => Carte.fromJson(s.carte!.toJson())).toList();
      souscriptions = res.data!;
    }
    update();
  } */
  Future<void> getUserAllSubscriptionCard() async {
    var res = await SouscriptionApiCtl.getUserSubscrition(user.id.toString());
    if (res.status) {
      souscriptions = res.data!;

      // Créer les cartes avec les montants cotisés
      cartes = res.data!.map((s) {
        var carte = Carte.fromJson(s.carte!.toJson());
        // Ajouter le montant cotisé à la carte
        carte.montantCotise = s.montantCotise;
        print('cotisation ${s.montantCotise}');
        return carte;
      }).toList();
    }
    update();
  }

  Future<void> fetchUserToken() async {
    try {
      var jwt = await Cache.getString('jwt');
      //print('User token: $jwt');
      userToken = jwt!;
      update();
      print("userToken $userToken");
      // Vous pouvez maintenant utiliser userToken ici
    } catch (e) {
      print('Erreur lors de la récupération du token: $e');
    }
  }

  Future<void> getAllAmountTypeStats() async {
    var res = await StatistiqueApiCtl.getAllSubcriptionByAmountTypeForUser();
    if (res.status && res.data != null && res.data!.isNotEmpty) {
      amountStatData = res.data!.first;
      print("amount stats ${amountStatData?.toJson()}");
      update();
    }
  }

  double get totalAmount => amountStatData?.montantTotal ?? 0;
  double get totalAmountBuyed => amountStatData?.montantPaye ?? 0;
  double get totalAmountRest => amountStatData?.montantRestant ?? 0;

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
    fetchUserToken();
    getUserAllSubscriptionCard();
    getAllAmountTypeStats();
  }
}
