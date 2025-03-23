import 'package:dabata_mobile/api/statistique_api_ctl.dart';
import 'package:dabata_mobile/models/carte_stats.dart';
import 'package:dabata_mobile/models/categorie_stats.dart';
import 'package:dabata_mobile/models/montant_souscrit_stats.dart';
import 'package:dabata_mobile/models/users_and_subscription_stat.dart';
import 'package:dabata_mobile/tools/extensions/types/int.dart';
import 'package:dabata_mobile/views/controllers/abstract/auth_view_controller.dart';

class DashboardSubAdminPageVctl extends AuthViewController {
  UsersAndSubscriptionStat? statData;
  MontantSouscritStats? amountStatData;

  List<CarteStats> carteStatData = [];
  List<CategorieStats> catStatData = [];
  bool loading = true;

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
        .fold(0, (sum, carte) => sum + carte.nombreSouscriptions.value);
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

    // Ajouter la catégorie Gadget si elle n'existe pas
    if (!totalsByCategory.containsKey("Gadget")) {
      totalsByCategory["Gadget"] = 0;
    }

    // Calculer le total de toutes les souscriptions pour les pourcentages
    int totalSouscriptions =
        totalsByCategory.values.fold(0, (sum, total) => sum + total);

    // Convertir en format pour le diagramme
    totalsByCategory.forEach((category, total) {
      double percentage =
          totalSouscriptions > 0 ? (total / totalSouscriptions * 100) : 0;

      result.add({
        'category': category,
        'total': total,
        'percentage': percentage,
      });
    });

    return result;
  }

  Future<void> getStatistique() async {
    var res = await StatistiqueApiCtl.getStatistique();
    if (res.status && res.data != null && res.data!.isNotEmpty) {
      statData = res.data!.first;
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
      update();
    }
  }

  Future<void> getAllCardStats() async {
    var res = await StatistiqueApiCtl.getAllSubcriptionByCard();
    if (res.status && res.data != null && res.data!.isNotEmpty) {
      carteStatData = res.data!;
      update();
    }
  }

  Future<void> getAllAmountTypeStats() async {
    var res = await StatistiqueApiCtl.getAllSubcriptionByAmountType();
    if (res.status && res.data != null && res.data!.isNotEmpty) {
      amountStatData = res.data!.first;
      update();
    }
  }

  double get totalAmount => amountStatData?.montantTotal ?? 0;
  double get totalAmountBuyed => amountStatData?.montantPaye ?? 0;
  double get totalAmountRest => amountStatData?.montantRestant ?? 0;

  @override
  void onReady() {
    super.onReady();
    getData();
  }

  Future<void> getData() async {
    loading = true;
    update();
    await getStatistique();
    await getAllCardStats();
    await getAllCategoryStats();
    await getAllAmountTypeStats();
    loading = false;
    update();
  }
}
