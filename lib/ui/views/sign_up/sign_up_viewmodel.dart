import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:todo_app/app/app.dialogs.dart';
import 'package:todo_app/app/app.locator.dart';
import 'package:todo_app/app/app.router.dart';
import 'package:todo_app/services/authentication_service.dart';
import 'package:todo_app/services/utils/auth_mode_enum.dart';
import 'package:todo_app/ui/views/sign_up/sign_up_view.form.dart';

class SignUpViewModel extends FormViewModel {
  final _authenticationService = locator<AuthenticationService>();
  final _navigationService = locator<NavigationService>();
  final _dialogService = locator<DialogService>();

  String? errorText = "";
  String? apiOutput = "";

  Future<void> navigateToSignIn() async {
    _navigationService.replaceWithSignInView();
  }

  Future<void> signUp() async {
    if (emailValue == null) return;
    if (passwordValue == null) return;
    if (passwordValue!.isEmpty && emailValue!.isEmpty) return;

    apiOutput = await _authenticationService.authenticate(
        "$emailValue", "$passwordValue", AuthMode.register);

    if (apiOutput == null) {
      showError("$apiOutput");
      return;
    }
    ;
    if (apiOutput!.isNotEmpty) {
      await _navigationService.replaceWithHomeView();
    } else {
      showError("$apiOutput");
      rebuildUi();
    }
  }

  void showError(String problem) {
    _dialogService.showCustomDialog(
        variant: DialogType.errorWarnig,
        title: "Es gab leider ein Problem",
        description: problem);
  }
}

class ValidateForm {
  static String? validatePassword(String? value) {
    if (value == null) {
      return "Geben Sie bitte Ihr Password ein.";
    }
    return null;
  }

  static String? validateEmail(String? value) {
    if (value == null) {
      return "Geben Sie bitte Ihre EMail ein.";
    }
    return null;
  }
}
