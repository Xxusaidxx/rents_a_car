import 'package:flutter/material.dart';
import 'package:rent_a_car_app/UserPanel/user_panel_service/firebase_fetching_service.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final carService = CarService();
    return Scaffold(
      appBar: AppBar(title: Text("Available Cars"), centerTitle: true),

      body: StreamBuilder<List<Map<String, dynamic>>>(
        stream: carService.getAvailableCars(),
        builder: (context, snapshot) {
       print("StreamBuilder: state = ${snapshot.connectionState}, hasData = ${snapshot.hasData}");

          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Text("No Data till Yet");
          }
          final cars = snapshot.data!;

          return ListView.builder(
            itemCount: cars.length,
            itemBuilder: (context, index) {
              final data = cars[index];

              return Card(
                child: ListTile(
                  title: Text(
                    data['carRegistrationNumber'] ?? "No Registration",
                  ),
                  subtitle: Column(
                    children: [
                      Text("Name: ${data['name'] ?? "Unknown"}"),
                      Text("Email: ${data['email'] ?? "Not Provided"}"),
                      Text("${data['phone'] ?? "Not Provided"}"),
                      // Text("${data['ownerId'] ?? "No Owner_Id"}"),
                      Text("Description: ${data['aboutCar'] ?? 'N/A'}"),
                    ],
                  )
                ),
              );
            },
          );
        },
      ),
    );
  }
}