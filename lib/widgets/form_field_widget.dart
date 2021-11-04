import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:workour/constants/app_colors.dart';
import 'package:workour/constants/app_styles.dart';

class InputField extends StatelessWidget {
  final String inputAction;
  final String hintText;
  final String labelText;
  final IconData icon;
  // FormFieldValidator<String> validator;
  final TextEditingController textEditingController;
  final TextInputType textInputType;
  final bool isIcon;

  InputField(
      this.inputAction,
      this.hintText,
      this.labelText,
      this.icon,
      // this.validator,
      this.textEditingController,
      this.textInputType,
      this.isIcon);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      // focusNode: currentFocusNode,
      controller: textEditingController,
      textInputAction: inputAction == "next" ? TextInputAction.next : TextInputAction.done,
      autofocus: false,
      keyboardType: textInputType,
      style: AppStyles.kLabelTextStyle,
      decoration: InputDecoration(
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(10.0)),
            borderSide: BorderSide(
              width: 1.0,
              color: AppColors.backgroundGrey,
            ),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(10.0)),
            borderSide: BorderSide(
              width: 1.0,
              color: AppColors.backgroundGrey,
            ),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(10.0)),
            borderSide: BorderSide(
              width: 1.0,
              color: AppColors.kPrimaryTwo,
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(10.0)),
            borderSide: BorderSide(
              width: 1.0,
              color: AppColors.kPrimaryOne,
            ),
          ),
          disabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(10.0)),
            borderSide: BorderSide(
              width: 1.0,
              color: AppColors.kPrimaryTwo,
            ),
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(10.0)),
            borderSide: BorderSide(
              width: 1.0,
              color: AppColors.kPrimaryTwo,
            ),
          ),
          labelText: labelText,
          labelStyle: AppStyles.kLabelTextStyle,
          alignLabelWithHint: true,
          hintText: hintText,
          hintStyle: AppStyles.khintStyle,
          floatingLabelBehavior: FloatingLabelBehavior.always,
          suffixIcon: isIcon ? Icon(
            icon,
            size: 24.0,
            color: AppColors.backgroundGrey,
          ) : null
      ),
      // validator: validator,
      onFieldSubmitted: (_) {
        // fieldFocusChange(context, currentFocusNode, nextFocusNode);
      },
    );
  }
}

class GreyInputField extends StatelessWidget {

  final String hintText;
  final TextEditingController textEditingController;
  final TextInputAction inputAction;
  final TextInputType textInputType;

  GreyInputField({
      required this.hintText,
      required this.textEditingController,
      required this.inputAction,
      required this.textInputType});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: textEditingController,
      textInputAction: inputAction,
      autofocus: false,
      keyboardType: textInputType,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: AppStyles.hintStyle,
      ),
      onFieldSubmitted: (_) {},
    );
  }
}

class BackgroundInputField extends StatelessWidget {

  final TextEditingController textEditingController;

  BackgroundInputField({required this.textEditingController});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: textEditingController,
      textInputAction: TextInputAction.done,
      autofocus: false,
      keyboardType: TextInputType.phone,
      decoration: InputDecoration(
        fillColor: AppColors.backgroundGrey,
        filled: true,
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(10.0)),
          borderSide: BorderSide(
            color: AppColors.backgroundGrey,
          ),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(10.0)),
          borderSide: BorderSide(
            color: AppColors.backgroundGrey,
          ),
        ),
        hintText: "Enter your account number",
        hintStyle: AppStyles.khintStyle,
      ),
      onFieldSubmitted: (_) {},
    );
  }
}

class PostReviewInputField extends StatelessWidget {

  final TextEditingController textEditingController;

  PostReviewInputField({required this.textEditingController});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: textEditingController,
      textInputAction: TextInputAction.done,
      autofocus: false,
      keyboardType: TextInputType.text,
      decoration: InputDecoration(
        fillColor: Colors.white,
        filled: true,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(40.0),
          borderSide: BorderSide(
            width: 0,
            style: BorderStyle.none,
          ),
        ),
        hintText: "Post your review...",
        //hintStyle: AppStyles.khintStyle,
      ),
      onFieldSubmitted: (_) {},
    );
  }
}

class MessageInputField extends StatelessWidget {

  final TextEditingController textEditingController;

  MessageInputField({required this.textEditingController});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: textEditingController,
      textInputAction: TextInputAction.done,
      autofocus: false,
      keyboardType: TextInputType.text,
      decoration: InputDecoration(
        fillColor: AppColors.black[400],
        filled: true,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20.0),
          borderSide: BorderSide(
            width: 0,
            style: BorderStyle.none,
          ),
        ),
        hintText: "Text message here...",
        hintStyle: AppStyles.hintStyle,
      ),
      onFieldSubmitted: (_) {},
    );
  }
}

void fieldFocusChange(BuildContext context, FocusNode currentFocus, FocusNode nextFocus) {
  currentFocus.unfocus();
  FocusScope.of(context).requestFocus(nextFocus);
}