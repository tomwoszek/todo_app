import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:todo_app/app/app.locator.dart';
import 'package:todo_app/services/storedatalocal_service.dart';

class TodoService {
  final _serverService = FirebaseFirestore.instance;
  final _localStorage = locator<StoredatalocalService>();

  Future<bool> createToDo(
    todoName,
    todoBeschreibung,
  ) async {
    try {
      await _serverService.collection("ToDos").add({
        "todo-name": todoName,
        "todo-description": todoBeschreibung,
        "todo-user": _localStorage.getAccessToken(),
        "todo-createdAt": DateTime.now(),
      });
      return true;
    } catch (e) {
      print('Hochladen fehlgeschlagen: $e');
      return false;
    }
  }

  Future<bool> updateToDo(
    toDoId,
    newToDoName,
    newToDoBeschreibung,
  ) async {
    try {
      await _serverService.collection("ToDos").doc(toDoId).update({
        "todo-name": newToDoName,
        "todo-description": newToDoBeschreibung,
        "todo-user": _localStorage.getAccessToken(),
      });
      return true;
    } catch (e) {
      print('Hochladen fehlgeschlagen: $e');
      return false;
    }
  }

  Future<bool> deleteToDo(toDoId) async {
    try {
      await _serverService.collection("ToDos").doc(toDoId).delete();
      return true;
    } catch (e) {
      print('Hochladen fehlgeschlagen: $e');
      return false;
    }
  }

  Stream<QuerySnapshot<Object>> getToDos() {
    Stream<QuerySnapshot<Object>> ToDos = _serverService
        .collection("ToDos")
        .where(
          "todo-user",
          isEqualTo: _localStorage.getAccessToken(),
        )
        .snapshots();
    return ToDos;
  }
}
