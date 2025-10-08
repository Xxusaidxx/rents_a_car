import 'package:flutter/material.dart';
import 'package:rent_a_car_app/Constants/app_colors.dart';
import 'package:rent_a_car_app/Constants/app_images.dart';
import 'package:rent_a_car_app/UserPanel/user_panel_service/firebase_fetching_service.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final carService = CarService();
    return Scaffold(
      backgroundColor: Color.fromRGBO(10, 20, 20, 0.8),
      appBar: AppBar(
        title: const Text(
          "Available Cars",

          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Color(0xFFF1C40F),
          ),
        ),
        centerTitle: true,
        elevation: 3,
        backgroundColor: Colors.blueGrey,
      ),

      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.search, color: Colors.white),
                hintText: "Search your dream car....",
                hintStyle: TextStyle(color: Colors.white),
                filled: false,
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(21),
                  borderSide: BorderSide(color: Colors.blueGrey),
                ),
              ),
            ),
          ),
          Image.asset(
            brandcars,
            width: double.infinity,
            height: 150,
            fit: BoxFit.cover,
          ),
          const SizedBox(height: 15),

          //Firebase Data
          Expanded(
            child: StreamBuilder<List<Map<String, dynamic>>>(
              stream: carService.getAvailableCars(),
              builder: (context, snapshot) {
                print(
                  "StreamBuilder: state = ${snapshot.connectionState}, hasData = ${snapshot.hasData}",
                );

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
                      elevation: 3,
                      color: Color(0xFFFFFFFF),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                      margin: const EdgeInsets.symmetric(vertical: 10),
                      child: Padding(
                        padding: const EdgeInsets.all(16),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // CAR ID
                            Text(
                              "Car ID: ${data['carRegistrationNumber'] ?? 'No Registration'}",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                                color: Color(0xFF475569),
                              ),
                            ),
                            SizedBox(height: 10),

                            // NAME
                            Text(
                              "${data['name'] ?? "Unknown"}",
                              style: TextStyle(
                                fontSize: 20,
                                color: Colors.blue,
                              ),
                            ),
                            SizedBox(height: 5),

                            // EMAIL
                            RichText(
                              text: TextSpan(
                                children: [
                                  TextSpan(
                                    text: "email :",
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 15,
                                    ),
                                  ),
                                  TextSpan(
                                    text: " ${data['email'] ?? "Not Provided"}",
                                    style: TextStyle(
                                      color: Colors.green,
                                      fontSize: 15,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(height: 3),

                            // CONTACT
                            RichText(
                              text: TextSpan(
                                children: [
                                  TextSpan(
                                    text: "contact :",
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 15,
                                    ),
                                  ),

                                  TextSpan(
                                    text: " ${data['phone'] ?? "Not Provided"}",
                                    style: TextStyle(color: Colors.green),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(height: 3),

                            // OWNER ID
                            RichText(
                              text: TextSpan(
                                children: [
                                  TextSpan(
                                    text: "ownerId :",
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 15,
                                    ),
                                  ),
                                  TextSpan(
                                    text:
                                        " ${data['ownerId'] ?? "No Owner_Id"}",
                                    style: TextStyle(color: Colors.green),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(height: 10),
                            Text(
                              "${data['aboutCar'] ?? 'No Description'}",
                              style: const TextStyle(
                                color: Colors.brown,
                                fontSize: 17,
                              ),
                            ),
                            SizedBox(height: 15),
                            Align(
                              alignment: Alignment.centerRight,
                              child: ElevatedButton.icon(
                                onPressed: () {},
                                icon: const Icon(Icons.car_rental, size: 18),
                                label: Text("Book Now"),
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.black,
                                  foregroundColor: Colors.white,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                  padding: EdgeInsets.symmetric(
                                    vertical: 10,
                                    horizontal: 18,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
