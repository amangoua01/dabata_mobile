import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:dabata_mobile/models/categorie.dart';
import 'package:dabata_mobile/tools/cache/cache.dart';
import 'package:dabata_mobile/api/carte_api_ctl.dart';
import 'package:dabata_mobile/api/categorie_api_clt.dart';

class CardListePageVctl extends GetxController
    with GetSingleTickerProviderStateMixin {
  late TabController controller;
  List card = [];
  List categories = [];
  var userToken = "";
  bool isLoading = true;

  Future<void> fetchUserToken() async {
    try {
      var jwt = await Cache.getString('jwt');
      userToken = jwt!;
      update();
      print("userToken $userToken");
    } catch (e) {
      print('Erreur lors de la récupération du token: $e');
    }
  }

  void _initTabController() {
    final categoriesCount = uniqueCategories.length;
    if (categoriesCount == 0) {
      debugPrint("Aucune catégorie trouvée");
      return;
    }
    controller = TabController(
      length: categoriesCount,
      vsync: this,
    );
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
    if (res.status) {
      print("categories ${res.data!.map((e) => e.toJson())}");
      categories = res.data!;
      isLoading = false;
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
      _initTabController();
      update();
    });

    fetchUserToken();
  }
}
