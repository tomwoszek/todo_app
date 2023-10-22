import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'categorie_detailview_viewmodel.dart';

class CategorieDetailviewView
    extends StackedView<CategorieDetailviewViewModel> {
  DocumentSnapshot data;

  CategorieDetailviewView({
    super.key,
    required this.data,
  });

  @override
  Widget builder(
    BuildContext context,
    CategorieDetailviewViewModel viewModel,
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
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(data["kategoire-name"],
                          style: const TextStyle(
                              fontSize: 27, fontWeight: FontWeight.bold)),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: Material(
        color: CupertinoColors.activeBlue,
        borderRadius: BorderRadius.circular(500),
        child: IconButton(
          icon: Icon(
            Icons.add,
          ),
          color: Colors.white,
          onPressed: () {},
        ),
      ),
    );
  }

  @override
  CategorieDetailviewViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      CategorieDetailviewViewModel();
}
