import 'package:e_commerce_app/core/utils/app_colors.dart';
import 'package:flutter/material.dart';

typedef OnValidator = String? Function(String?)?;
class CustomTextField extends StatefulWidget {
  final bool hasSuffix;
  final bool hasPrefix;
  final bool obsecureText;
  final bool isNumber ;
  final String hintText;
  final OnValidator validator;
  final TextEditingController? controller;
  const CustomTextField({
    super.key,
    required this.hintText ,
    required this.controller,
    required  this.validator,
    this.hasSuffix = false,
    this.hasPrefix = false,
    this.obsecureText = false,
    this.isNumber = false,
  });

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  late bool isObsecured;
  @override
  void initState() {
    super.initState();
    isObsecured = widget.obsecureText;
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType:widget.isNumber? TextInputType.numberWithOptions():null,
      style: Theme.of(context).textTheme.bodyMedium,
      cursorColor: Theme.of(context).canvasColor,
      controller: widget.controller,
      validator: widget.validator,
      obscureText: isObsecured,
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.transparent,
        enabledBorder: buildOutlineInputBorder(Theme.of(context).canvasColor),
        errorBorder: buildOutlineInputBorder(AppColors.red),
        focusedBorder: buildOutlineInputBorder(Theme.of(context).canvasColor),
        focusedErrorBorder: buildOutlineInputBorder(AppColors.red),
        hintText: widget.hintText,
        hintStyle: Theme.of(context).textTheme.bodyMedium,
        prefixIcon: widget.hasPrefix ?Icon(Icons.search_sharp,color:Theme.of(context).canvasColor,size:26,):null,
        suffixIcon: widget.hasSuffix
            ? InkWell(
                onTap: () {
                  setState(() {
                    isObsecured = !isObsecured;
                  });
                },
                child: isObsecured
                    ? Icon(Icons.visibility_off, color: Theme.of(context).canvasColor, size: 26)
                    : Icon(Icons.visibility, color: Theme.of(context).canvasColor, size: 26),
              )
            : null,
      ),
    );
  }

  OutlineInputBorder buildOutlineInputBorder(Color borderColor) {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(16),
      borderSide: BorderSide(width: 1, color: borderColor),
    );
  }
}
