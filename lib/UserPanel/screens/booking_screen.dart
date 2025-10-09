import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class BookingScreen extends StatelessWidget {
  final String userId;
  final String carId;
  final String ownerId;

  BookingScreen({
    required this.userId,
    required this.carId,
    required this.ownerId,
  });

  final TextEditingController pickupController = TextEditingController();
  final TextEditingController dropController = TextEditingController();
  final TextEditingController startDateController = TextEditingController();
  final TextEditingController endDateController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(title: Text("Book Your Car")),
    body: Column(
      children: [
        _buildTextFormField("Pickup Location", pickupController, []),
        _buildTextFormField("Drop Location", dropController, []),
        _buildTextFormField("Start Date (DD/MM/YYYY)", startDateController, []),
        _buildTextFormField("End Date (DD/MM/YYYY)", pickupController, []),
        SizedBox(height: 15,),
        ElevatedButton(onPressed: (){}, style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xFF1E2326),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(17),
                      ),
                      minimumSize: Size(350, 50),
                    ), child:Text("Confirm Booking"),
        )
      ],
    ),
    );
    
  }
}

Widget _buildTextFormField(
  String label,
  TextEditingController controller,
  final List<TextInputFormatter>? inputFormatters, {
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
      inputFormatters: inputFormatters,
      validator: validator,
    ),
  );
}
