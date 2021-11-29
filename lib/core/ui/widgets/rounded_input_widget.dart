import 'text_field_container_widget.dart';
import '../themes/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class RoundedInputWidget extends StatelessWidget {
  final FormFieldValidator<String>? validator;
  final TextEditingController? controller;

  final bool? obscureText;
  final void Function()? onPressed;
  final String? hintText;
  final IconData? iconData;
  final FocusNode? focusNode;
  final List<TextInputFormatter>? inputFormatters;

  final TextInputType? keyboardType;
  final void Function(String?)? onSaved;
  const RoundedInputWidget(
      {Key? key,
      this.validator,
      this.inputFormatters,
      this.controller,
      this.obscureText = false,
      this.hintText,
      this.focusNode,
      this.iconData,
      this.onSaved,
      this.keyboardType,
      this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFieldContainerWidget(
      child: TextFormField(
        onSaved: onSaved,
        obscureText: obscureText!,
        inputFormatters: inputFormatters,
        autocorrect: false,
        cursorColor: Theme.of(context).primaryColor,
        validator: validator,
        keyboardType: keyboardType,
        focusNode: focusNode,
        controller: controller,
        decoration: InputDecoration(
          isDense: true,
          filled: true,
          hintText: hintText,
          prefixIcon:
              iconData != null ? Icon(iconData, color: Colors.grey) : null,
          contentPadding: EdgeInsets.symmetric(
            horizontal: 10,
            vertical: 10,
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
            borderSide: BorderSide(
              color: AppColors.grey,
              width: 2,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
            borderSide: BorderSide(
              color: AppColors.blue,
              width: 2,
            ),
          ),
        ),
      ),
    );
  }
}
