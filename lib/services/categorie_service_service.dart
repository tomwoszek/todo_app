import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:todo_app/app/app.locator.dart';
import 'package:todo_app/app/app.router.dart';
import 'package:todo_app/services/storedatalocal_service.dart';

class CategorieServiceService {
  final _serverService = FirebaseFirestore.instance;
  final _navigationService = locator<NavigationService>();
  final _storeDataLocalService = locator<StoredatalocalService>();

  Future<void> creatCategorie(String Nutzer, String kategorieName) async {
    try {
      await _serverService
          .collection("Nutzer")
          .doc(Nutzer)
          .collection("Nutzer-Kategorien")
          .add({
        "kategoire-name": kategorieName,
      });
      await _navigationService.replaceWithHomeView();
    } catch (e) {
      SnackBar(
        content: Text("Hochladen fehlgeschlagen: $e"),
      );
      print('Hochladen fehlgeschlagen: $e');
    }
  }

  Stream<QuerySnapshot<Object>> readCategories() {
    Stream<QuerySnapshot<Object>> ToDos = _serverService
        .collection("Nutzer")
        .doc(_storeDataLocalService.getAccessToken())
        .collection("Nutzer-Kategorien")
        .snapshots();
    return ToDos;
  }
}
