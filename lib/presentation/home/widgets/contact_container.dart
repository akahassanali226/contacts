// ignore_for_file: must_be_immutable

import 'package:contacts/core/utils/asset_manager.dart';
import 'package:contacts/core/utils/color_manager.dart';
import 'package:contacts/presentation/home/data/contact_model.dart';
import 'package:contacts/presentation/home/widgets/custom_elevated_button.dart';
import 'package:flutter/material.dart';

class ContactContainer extends StatelessWidget {
  ContactModel contactModel;
  VoidCallback onContactDeleted;

  ContactContainer({
    super.key,
    required this.contactModel,
    required this.onContactDeleted,
  });

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: ColorManager.goldColor,
      ),
      child: Column(
        children: [
          Expanded(
            child: Stack(
              alignment: AlignmentGeometry.bottomLeft,
              children: [
                contactModel.image != null
                    ? ClipRRect(
                        borderRadius: BorderRadiusGeometry.only(
                          topLeft: Radius.circular(16),
                          topRight: Radius.circular(16),
                        ),
                        child: Image.file(
                          contactModel.image!.absolute,
                          width: double.infinity,
                          height: double.infinity,
                          fit: BoxFit.cover,
                        ),
                      )
                    : Image.asset(
                        AssetManager.contactIconUrl,
                        color: ColorManager.darkBlueColor,
                        width: double.infinity,
                        height: double.infinity,
                      ),
                Container(
                  margin: EdgeInsets.all(8),
                  padding: EdgeInsets.all(4),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: ColorManager.whiteColor,
                  ),
                  child: Text(
                    contactModel.name,
                    style: TextStyle(color: ColorManager.darkBlueColor),
                  ),
                ),
              ],
            ),
          ),

          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: height * 0.01),
                  Row(
                    children: [
                      Icon(Icons.email, color: ColorManager.darkBlueColor),
                      SizedBox(width: 8),
                      Expanded(child: Text(contactModel.email, maxLines: 2)),
                    ],
                  ),
                  SizedBox(height: height * 0.01),

                  Row(
                    children: [
                      Icon(
                        Icons.phone_in_talk,
                        color: ColorManager.darkBlueColor,
                      ),
                      SizedBox(width: 8),

                      Text(contactModel.phone),
                    ],
                  ),
                  Spacer(),
                  CustomElevatedButton(
                    onPressed: onContactDeleted,
                    buttonColor: ColorManager.redColor,
                    verticalPadding: 8,
                    textColor: ColorManager.goldColor,
                    text: "Delete",
                    isIcon: true,
                  ),
                  SizedBox(height: height * 0.01),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
