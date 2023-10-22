import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'add_to_do_viewmodel.dart';

class AddToDoView extends StackedView<AddToDoViewModel> {
  const AddToDoView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    AddToDoViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Container(
        padding: const EdgeInsets.only(left: 25.0, right: 25.0),
      ),
    );
  }

  @override
  AddToDoViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      AddToDoViewModel();
}
