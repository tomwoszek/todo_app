import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked/stacked_annotations.dart';
import 'package:todo_app/ui/common/ui_helpers.dart';
import 'package:todo_app/ui/views/sign_up/sign_up_view.form.dart';
import 'package:todo_app/ui/widgets/common/costum_button/costum_button.dart';
import 'package:todo_app/ui/widgets/common/custum_text_form_fiel/custum_text_form_fiel.dart';
import 'sign_up_viewmodel.dart';

@FormView(fields: [
  FormTextField(name: "email", validator: ValidateForm.validateEmail),
  FormTextField(
      name: "password",
      initialValue: "",
      validator: ValidateForm.validatePassword)
])
class SignUpView extends StackedView<SignUpViewModel> with $SignUpView {
  const SignUpView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    SignUpViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: viewModel.isBusy
            ? const CupertinoActivityIndicator(radius: 20)
            : Center(
                child: Padding(
                  padding: const EdgeInsets.all(25.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Text("Wilkommen bei MyTaag",
                          style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                          )),
                      verticalSpaceMedium,
                      CustomTextFormField(
                        controller: emailController,
                        hintInfo: 'Karan Singh',
                        labelInfo: 'E-Mail',
                        isPassword: false,
                        makeBorder: true,
                      ),
                      verticalSpaceSmall,
                      CustomTextFormField(
                        controller: passwordController,
                        hintInfo: 'Karan Singh',
                        labelInfo: 'Password',
                        isPassword: true,
                        makeBorder: true,
                      ),
                      verticalSpaceMedium,
                      CustomButton(
                        onPressedCallback: () {
                          viewModel.signUp();
                        },
                        label: const Text("Registrieren"),
                      ),
                      Text("${viewModel.errorText}"),
                      verticalSpaceMedium,
                      GestureDetector(
                        onTap: () {
                          viewModel.navigateToSignIn();
                        },
                        child: const Text("Bereits ein Account? Einloggen",
                            style: TextStyle(color: Colors.blue, fontSize: 15)),
                      )
                    ],
                  ),
                ),
              ));
  }

  @override
  void onViewModelReady(SignUpViewModel viewModel) {
    syncFormWithViewModel(viewModel);
  }

  @override
  SignUpViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      SignUpViewModel();

  @override
  void onDispose(SignUpViewModel viewModel) {
    super.onDispose(viewModel);
    disposeForm();
  }
}
