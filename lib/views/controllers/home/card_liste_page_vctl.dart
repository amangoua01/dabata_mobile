import 'package:dabata_mobile/models/carte.dart';
import 'package:dabata_mobile/models/categorie.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CardListePageVctl extends GetxController
    with GetSingleTickerProviderStateMixin {
  late final TabController controller;

  final List<Carte> loadedCartes = [
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
  ];

  // Méthode pour obtenir les catégories uniques
  List<Categorie> get uniqueCategories {
    final Map<int, Categorie> categoriesMap = {};
    for (var carte in loadedCartes) {
      if (carte.categorie != null) {
        categoriesMap[carte.categorie!.id!] = carte.categorie!;
      }
    }
    return categoriesMap.values.toList();
  }

  List<Carte> get cartes => loadedCartes
      .where((e) => e.categorie?.id == loadedCartes.first.categorie?.id)
      .toList();

  @override
  void onInit() {
    controller = TabController(length: uniqueCategories.length, vsync: this);
    super.onInit();
  }
}
