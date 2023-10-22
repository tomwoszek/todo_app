import 'package:flutter/cupertino.dart';

class CustomButton extends StatelessWidget {
  const CustomButton(
      {super.key,
      this.label,
      required this.onPressedCallback,
      this.invert = false,
      this.radius = 25,
      this.width = double.infinity,
      this.height = 50,
      this.padding = const EdgeInsets.symmetric(horizontal: 8, vertical: 10),
      this.fontSize});
  final dynamic label;
  final bool invert;
  final double? fontSize;
  final double radius;
  final double width;
  final double? height;
  final EdgeInsetsGeometry padding;
  final void Function() onPressedCallback;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: CupertinoButton(
          color: CupertinoColors.activeBlue,
          borderRadius: BorderRadius.circular(20),
          onPressed: onPressedCallback,
          child: label),
    );
  }
}
