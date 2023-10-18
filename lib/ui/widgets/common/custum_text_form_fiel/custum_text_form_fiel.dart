import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    super.key,
    this.isPassword = false,
    required this.hintInfo,
    required this.labelInfo,
    required this.controller,
    this.focusNode,
    this.autofillHints,
    this.textInputType,
    this.autoFocus = false,
    this.maxLength,
    this.maxLines = 1,
    this.onChangedCallback,
    this.prefix,
    this.contentPadding,
    this.makeBorder = true,
    this.inputAction = TextInputAction.done,
    this.onTapCallback,
  });
  final bool isPassword;
  final String hintInfo;
  final String labelInfo;
  final TextEditingController controller;
  final List<String>? autofillHints;
  final FocusNode? focusNode;
  final TextInputType? textInputType;
  final int? maxLength;
  final int maxLines;
  final bool autoFocus;
  final String? prefix;
  final EdgeInsetsGeometry? contentPadding;
  final bool makeBorder;
  final TextInputAction? inputAction;
  final void Function(String value)? onChangedCallback;
  final void Function()? onTapCallback;

  @override
  Widget build(BuildContext context) {
    return TextField(
      focusNode: focusNode,
      autofocus: autoFocus,
      cursorColor: Colors.blue,
      decoration: InputDecoration(
        hintText: hintInfo,
        labelText: labelInfo,
        counterText: '',
        contentPadding: contentPadding,
        prefixText: prefix,
        isDense: true,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide:
              makeBorder ? BorderSide(color: Colors.black) : BorderSide.none,
        ),
      ),
      textInputAction: inputAction,
      autofillHints: autofillHints,
      autocorrect: false,
      // autovalidateMode: AutovalidateMode.always,
      obscureText: isPassword,
      controller: controller,
      showCursor: true,
      keyboardType: textInputType,
      maxLength: maxLength,
      onChanged: onChangedCallback,
      maxLines: maxLines,
      onTap: onTapCallback ??
          () async {
            await Future.delayed(const Duration(milliseconds: 500));
            focusNode?.requestFocus();
          },
    );
  }
}
