import 'package:stacked/stacked.dart';
import 'package:todo_app/app/app.locator.dart';
import 'package:todo_app/app/app.router.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:todo_app/services/storedatalocal_service.dart';

class StartupViewModel extends BaseViewModel {
  final _navigationService = locator<NavigationService>();
  final _localStorage = locator<StoredatalocalService>();

  // Place anything here that needs to happen before we get into the application
  Future runStartupLogic() async {
    if (_localStorage.getAccessToken() == "") {
      _navigationService.replaceWithSignUpView();
    } else {
      _navigationService.replaceWithHomeView();
    }
  }
}
