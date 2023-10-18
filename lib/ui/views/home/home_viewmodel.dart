import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:todo_app/app/app.bottomsheets.dart';
import 'package:todo_app/app/app.locator.dart';
import 'package:todo_app/app/app.router.dart';
import 'package:todo_app/services/storedatalocal_service.dart';
import 'package:todo_app/services/todo_service.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:todo_app/ui/views/home/home_view.form.dart';

class HomeViewModel extends FormViewModel {
  final _localStorage = locator<StoredatalocalService>();
  final _toDoservice = locator<TodoService>();
  final _navigationService = locator<NavigationService>();
  final _bottomSheetService = locator<BottomSheetService>();

  Future<void> createToDo() async {
    if (nameValue == null) return;
    if (nameValue!.isNotEmpty) {
      await _toDoservice.createToDo(nameValue, beschreibungckValue);
      rebuildUi();
    }
  }

  Stream<QuerySnapshot<Object>> readToDos() {
    return _toDoservice.getToDos();
  }

  Future<void> deleteToDo(todoId) async {
    if (await _toDoservice.deleteToDo(todoId)) {
      rebuildUi();
    }
  }

  Future<void> logOut() async {
    await _localStorage.setToken("");
    await FirebaseAuth.instance.signOut();
    await _navigationService.replaceWithSignInView();
  }

 void showBottomSheet(String title, String description, DateTime createdAt) {
    _bottomSheetService.showCustomSheet(
      variant: BottomSheetType.notice,
      title: title,
      description: description,
      customData: createdAt
    );
  }

 String? getAccesToken() {
  final AccesToken = _localStorage.getAccessToken();
  return AccesToken;
 }

}
