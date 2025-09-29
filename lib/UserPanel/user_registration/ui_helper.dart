import 'package:flutter/material.dart';

class Uihelper {
  static TextFormField customTextFormField({
    required TextEditingController controller,
    String? labelText,
    String? hintText,
    bool obsecureText = false,
    IconData? prefixIcon,
    IconData? suffixIcon,
  }) {
    return TextFormField(
      controller: controller,
      obscureText: obsecureText,
      decoration: InputDecoration(
        border: OutlineInputBorder(),
        hintText: hintText,
        labelText: labelText,
        prefixIcon: prefixIcon != null ? Icon(prefixIcon) : null,
        suffixIcon: suffixIcon != null ? Icon(suffixIcon) : null,
      ),
    );
  }

  static ElevatedButton customElevatedButton(
    bool loading,
    VoidCallback onPressed,
    String text,
  ) {
    return 
    ElevatedButton(
      onPressed: onPressed, 
      child:  loading ? CircularProgressIndicator() : Text(text));
  }

  static Text customText(String text) {
    return Text(
      text,
      style: TextStyle(
        fontSize: 25,
        fontWeight: FontWeight.bold,
        color: Colors.black,
      ),
    );
  }

  static void showSnackBar(BuildContext context, String message) {
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(SnackBar(content: Text(message),backgroundColor: Colors.grey.shade800,),);
  }
}
