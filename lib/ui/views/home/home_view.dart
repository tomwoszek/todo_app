import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked/stacked_annotations.dart';
import 'package:todo_app/ui/common/ui_helpers.dart';
import 'package:todo_app/ui/views/home/home_view.form.dart';
import 'package:todo_app/ui/widgets/common/costum_button/costum_button.dart';
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
      body: SafeArea(
        child: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Text("Deine ToDo's",
                          style: TextStyle(
                              fontSize: 27, fontWeight: FontWeight.bold)),
                      IconButton(
                        icon: const Icon(Icons.account_circle),
                        color: CupertinoColors.activeBlue,
                        iconSize: 30,
                        onPressed: () {},
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 12.5,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      GestureDetector(
                        child: SizedBox(
                          width: MediaQuery.of(context).size.width * 0.425,
                          child: Material(
                              color: CupertinoColors.systemGrey6,
                              borderRadius: BorderRadius.circular(20),
                              child: Padding(
                                padding: const EdgeInsets.all(15.0),
                                child: Row(
                                  children: [
                                    Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Material(
                                          color: CupertinoColors.systemGrey5,
                                          borderRadius:
                                              BorderRadius.circular(20),
                                          child: const Padding(
                                            padding: EdgeInsets.all(4.0),
                                            child: Icon(
                                              Icons.more_horiz,
                                              color: CupertinoColors.systemGrey,
                                            ),
                                          ),
                                        ),
                                        const SizedBox(height: 20),
                                        const Text("Alle ToDos",
                                            style: TextStyle(
                                                color:
                                                    CupertinoColors.systemGrey,
                                                fontWeight: FontWeight.bold))
                                      ],
                                    )
                                  ],
                                ),
                              )),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          viewModel.navigaeToAddCategory();
                        },
                        child: SizedBox(
                          width: MediaQuery.of(context).size.width * 0.425,
                          child: Material(
                              color: CupertinoColors.systemGrey6,
                              borderRadius: BorderRadius.circular(20),
                              child: Padding(
                                padding: const EdgeInsets.all(15.0),
                                child: Row(
                                  children: [
                                    Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Material(
                                          color: CupertinoColors.activeBlue,
                                          borderRadius:
                                              BorderRadius.circular(20),
                                          child: const Padding(
                                            padding: EdgeInsets.all(4.0),
                                            child: Icon(
                                              Icons.add,
                                              color: CupertinoColors.white,
                                            ),
                                          ),
                                        ),
                                        const SizedBox(height: 20),
                                        const Text("Neue Kategorie",
                                            style: TextStyle(
                                                color:
                                                    CupertinoColors.systemGrey,
                                                fontWeight: FontWeight.bold))
                                      ],
                                    )
                                  ],
                                ),
                              )),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text("Deine Kategorien",
                          style: TextStyle(
                              fontSize: 22, fontWeight: FontWeight.bold)),
                    ],
                  ),
                  const SizedBox(
                    height: 12.5,
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.65,
                    width: MediaQuery.of(context).size.width,
                    child: StreamBuilder(
                        stream: viewModel.readCategories(),
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
                                    GestureDetector(
                                      onTap: () {
                                        viewModel
                                            .navigateToCategoieDetailview(data);
                                      },
                                      child: SizedBox(
                                        child: Material(
                                            color: CupertinoColors.systemGrey6,
                                            borderRadius:
                                                BorderRadius.circular(20),
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.all(15.0),
                                              child: Row(
                                                children: [
                                                  Material(
                                                    color: CupertinoColors
                                                        .activeOrange,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            20),
                                                    child: const Padding(
                                                      padding:
                                                          EdgeInsets.all(4.0),
                                                      child: Icon(
                                                        Icons.more_horiz,
                                                        color: CupertinoColors
                                                            .white,
                                                      ),
                                                    ),
                                                  ),
                                                  const SizedBox(width: 10),
                                                  Text(data["kategoire-name"],
                                                      style: TextStyle(
                                                          color: CupertinoColors
                                                              .systemGrey,
                                                          fontWeight:
                                                              FontWeight.bold))
                                                ],
                                              ),
                                            )),
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
