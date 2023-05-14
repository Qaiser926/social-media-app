import 'package:flutter/material.dart';
import 'package:tech_media/res/color.dart';

class InputTextFormField extends StatelessWidget {
  InputTextFormField({
    this.autoFocus = false,
    required this.controller,
    this.enable = true,
    required this.onFieldSubmittedValue,
    required this.onValidator,
    required this.focusNode,
    required this.hint,
    required this.keyboardType,
    required this.obsecureText,
    super.key,
  });

  final String hint;
  final FocusNode focusNode;
  final FormFieldSetter onFieldSubmittedValue;
  final FormFieldValidator onValidator;
  final TextEditingController controller;
  final bool obsecureText;
  final bool enable, autoFocus;
  final TextInputType keyboardType;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: TextFormField(
        controller: controller,
        focusNode: focusNode,
        keyboardType: keyboardType,
        obscureText: obsecureText,
        validator: onValidator,
        onFieldSubmitted: onFieldSubmittedValue,
        style: Theme.of(context).textTheme.bodyText2!.copyWith(fontSize: 17),
        decoration: InputDecoration(
          hintStyle: Theme.of(context).textTheme.bodyText2,
          contentPadding:const EdgeInsets.all(8),
          border:const OutlineInputBorder(
              borderSide: BorderSide(
                color: AppColors.textFieldDefaultFocus,
              ),
              borderRadius: BorderRadius.all(Radius.circular(8))),
          hintText: hint,
        focusedBorder:const OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(8)),
        borderSide: BorderSide(
          color: AppColors.secondaryColor
        )
        ),
         errorBorder:const OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(8)),
        borderSide: BorderSide(
          color: AppColors.alertColor
        ),
        ),
         enabledBorder:const OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(8)),
        borderSide: BorderSide(
          color: AppColors.textFieldDefaultFocus
        )
        )
        ),
        
      ),
    );
  }
}
