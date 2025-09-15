import 'package:contacts/core/utils/color_manager.dart';
import 'package:contacts/presentation/home/data/contact_model.dart';
import 'package:contacts/presentation/home/widgets/custom_appbar.dart';
import 'package:contacts/presentation/home/widgets/delete_floating_button.dart';
import 'package:contacts/presentation/home/widgets/empty_list_home.dart';
import 'package:contacts/presentation/home/widgets/listed_home.dart';
import 'package:contacts/presentation/home/widgets/add_floating_button.dart';
import 'package:contacts/presentation/home/widgets/two_floating_buttons.dart';
import 'package:flutter/material.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  TextEditingController userNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  List<ContactModel> contactModelList = ContactModel.contactModelList;

  @override
  Widget build(BuildContext context) {
    final GlobalKey<FormState> formKey = GlobalKey<FormState>();

    return Scaffold(
      backgroundColor: ColorManager.darkBlueColor,
      appBar: CustomAppbar(),

      floatingActionButton: contactModelList.isEmpty
          ? AddFloatingButton(
              userNameController: userNameController,
              emailController: emailController,
              phoneController: phoneController,
              formKey: formKey,

              onContactAdded: (contact) {
                setState(() {
                  contactModelList.add(contact);
                });
              },
            )
          : contactModelList.length < 6
          ? TwoFloatingButtons(
              userNameController: userNameController,
              emailController: emailController,
              phoneController: phoneController,
              formKey: formKey,

              onContactAdded: (contact) {
                setState(() {
                  contactModelList.add(contact);
                });
              },
              onContactdeleted: () {
                setState(() {
                  contactModelList.removeLast();
                });
              },
            )
          : DeleteFloatingButton(
              onContactdeleted: () {
                setState(() {
                  contactModelList.removeLast();
                });
              },
            ),

      body: SafeArea(
        bottom: false,
        child: Container(
          padding: EdgeInsets.only(left: 8, right: 8, top: 16),
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: contactModelList.isEmpty
                    ? EmptyListHome()
                    : ListedHome(
                        contactList: contactModelList,
                        onContactDeleted: () {
                          setState(() {
                            contactModelList.removeLast();
                          });
                        },
                      ),
              ),

              // Align(
              //   alignment: AlignmentGeometry.bottomRight,
              //   child:
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
