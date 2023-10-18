import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked/stacked_annotations.dart';
import 'package:todo_app/services/storedatalocal_service.dart';
import 'package:todo_app/ui/common/ui_helpers.dart';
import 'package:todo_app/ui/views/home/home_view.form.dart';
import 'package:todo_app/ui/widgets/common/costum_button/costum_button.dart';
import 'package:todo_app/ui/widgets/common/custum_text_form_fiel/custum_text_form_fiel.dart';

import 'home_viewmodel.dart';

@FormView(fields: [
  FormTextField(
    name: "name",
  ),
  FormTextField(
    name: "beschreibungck",
    initialValue: "",
  )
])
class HomeView extends StackedView<HomeViewModel> with $HomeView {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    HomeViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text("ToDo App",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
        actions: [
          IconButton(
            onPressed: () {
              viewModel.logOut();
            },
            icon: const Icon(Icons.logout),
            color: Colors.red,
          )
        ],
      ),
      body: SafeArea(
        child: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                   "${viewModel.getAccesToken()}"
                   
                  ),
                  Material(
                    color: CupertinoColors.systemGrey6,
                    borderRadius: BorderRadius.circular(20),
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "Erstelle eine ToDo",
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 16,
                                fontWeight: FontWeight.bold),
                          ),
                          verticalSpaceSmall,
                          CustomTextFormField(
                              hintInfo: "Name",
                              labelInfo: "Name",
                              controller: nameController),
                          verticalSpaceSmall,
                          CustomTextFormField(
                            hintInfo: "Beschreibung",
                            labelInfo: "Beschreibung",
                            controller: beschreibungckController,
                          ),
                          verticalSpaceSmall,
                          CustomButton(
                            onPressedCallback: () async {
                              await viewModel.createToDo();
                              nameController.clear();
                              beschreibungckController.clear();
                            },
                            label: const Text(
                              "Hochladen",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 15),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.65,
                    width: MediaQuery.of(context).size.width,
                    child: StreamBuilder(
                        stream: viewModel.readToDos(),
                        builder: (BuildContext context,
                            AsyncSnapshot<QuerySnapshot> snapshot) {
                          if (!snapshot.hasData) {
                            return const Center(
                              child: CircularProgressIndicator(),
                            );
                          }
                          return ListView(
                              scrollDirection: Axis.vertical,
                              children: snapshot.data!.docs.map((data) {
                                return Column(
                                  children: [
                                    verticalSpaceSmall,
                                    Material(
                                      color: CupertinoColors.systemGrey6,
                                      borderRadius: BorderRadius.circular(20),
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: SizedBox(
                                          // height: 65,
                                          width:
                                              MediaQuery.of(context).size.width,
                                          child: ListTile(
                                            leading: const Icon(
                                                Icons.today_outlined),
                                            title: Text(data["todo-name"]),
                                            subtitle:
                                                Text(data["todo-description"]),
                                            trailing: Row(
                                              children: [
                                                IconButton(
                                                  icon: const Icon(Icons.delete),
                                                  color: Colors.red,
                                                  onPressed: () {
                                                    viewModel.deleteToDo(data.id);
                                                  },
                                                ),
                                                horizontalSpaceSmall,
                                                IconButton(
                                                  icon: const Icon(CupertinoIcons.chevron_right),
                                                  color: Colors.red,
                                                  onPressed: () {
                                                    viewModel.showBottomSheet(data["todo-name"], data["todo-description"],  data["todo-createdAt"]);
                                                  },
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                );
                              }).toList());
                        }),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void onViewModelReady(HomeViewModel viewModel) {
    syncFormWithViewModel(viewModel);
  }

  @override
  HomeViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      HomeViewModel();

  @override
  void onDispose(HomeViewModel viewModel) {
    super.onDispose(viewModel);
    disposeForm();
  }
}
