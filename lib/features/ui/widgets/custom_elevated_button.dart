import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomElevatedButton extends StatelessWidget {
  final String? imageIconName ;
  final String? text;
  final TextStyle? textStyle ;
  final Color? bgColor;
  final VoidCallback? onPressed;
  final bool? hasIcon;
  final double?  radius;
  const CustomElevatedButton({
    super.key,
    required this.text,
    required this.textStyle,
    required this.onPressed,
    this.imageIconName,
    this.bgColor,
    this.radius,
    this.hasIcon = false,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: bgColor ?? Theme.of(context).canvasColor,
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(radius ?? 15),
        ),
      ),
      onPressed: onPressed,
      child: hasIcon == true
          ? Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ImageIcon(
            AssetImage(imageIconName!),
            color: Theme.of(context).canvasColor,
            size: 22,
          ),
          SizedBox(width: 10.w),
          Text(text!, style: Theme.of(context).textTheme.bodyLarge),
        ],)
          : Text(text!, style: Theme.of(context).textTheme.bodyLarge),
    );
  }
}
