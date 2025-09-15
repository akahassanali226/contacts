import 'dart:io';

class ContactModel {
  String name;
  String email;
  String phone;
  File? image;

  ContactModel({
    required this.name,
    required this.email,
    required this.phone,
    required this.image,
  });

  static List<ContactModel> contactModelList = [];

  void addContact(ContactModel contact) {
    contactModelList.add(contact);
  }
}
