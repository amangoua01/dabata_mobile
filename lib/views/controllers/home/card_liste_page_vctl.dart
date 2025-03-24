import 'package:dabata_mobile/api/carte_api_ctl.dart';
import 'package:dabata_mobile/api/categorie_api_clt.dart';
import 'package:dabata_mobile/models/carte.dart';
import 'package:dabata_mobile/models/categorie.dart';
import 'package:dabata_mobile/views/controllers/abstract/auth_view_controller.dart';
import 'package:flutter/material.dart';

class CardListePageVctl extends AuthViewController {
  List<Carte> card = [];
  List<Categorie> categories = [];
  bool isLoading = true;

  void initTabController() {
    final categoriesCount = uniqueCategories.length;
    if (categoriesCount == 0) {
      debugPrint("Aucune catégorie trouvée");
      return;
    }
  }

  Future<void> getAllCard() async {
    isLoading = true;
    update();
    var res = await CarteApiCtl.getCartes();
    if (res.status) {
      isLoading = false;
      card = res.data!;
      isLoading = false;
      update();
    }
  }

  Future<void> getAllCategorie() async {
    var res = await CategorieApiClt.getAllCategories();
    isLoading = false;
    if (res.status) {
      categories = res.data!;
    }
  }

  // Méthode pour obtenir les catégories uniques
  /*  List<Categorie> get uniqueCategories {
    final Map<int, Categorie> categoriesMap = {};
    for (var carte in card) {
      if (carte.categorie != null) {
        categoriesMap[carte.categorie!.id!] = carte.categorie!;
      }
    }
    return categoriesMap.values.toList();
  } */
  List<Categorie> get uniqueCategories {
    return categories.cast<Categorie>();
  }

  @override
  void onReady() {
    super.onReady();

    Future.wait([getAllCard(), getAllCategorie()]).then((_) {
      initTabController();
      update();
    });
  }
}
