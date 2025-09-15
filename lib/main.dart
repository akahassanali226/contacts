import 'package:contacts/core/utils/route_manager.dart';
import 'package:contacts/presentation/home/view/home_view.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const ContactsApp());
}

class ContactsApp extends StatelessWidget {
  const ContactsApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: RouteManager.homeRoute,
      routes: {RouteManager.homeRoute: (_) => HomeView()},
    );
  }
}
