import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:dabata_mobile/models/categorie.dart';
import 'package:dabata_mobile/api/carte_api_ctl.dart';
//import 'package:dabata_mobile/api/categorie_api_clt.dart';

/* class CardListePageVctl extends GetxController
    with GetSingleTickerProviderStateMixin {
  late TabController controller;
  List<Carte> card = [];
  List<Categorie> categories = [];

  /* final List<Carte> loadedCartes = [
    Carte(
      id: 1,
      libelle: "Carte 1",
      image:
          "https://img.freepik.com/psd-gratuit/conception-boite-cadeau-coloree-anniversaire_23-2150318126.jpg",
      debut: "2025-01-01",
      fin: "2023-12-31",
      montantJournalier: 200,
      categorie: Categorie(id: 1, libelle: "Categorie 1"),
    ),
    Carte(
      id: 2,
      libelle: "Carte 2",
      image:
          "https://img.freepik.com/vecteurs-premium/collection-cadeaux-noel-comprenant-sac-cadeau-rouge-motif-flocon-neige-plusieurs-cadeaux-emballes-tous-fond-blanc_444390-25259.jpg",
      debut: "2023-01-01",
      fin: "2023-12-31",
      montantJournalier: 50,
      categorie: Categorie(id: 1, libelle: "Categorie 1"),
    ),
    Carte(
      id: 3,
      libelle: "Carte 3",
      image:
          "https://media.istockphoto.com/id/93236487/fr/photo/pile-de-cadeaux.jpg?s=612x612&w=0&k=20&c=SRePc-NG_QIjO2NN94qpynpdaZLDfL_9TjoF_u43gkQ=",
      debut: "2023-01-01",
      fin: "2023-12-31",
      montantJournalier: 150,
      categorie: Categorie(id: 2, libelle: "Categorie 2"),
    ),
    Carte(
      id: 4,
      libelle: "Carte 4",
      image:
          "https://bloguelesnackbar.com/wp-content/uploads/2021/01/idee-cadeau-St-Valentin-Le-Snack-Bar.jpg",
      debut: "2023-01-01",
      fin: "2023-12-31",
      montantJournalier: 100,
      categorie: Categorie(id: 2, libelle: "Categorie 2"),
    ),
    Carte(
      id: 5,
      libelle: "Carte 5",
      image:
          "https://bloguelesnackbar.com/wp-content/uploads/2021/01/idee-cadeau-St-Valentin-Le-Snack-Bar.jpg",
      debut: "2024-01-01",
      fin: "2024-12-31",
      montantJournalier: 300,
      categorie: Categorie(id: 3, libelle: "Categorie 3"),
    ),
    Carte(
      id: 6,
      libelle: "Carte 6",
      image:
          "https://bloguelesnackbar.com/wp-content/uploads/2021/01/idee-cadeau-St-Valentin-Le-Snack-Bar.jpg",
      debut: "2024-01-01",
      fin: "2024-12-31",
      montantJournalier: 400,
      categorie: Categorie(id: 3, libelle: "Categorie 3"),
    ),
    Carte(
      id: 7,
      libelle: "Carte 7",
      image:
          "https://bloguelesnackbar.com/wp-content/uploads/2021/01/idee-cadeau-St-Valentin-Le-Snack-Bar.jpg",
      debut: "2024-01-01",
      fin: "2024-12-31",
      montantJournalier: 400,
      categorie: Categorie(id: 3, libelle: "Categorie 3"),
    ),
  ]; */

  void getAllCard() async {
    //print("getAllCard");
    var res = await CarteApiCtl.getCartes();
    if (res.status) {
      //print("cartes ${res.data!.map((e) => e.toJson())}");
      card = res.data!;
      update();
    }
  }

  void getAllCategorie() async {
    var res = await CategorieApiClt.getAllCategories();
    if (res.status) {
      print("categories ${res.data!.map((e) => e.toJson())}");
      categories = res.data!;
      update();
    }
  }

  // Méthode pour obtenir les catégories uniques
  List<Categorie> get uniqueCategories {
    final Map<int, Categorie> categoriesMap = {};
    for (var carte in card) {
      if (carte.categorie != null) {
        categoriesMap[carte.categorie!.id!] = carte.categorie!;
        print("carte.categorie!.id ${carte.categorie!.id}");
      }
    }
    return categoriesMap.values.toList();
  }

  /* 
  List<Carte> get cartes => card
      .where((e) => e.categorie?.id == loadedCartes.first.categorie?.id)
      .toList(); */

  @override
  void onReady() {
    super.onReady();

    getAllCard();
    getAllCategorie();
    controller = TabController(length: uniqueCategories.length, vsync: this);
  }
} */
class CardListePageVctl extends GetxController
    with GetSingleTickerProviderStateMixin {
  late TabController controller;
  List card = [];
  List categories = [];
  bool isLoading = true;

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
    //isLoading = false;
  }

  Future<void> getAllCard() async {
    var res = await CarteApiCtl.getCartes();
    if (res.status) {
      print("cartes ${res.data!.map((e) => e.toJson())}");
      card = res.data!;
      isLoading = false;
    }
  }

  /* Future<void> getAllCategorie() async {
    var res = await CategorieApiClt.getAllCategories();
    if (res.status) {
      categories = res.data!;
      isLoading = false;
    }
  } */

  // Méthode pour obtenir les catégories uniques
  List<Categorie> get uniqueCategories {
    final Map<int, Categorie> categoriesMap = {};
    for (var carte in card) {
      if (carte.categorie != null) {
        categoriesMap[carte.categorie!.id!] = carte.categorie!;
      }
    }
    return categoriesMap.values.toList();
  }

  @override
  void onReady() {
    super.onReady();

    getAllCard().then((_) {
      _initTabController();
      update();
    });
  }
}
