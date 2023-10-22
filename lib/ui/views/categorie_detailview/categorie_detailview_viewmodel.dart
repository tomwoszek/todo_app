import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:todo_app/app/app.locator.dart';
import 'package:todo_app/services/categorie_service_service.dart';
import 'package:todo_app/services/storedatalocal_service.dart';

class CategorieDetailviewViewModel extends BaseViewModel {
  final _navigationService = locator<NavigationService>();
  final _categorieService = locator<CategorieServiceService>();
  final _storeDateLocalService = locator<StoredatalocalService>();

  Future<void> back() async {
    _navigationService.back();
  }
}
