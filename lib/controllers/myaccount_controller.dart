import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:pharmacia/models/myaccount_model.dart';

class MyAccountController {
  late TextEditingController nameController;
  late TextEditingController emailController;
  late TextEditingController numberController;
  late TextEditingController dateController;
  late DateTime? selectedDate;
  late String? selectedGender;
  late UserModel userModel;

  MyAccountController() {
    nameController = TextEditingController();
    emailController = TextEditingController();
    numberController = TextEditingController();
    dateController = TextEditingController();

    initializeData();
  }

  void initializeData() {
    nameController.text = 'John Arthur';
    emailController.text = 'arthurjohn@gmail.com';
    numberController.text = '0812-3456-2635';
    selectedGender = null;
    selectedDate = null;
    dateController.text = '';
  }

  Future<void> selectDate(BuildContext context) async {
    DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: selectedDate ?? DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );

    if (pickedDate != null && pickedDate != selectedDate) {
      selectedDate = pickedDate;
      dateController.text = DateFormat('d MMMM yyyy').format(pickedDate);
    }
  }

  void updateUserProfile() {
    userModel = UserModel(
      name: nameController.text,
      email: emailController.text,
      phoneNumber: numberController.text,
      gender: selectedGender,
      dateOfBirth: selectedDate,
    );

  }
}
