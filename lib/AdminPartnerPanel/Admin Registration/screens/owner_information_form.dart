import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rent_a_car_app/AdminPartnerPanel/admin_firebase_service/owner_info_service.dart';
import 'package:rent_a_car_app/AdminPartnerPanel/validation_services/validator_form_service.dart';
import 'package:rent_a_car_app/Constants/app_images.dart';
import 'package:rent_a_car_app/Constants/app_colors.dart';
import 'package:rent_a_car_app/UserPanel/user_registration/ui_helper.dart';
import 'package:rent_a_car_app/admin_blocs/information_bloc/owner_info_bloc.dart';
import 'package:rent_a_car_app/admin_blocs/information_bloc/owner_info_event.dart';
import 'package:rent_a_car_app/admin_blocs/information_bloc/owner_info_state.dart';

class OwnerInformation extends StatefulWidget {
  const OwnerInformation({super.key});

  @override
  State<OwnerInformation> createState() => _OwnerInformationState();
}

class _OwnerInformationState extends State<OwnerInformation> {
  final _formKey = GlobalKey<FormState>();
  String slectedBrand = "";
  String selectedColor = "Blue";
  String selectedFuelType = "Petrol";
  bool isBrandSelected = true;

  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController ownerIdController = TextEditingController();
  TextEditingController carRegistrationController = TextEditingController();
  TextEditingController carDescriptionController = TextEditingController();

  //Custom brand Tables

