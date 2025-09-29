import 'package:flutter/widgets.dart';

class Form_Validators {
  static String? validateName(String? value) {
    if (value == null || value.trim().isEmpty) {
      return ("Name is required !!");
    } else if (value.trim().length < 3) {
      return "Name should be of atleast 3 character  long !!";
    }
    return null;
  }

  static String? validateEmail(String? value) {
    if (value == null || value.trim().isEmpty) return "Email is Required !!";
    if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
      return "Enter valid email !!";
    } else {
      return null;
    }
  }

  static String? validateContact(String? value) {
    if (value == null || value.trim().isEmpty) {
      return "Contact number is required !!";
    }
    if (!RegExp(r'^(03[0-9]{9})$').hasMatch(value)) {
      return "Enter valid number !!";
    }
  }

  static String? validateOwnerId(String? value) {
    if (value == null || value.trim().isEmpty) {
      return "Owner_Id is required !!";
    }
    if (!RegExp(r'^[0-9]+$').hasMatch(value)) {
      return "Please enter correct Owner_Id !!";
    }
  }
}
