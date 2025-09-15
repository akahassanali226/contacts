// ignore_for_file: must_be_immutable

import 'dart:io';
import 'package:contacts/core/utils/asset_manager.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class CustomUserImage extends StatelessWidget {
  void Function() onPressed;
  File? image;

  CustomUserImage({super.key, required this.onPressed, required this.image});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: InkWell(
        onTap: onPressed,
        child: Container(
          height: double.infinity,
          decoration: BoxDecoration(
            color: Colors.transparent,
            borderRadius: BorderRadiusGeometry.circular(28),
          ),
          child: image != null
              ? ClipRRect(
                  borderRadius: BorderRadiusGeometry.circular(28),
                  child: Image.file(
                    image!.absolute,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                )
              : Lottie.asset(
                  AssetManager.imagePickerUrl,
                  height: double.infinity,
                ),
        ),
      ),
    );
  }
}


//  Expanded(
//       child: ElevatedButton(
//         onPressed: onPressed,
//         style: ElevatedButton.styleFrom(
//           backgroundColor: Colors.transparent,
//           elevation: 0,
//           shape: RoundedRectangleBorder(
//             borderRadius: BorderRadiusGeometry.circular(28),
//             side: BorderSide(color: ColorManager.goldColor),
//           ),
//         ),
//         child: image != null
//             ? ClipRRect(
//                 borderRadius: BorderRadiusGeometry.circular(28),
//                 child: Image.file(
//                   image!.absolute,
//                   width: double.infinity,
//                   fit: BoxFit.cover,
//                 ),
//               )
//             : Lottie.asset(
//                 AssetManager.imagePickerUrl,
//                 height: double.infinity,
//               ),
//       ),
//     );