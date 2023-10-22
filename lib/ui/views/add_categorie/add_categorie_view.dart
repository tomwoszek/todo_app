import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked/stacked_annotations.dart';
import 'package:todo_app/ui/views/add_categorie/add_categorie_view.form.dart';
import 'package:todo_app/ui/widgets/common/costum_button/costum_button.dart';
import 'package:todo_app/ui/widgets/common/custum_text_form_fiel/custum_text_form_fiel.dart';

import 'add_categorie_viewmodel.dart';

@FormView(fields: [
  FormTextField(
    name: "name",
  ),
  FormTextField(
    name: "beschreibungck",
    initialValue: "",
  )
])
class AddCategorieView extends StackedView<AddCategorieViewModel>
    with $AddCategorieView {
  const AddCategorieView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    AddCategorieViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          color: CupertinoColors.activeBlue,
          onPressed: () {
            viewModel.back();
          },
        ),
      ),
      body: SafeArea(
        child: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.only(
                right: 20,
                left: 20,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text("Neue Kategorie",
                          style: TextStyle(
                              fontSize: 27, fontWeight: FontWeight.bold)),
                    ],
                  ),
                  SizedBox(height: 25),
                  CustomTextFormField(
                      hintInfo: "Kategoriename",
                      labelInfo: "Kategoriename",
                      controller: nameController),
                  SizedBox(height: 25),
                  CustomButton(
                    onPressedCallback: () async {
                      await viewModel.createCategorie(nameController.text);
                    },
                    label: Text("Hinzufügen"),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void onViewModelReady(AddCategorieViewModel viewModel) {
    syncFormWithViewModel(viewModel);
  }

  @override
  AddCategorieViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      AddCategorieViewModel();

  @override
  void onDispose(AddCategorieViewModel viewModel) {
    super.onDispose(viewModel);
    disposeForm();
  }
}
