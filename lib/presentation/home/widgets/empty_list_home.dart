import 'package:contacts/core/utils/asset_manager.dart';
import 'package:contacts/core/utils/string_manager.dart';
import 'package:contacts/core/utils/style_manager.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class EmptyListHome extends StatelessWidget {
  const EmptyListHome({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Column(
      children: [
        SizedBox(height: height * 0.25),
        Lottie.asset(AssetManager.emptyListUrl, width: width * 0.5),

        Text(StringManager.emptyListString, style: StyleManager.titleLarge),
        Spacer(),
      ],
    );
  }
}