  Widget _buildBrandOption(String brand) {
    return GestureDetector(
      onTap: () => setState(() => slectedBrand = brand),
      child: Container(
        decoration: BoxDecoration(
          color: slectedBrand == brand ? Colors.grey : Colors.transparent,
          borderRadius: BorderRadius.circular(4),
        ),
        child: Text(
          brand,
          style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => OwnerInfoBloc(OwnerInfoService()),
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            "Rent Partner Program",
            style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
          ),
          centerTitle: true,
          elevation: 5,
          actions: [IconButton(onPressed: () {}, icon: Icon(Icons.more_vert))],
        ),
        body: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                Center(
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: CircleAvatar(
                      radius: 40,
                      backgroundImage: AssetImage(ownerlogo),
                      backgroundColor: Colors.blueGrey,
                    ),
                  ),
                ),
                SizedBox(height: 16),
                Text(
                  "Car Owner Information",
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 16),
            
                // Owner Information
                // _buildTextFormField(" Full Name", nameController),
                _buildTextField(" Full Name", nameController,validator: Form_Validators.validateName),
                _buildTextFormField("Email Address", emailController),
                _buildTextFormField("Contact", phoneController),
                _buildTextFormField("Owner Id", ownerIdController),
                SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      "Car Information",
                      style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                SizedBox(height: 16),
                Row(
                  children: [
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () => setState(() => isBrandSelected = true),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: !isBrandSelected
                              ? Colors.black
                              : Colors.grey[300],
                        ),
                        child: Text(
                          "Car Brand",
                          style: TextStyle(
                            color: !isBrandSelected ? Colors.white : Colors.black,
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () => setState(() => isBrandSelected = true),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: !isBrandSelected
                              ? Colors.black
                              : Colors.grey[300],
                        ),
                        child: Text(
                          "Car Model",
                          style: TextStyle(
                            color: !isBrandSelected ? Colors.white : Colors.black,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 16),
                Row(
                  children: [
                    Column(
                      children: [
                        Text(
                          "Regular Car Brands",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 10),
                        _buildBrandOption("Tesla"),
                        _buildBrandOption("Honda"),
                        _buildBrandOption("Toyota"),
                        _buildBrandOption("Nissan"),
                        _buildBrandOption("Cultus"),
                      ],
                    ),
                    SizedBox(width: 8),
                    Column(
                      children: [
                        Text(
                          "Luxury Cars Brands",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 10),
                        _buildBrandOption("Mercedes"),
                        _buildBrandOption("Ferrari"),
                        _buildBrandOption("Maybach"),
                        _buildBrandOption("Parado"),
                        _buildBrandOption("Lamborghini"),
                      ],
                    ),
                  ],
                ),
                SizedBox(height: 16),
                Card(
                  // elevation: 1,
                  // color: Colors.blueGrey,
                  child: Row(
                    children: [
                      Text(
                        "Upload Car Images",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                          color: Colors.blueGrey,
                        ),
                      ),
                      SizedBox(width: 70),
                      IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.camera_enhance,
                          color: Colors.blueGrey,
                          size: 28,
                        ),
                      ),
                      // SizedBox(width: 5),
                      IconButton(
                        onPressed: () {},
                        icon: Icon(Icons.image, color: Colors.blueGrey, size: 28),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 20),
                _buildTextFormField(
                  "Car Registration Number",
                  carRegistrationController,
                ),
                SizedBox(height: 15),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      "Colors",
                      style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                Wrap(
                  spacing: 5,
                  children: ["White", "Grey", "Blue", "Black"].map((color) {
                    return Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Radio(
                          value: color,
                          groupValue: selectedColor,
                          onChanged: (value) {
                            setState(() {
                              selectedColor = value!;
                            });
                          },
                        ),
                        Text(color),
                      ],
                    );
                  }).toList(),
                ),
                Row(
                  children: [
                    Text(
                      "Fuel Type",
                      style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                Wrap(
                  spacing: 3,
                  children: ["Petrol", "Diesel", "Electric", 'Hybrid'].map((
                    type,
                  ) {
                    return Row(
                      mainAxisSize: MainAxisSize.min,
            
                      children: [
                        Radio(
                          value: type,
                          groupValue: selectedFuelType,
                          onChanged: (value) {
                            setState(() {
                              selectedFuelType = value!;
                            });
                          },
                        ),
                        Text(type),
                      ],
                    );
                  }).toList(),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 8.0,
                    vertical: 8,
                  ),
                  child: TextFormField(
                    controller: carDescriptionController,
                    maxLength: 0_1000,
                    maxLines: 5,
                    decoration: InputDecoration(
                      hintText: "Enter about your car here....",
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                SizedBox(height: 5),
                BlocConsumer<OwnerInfoBloc, OwnerInfoState>(
                  listener: (context, state) {
                    if (state is OwnerSuccessState) {
                      print("Successfully submitted");
                      ScaffoldMessenger.of(
                        context,
                      ).showSnackBar(SnackBar(content: Text(state.message)));
                    } else if (state is OwnerErrorState) {
                      print("Not submitted");
            
                      ScaffoldMessenger.of(
                        context,
                      ).showSnackBar(SnackBar(content: Text("error: $e")));
                    }
                  },
                  builder: (context, state) {
                    if (state is OwnerLoadingState) {
                      return Center(
                        child: CircularProgressIndicator(color: AppColors.black),
                      );
                    }
                    return ElevatedButton(
                      onPressed: () {
                        if(_formKey.currentState!.validate()){
                          context.read<OwnerInfoBloc>().add(
                          InformationSubmitEvent(
                            name: nameController.text.trim(),
                            email: emailController.text.trim(),
                            phone: phoneController.text.trim(),
                            ownerId: ownerIdController.text.trim(),
                            carRegistrationNumber: carRegistrationController.text
                                .trim(),
                            aboutCar: carDescriptionController.text.trim(),
                          ),
                        );
                      }
                        },
                      //   context.read<OwnerInfoBloc>().add(
                      //     InformationSubmitEvent(
                      //       name: nameController.text.trim(),
                      //       email: emailController.text.trim(),
                      //       phone: phoneController.text.trim(),
                      //       ownerId: ownerIdController.text.trim(),
                      //       carRegistrationNumber: carRegistrationController.text
                      //           .trim(),
                      //       aboutCar: carDescriptionController.text.trim(),
                      //     ),
                      //   );
                      // },
                      child: Text(
                        "Submit",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: AppColors.black,
                        ),
                      ),
                    );
                  },
                ),
                SizedBox(height: 15),
            
                // ElevatedButton(
                //   onPressed: () {},
                //   style: ElevatedButton.styleFrom(
                //     backgroundColor: Colors.black38,
                //     padding: EdgeInsets.symmetric(horizontal: 120, vertical: 4),
                //     shape: RoundedRectangleBorder(
                //       borderRadius: BorderRadius.circular(18),
                //     ),
                //   ),
                //   child: Text(
                //     "Submit",
                //     style: TextStyle(
                //       fontSize: 20,
                //       fontWeight: FontWeight.bold,
                //       color: Colors.white,
                //     ),
                //   ),
                // ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

Widget _buildTextFormField(String label, TextEditingController controller,) {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: TextFormField(
      controller: controller,
      decoration: InputDecoration(
        labelText: label,
        border: OutlineInputBorder(),
      ),
    ),
  );
}


Widget _buildTextField(String label, TextEditingController controller,{
  String? Function(String?)? validator,

}) {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: TextFormField(
      controller: controller,
      decoration: InputDecoration(
        labelText: label,
        border: OutlineInputBorder(),
      ),
      inputFormatters: [
        FilteringTextInputFormatter.allow(RegExp(r'[a-zA-Z\s]')),
      ],
      validator: validator,
    ),
  );
}
