// ignore_for_file: must_be_immutable

import 'dart:developer';
import 'dart:io';
import 'dart:async';

import 'package:contacts/core/utils/color_manager.dart';
import 'package:contacts/presentation/home/data/app_validation.dart';
import 'package:contacts/presentation/home/data/contact_model.dart';
import 'package:contacts/presentation/home/widgets/custom_elevated_button.dart';
import 'package:contacts/presentation/home/widgets/custom_text_form_field.dart';
import 'package:contacts/presentation/home/widgets/custom_user_image.dart';
import 'package:contacts/presentation/home/widgets/custom_user_info.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class CustomBottomSheet extends StatefulWidget {
  TextEditingController userNameController;
  TextEditingController emailController;
  TextEditingController phoneController;
  GlobalKey<FormState> formKey;
  List<ContactModel> contactModelist;

  CustomBottomSheet({
    super.key,
    required this.userNameController,
    required this.emailController,
    required this.phoneController,
    required this.formKey,
    required this.contactModelist,
  });

  @override
  State<CustomBottomSheet> createState() => _CustomBottomSheetState();
}

class _CustomBottomSheetState extends State<CustomBottomSheet> {
  @override
  void initState() {
    widget.userNameController.addListener(updateState);
    widget.emailController.addListener(updateState);
    widget.phoneController.addListener(updateState);
    super.initState();
  }

  void updateState() {
    widget.userNameController.text;
    widget.emailController.text;
    widget.phoneController.text;
    if (mounted) {
      super.setState(() {});
    }
  }

  File? image;
  final picker = ImagePicker();

  Future getImageGallery() async {
    final pickedImage = await picker.pickImage(
      source: ImageSource.gallery,
      imageQuality: 80,
    );
    setState(() {
      if (pickedImage != null) {
        image = File(pickedImage.path);
      } else {
        log("No Image Picked");
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;

    return Padding(
      padding: EdgeInsets.only(
        bottom: MediaQuery.of(context).viewInsets.bottom,
      ),
      child: Container(
        padding: EdgeInsets.all(16),
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(40),
            topRight: Radius.circular(40),
          ),
          color: ColorManager.darkBlueColor,
        ),
        height: height * 0.65,
        child: Column(
          children: [
            Expanded(
              flex: 3,
              child: Row(
                children: [
                  CustomUserImage(
                    onPressed: () {
                      getImageGallery();
                    },
                    image: image,
                  ),
                  SizedBox(width: 16),
                  CustomUserInfo(
                    userNameText: widget.userNameController.text,
                    emailText: widget.emailController.text,
                    passwordText: widget.phoneController.text,
                  ),
                ],
              ),
            ),
            SizedBox(height: height * 0.02),
            Expanded(
              flex: 5,
              child: Form(
                key: widget.formKey,
                child: Column(
                  children: [
                    CustomTextFormField(
                      textInputAction: TextInputAction.next,
                      textInputType: TextInputType.name,
                      validator: AppValidation.userNameValidation,
                      hintText: "Enter Your UserName",
                      controller: widget.userNameController,
                    ),
                    SizedBox(height: height * 0.01),
                    CustomTextFormField(
                      textInputAction: TextInputAction.next,
                      textInputType: TextInputType.emailAddress,
                      validator: AppValidation.emailValidation,
                      hintText: "Enter Your Email",
                      controller: widget.emailController,
                    ),
                    SizedBox(height: height * 0.01),
                    CustomTextFormField(
                      textInputAction: TextInputAction.done,
                      textInputType: TextInputType.phone,
                      validator: AppValidation.phoneValidation,
                      hintText: "Enter Your Phone Number",
                      controller: widget.phoneController,
                    ),
                  ],
                ),
              ),
            ),
            CustomElevatedButton(
              onPressed: () {
                if (widget.formKey.currentState!.validate()) {
                  ContactModel contactModel = ContactModel(
                    name: widget.userNameController.text,
                    email: widget.emailController.text,
                    phone: widget.phoneController.text,
                    image: image,
                  );
                  widget.contactModelist.add(contactModel);

                  Navigator.pop(context, contactModel);
                  widget.userNameController.text = "";
                  widget.emailController.text = "";
                  widget.phoneController.text = "";
                }
              },
              buttonColor: ColorManager.goldColor,
              verticalPadding: height * 0.02,
              textColor: ColorManager.darkBlueColor,
              text: "Add Contact",
            ),
          ],
        ),
      ),
    );
  }
}
