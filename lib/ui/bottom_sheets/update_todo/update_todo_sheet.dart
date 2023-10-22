import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:todo_app/ui/common/app_colors.dart';
import 'package:todo_app/ui/common/ui_helpers.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:todo_app/ui/widgets/common/custum_text_form_fiel/custum_text_form_fiel.dart';

import 'update_todo_sheet_model.dart';

class UpdateTodoSheet extends StackedView<UpdateTodoSheetModel> {
  final Function(SheetResponse response)? completer;
  final SheetRequest request;
  const UpdateTodoSheet({
    Key? key,
    required this.completer,
    required this.request,
  }) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    UpdateTodoSheetModel viewModel,
    Widget? child,
  ) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(10),
          topRight: Radius.circular(10),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              request.title ?? 'ToDo',
              style: const TextStyle(fontSize: 25, fontWeight: FontWeight.w900),
            ),
            Material(
                color: CupertinoColors.systemGrey6,
                borderRadius: BorderRadius.circular(20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Icon(CupertinoIcons.ellipsis),
                    SizedBox(
                      width: 15,
                    ),
                    Text(
                      request.description!,
                      style: TextStyle(height: 17),
                    )
                  ],
                )),
            Material(
                color: CupertinoColors.systemGrey6,
                borderRadius: BorderRadius.circular(20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Icon(CupertinoIcons.calendar),
                    SizedBox(
                      width: 15,
                    ),
                    Text(
                      "${request.customData!}",
                      style: TextStyle(height: 17),
                    )
                  ],
                ))
          ],
        ),
      ),
    );
  }

  @override
  UpdateTodoSheetModel viewModelBuilder(BuildContext context) =>
      UpdateTodoSheetModel();
}
