import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:todo_app/app/app.dialogs.dart';
import 'package:todo_app/app/app.locator.dart';
import 'package:todo_app/app/app.router.dart';
import 'package:todo_app/services/authentication_service.dart';
import 'package:todo_app/services/utils/auth_mode_enum.dart';
import 'package:todo_app/ui/views/sign_in/sign_in_view.form.dart';

class SignInViewModel extends FormViewModel {
  final _authenticationService = locator<AuthenticationService>();
  final _navigationService = locator<NavigationService>();
  final _dialogService = locator<DialogService>();

  Future<void> signIn() async {
    if (emailValue == null) return;
    if (passwordValue == null) return;

    final accessToken = await _authenticationService.authenticate(
        emailValue!, passwordValue!, AuthMode.login);

    print(accessToken);
    if (accessToken == null) {
      showError("$accessToken");
      return;
    };
    if (accessToken.isNotEmpty) {
      await _navigationService.replaceWithHomeView();
    } else {
      showError("$accessToken");
    }
  }

  Future<void> navigateToSignUp() async {
    _navigationService.replaceWithSignUpView();
  }

  void showError(String problem) {
    _dialogService.showCustomDialog(
        variant: DialogType.errorWarnig,
        title: "Es gab leider ein Problem",
        description: problem);
  }
}

class ValidateForm {
  Future<bool> validateEmail(email) async {
    if (email!.isNotEmpty || email != null) {
      return true;
    } else {
      return false;
    }
  }

  Future<bool> validatePassword(password) async {
    if (password!.isNotEmpty || password != null) {
      return true;
    } else {
      return false;
    }
  }
}
