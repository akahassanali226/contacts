// ignore_for_file: must_be_immutable

import 'package:contacts/presentation/home/data/contact_model.dart';
import 'package:contacts/presentation/home/widgets/contact_container.dart';
import 'package:flutter/material.dart';

class ListedHome extends StatefulWidget {
  VoidCallback onContactDeleted;
  List<ContactModel> contactList;
  ListedHome({
    super.key,
    required this.contactList,
    required this.onContactDeleted,
  });

  @override
  State<ListedHome> createState() => _ListedHomeState();
}

class _ListedHomeState extends State<ListedHome> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;

    return GridView.builder(
      itemCount: widget.contactList.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: height * 0.01,
        crossAxisSpacing: height * 0.01,
        mainAxisExtent: height * 0.38,
      ),
      itemBuilder: (context, i) {
        return ContactContainer(
          contactModel: widget.contactList[i],
          onContactDeleted: widget.onContactDeleted,
        );
      },
    );
  }
}
