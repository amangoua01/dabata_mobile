import 'package:dabata_mobile/api/statistique_api_ctl.dart';
import 'package:dabata_mobile/models/carte_stats.dart';
import 'package:dabata_mobile/models/categorie_stats.dart';
import 'package:dabata_mobile/models/montant_souscrit_stats.dart';
import 'package:dabata_mobile/models/users_and_subscription_stat.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

/* class DashboardSubPageVctl extends GetxController {
  UsersAndSubscriptionStat? statData;
  MontantSouscritStats? amountStatData;

  List<CarteStats> carteStatData = [];
  List<CategorieStats> catStatData = [];

  Future<void> getStatistique() async {
    var res = await StatistiqueApiCtl.getStatistique();
    if (res.status && res.data != null && res.data!.isNotEmpty) {
      statData = res.data!.first;
      print("user stats ${statData?.toJson()}");
      update();
    }
  }

  // Si nécessaire, ajoute d'autres getters pour faciliter l'accès aux données
  int get usersCount => statData?.usersAll ?? 0;
  int get usersYearCount => statData?.usersYear ?? 0;
  int get souscriptionsCount => statData?.souscriptionsAll ?? 0;
  int get souscriptionsYearCount => statData?.souscriptionsYear ?? 0;

  Future<void> getAllCategoryStats() async {
    var res = await StatistiqueApiCtl.getAllSubcriptionByCategory();
    if (res.status && res.data != null && res.data!.isNotEmpty) {
      catStatData = res.data!;
      print("cat stats ${catStatData.map((e) => e.toJson())}");
      update();
    }
  }

  Future<void> getAllCardStats() async {
    var res = await StatistiqueApiCtl.getAllSubcriptionByCard();
    if (res.status && res.data != null && res.data!.isNotEmpty) {
      carteStatData = res.data!;
      print("carte stats ${carteStatData.map((e) => e.toJson())}");
      update();
    }
  }

  Future<void> getAllAmountTypeStats() async {
    var res = await StatistiqueApiCtl.getAllSubcriptionByAmountType();
    if (res.status && res.data != null && res.data!.isNotEmpty) {
      amountStatData = res.data!.first;
      print("amount stats ${amountStatData?.toJson()}");
      update();
    }
  }

  //Future<void> refresh() async {}

  @override
  void onReady() {
    super.onReady();
    getStatistique();
    getAllCardStats();
    getAllCategoryStats();
    getAllAmountTypeStats();
  }
} */
class DashboardSubPageVctl extends GetxController {
  UsersAndSubscriptionStat? statData;
  MontantSouscritStats? amountStatData;

  List<CarteStats> carteStatData = [];
  List<CategorieStats> catStatData = [];

  // Méthode pour regrouper les cartes par catégorie
  Map<String, List<CarteStats>> get cartesByCategory {
    Map<String, List<CarteStats>> result = {};

    for (var carte in carteStatData) {
      if (!result.containsKey(carte.categorieLibelle)) {
        result[carte.categorieLibelle ?? "Autre"] = [];
      }
      result[carte.categorieLibelle ?? "Autre"]!.add(carte);
    }

    return result;
  }

  // Calcul du total des souscriptions pour une catégorie
  int getCategorySouscriptionsTotal(String categorie) {
    return carteStatData
        .where((carte) => carte.categorieLibelle == categorie)
        .fold(0, (sum, carte) => sum + (carte.nombreSouscriptions ?? 0));
  }

  // Calcul du pourcentage de souscriptions pour une catégorie
  double getCategorySouscriptionsPercentage(String categorie) {
    int categoryTotal = getCategorySouscriptionsTotal(categorie);
    int total = carteStatData.fold(
        0, (sum, carte) => sum + (carte.nombreSouscriptions ?? 0));
    return total > 0 ? (categoryTotal / total * 100) : 0;
  }

  // Obtenir les données pour le diagramme circulaire par catégorie
  List<Map<String, dynamic>> get pieChartDataByCategory {
    List<Map<String, dynamic>> result = [];
    Map<String, int> totalsByCategory = {};

    // Calculer le total par catégorie
    for (var carte in carteStatData) {
      String category = carte.categorieLibelle ?? "Autre";
      totalsByCategory[category] =
          (totalsByCategory[category] ?? 0) + (carte.nombreSouscriptions ?? 0);
    }

    // Convertir en format pour le diagramme
    totalsByCategory.forEach((category, total) {
      result.add({
        'category': category,
        'total': total,
        'percentage': getCategorySouscriptionsPercentage(category)
      });
    });

    return result;
  }

  Future<void> getStatistique() async {
    var res = await StatistiqueApiCtl.getStatistique();
    if (res.status && res.data != null && res.data!.isNotEmpty) {
      statData = res.data!.first;
      print("user stats ${statData?.toJson()}");
      update();
    }
  }

  int get usersCount => statData?.usersAll ?? 0;
  int get usersYearCount => statData?.usersYear ?? 0;
  int get souscriptionsCount => statData?.souscriptionsAll ?? 0;
  int get souscriptionsYearCount => statData?.souscriptionsYear ?? 0;

  Future<void> getAllCategoryStats() async {
    var res = await StatistiqueApiCtl.getAllSubcriptionByCategory();
    if (res.status && res.data != null && res.data!.isNotEmpty) {
      catStatData = res.data!;
      print("cat stats ${catStatData.map((e) => e.toJson())}");
      update();
    }
  }

  Future<void> getAllCardStats() async {
    var res = await StatistiqueApiCtl.getAllSubcriptionByCard();
    if (res.status && res.data != null && res.data!.isNotEmpty) {
      carteStatData = res.data!;
      print("carte stats ${carteStatData.map((e) => e.toJson())}");
      update();
    }
  }

  Future<void> getAllAmountTypeStats() async {
    var res = await StatistiqueApiCtl.getAllSubcriptionByAmountType();
    if (res.status && res.data != null && res.data!.isNotEmpty) {
      amountStatData = res.data!.first;
      print("amount stats ${amountStatData?.toJson()}");
      update();
    }
  }

  double get totalAmount => amountStatData?.montantTotal ?? 0;
  double get totalAmountBuyed => amountStatData?.montantPaye ?? 0;
  double get totalAmountRest => amountStatData?.montantRestant ?? 0;

  @override
  void onReady() {
    super.onReady();
    getStatistique();
    getAllCardStats();
    getAllCategoryStats();
    getAllAmountTypeStats();
  }
}
