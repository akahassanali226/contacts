import 'package:contacts/core/utils/asset_manager.dart';
import 'package:flutter/material.dart';

class CustomAppbar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppbar({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return AppBar(
      actions: [
        SizedBox(width: 16),
        Image.asset(
          AssetManager.routeLogoUrl,
          width: width * 0.3,
          fit: BoxFit.cover,
        ),
        Spacer(),
      ],
      backgroundColor: Colors.transparent,
      elevation: 0,
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(56);
}
