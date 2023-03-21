import 'package:flutter/material.dart';

class CarInfoScreen extends StatefulWidget
{

  @override
  State<CarInfoScreen> createState() => _CarInfoScreenState();
}

class _CarInfoScreenState extends State<CarInfoScreen>
{
  TextEditingController carModelTextEditingController = TextEditingController();
  TextEditingController carNumberTextEditingController = TextEditingController();
  TextEditingController carColorTextEditingController = TextEditingController();

  List<String> carTypesList = ["uber-x", "uber-go", "bike"]; // SUBJECT TO CHANGE LATER
  String? selectedCarType;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: Column(
          children: [

            const SizedBox(height: 60,),

            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Image.asset("images/texastechlogo.jpeg"),
            ),

            const SizedBox(height: 40,),

            const Text(
                "Write Car Details",
                style: TextStyle(
                  fontSize: 26,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Montserrat',
                )
            ),

            const SizedBox(height: 15,),

            Padding(
              padding: EdgeInsets.fromLTRB(20, 0, 20, 25),
              child: TextField(
                controller: carModelTextEditingController,
                style: const TextStyle(
                  color: Colors.red, //colors text
                ),
                decoration: const InputDecoration(
                  labelText: "Car Model",
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.red, width: 2),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.red, width: 2),
                  ),
                  labelStyle: TextStyle(
                    color: Color(0xEEEEEEFF),
                    fontSize: 15,
                    fontFamily: 'Montserrat',
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ), // Name Field

            Padding(
              padding: EdgeInsets.fromLTRB(20, 0, 20, 25),
              child: TextField(
                controller: carNumberTextEditingController,
                style: const TextStyle(
                  color: Colors.red, //colors text
                ),
                decoration: const InputDecoration(
                  labelText: "Car Number",
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.red, width: 2),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.red, width: 2),
                  ),
                  labelStyle: TextStyle(
                    color: Color(0xEEEEEEFF),
                    fontSize: 15,
                    fontFamily: 'Montserrat',
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ), // Email Field

            Padding(
              padding: EdgeInsets.fromLTRB(20, 0, 20, 25),
              child: TextField(
                controller: carColorTextEditingController,
                style: const TextStyle(
                  color: Colors.red, //colors text
                ),
                decoration: const InputDecoration(
                  labelText: "Car Color",
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.red, width: 2),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.red, width: 2),
                  ),
                  labelStyle: TextStyle(
                    color: Color(0xEEEEEEFF),
                    fontSize: 15,
                    fontFamily: 'Montserrat',
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ), // Phone Field

            const SizedBox(height: 15,),

            DropdownButtonHideUnderline(
              child: DropdownButton(
                iconSize: 25,
                dropdownColor: Colors.black,
                hint: const Text(
                  "Car Type\t\t\t",
                  style: TextStyle(
                    fontSize: 14.0,
                    color: Colors.grey,
                  ),
                ),
                value: selectedCarType,
                onChanged: (newValue)
                  {
                    setState(() {
                      selectedCarType = newValue.toString();
                    });
                  },
                items: carTypesList.map((car) {
                  return DropdownMenuItem(
                    value: car,
                    child: Text(
                      car,
                      style: const TextStyle(color: Colors.grey),
                    ),
                  );
                }).toList(),
              ),
            ),

            const SizedBox(height: 15,),

            ElevatedButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (c) => CarInfoScreen()));
              },
              child: const Text(
                "Save Now",
                style: TextStyle(
                  color: Colors.black54,
                  fontSize: 18,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
