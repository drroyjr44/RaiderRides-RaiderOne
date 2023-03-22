import 'package:driver_app/authentication/login_screen.dart';
import 'package:driver_app/widgets/progress_dialog.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'car_info_screen.dart';

class SignUpScreen extends StatefulWidget
{

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen>
{
  TextEditingController nameTextEditingController = TextEditingController();
  TextEditingController emailTextEditingController = TextEditingController();
  TextEditingController phoneTextEditingController = TextEditingController();
  TextEditingController passwordTextEditingController = TextEditingController();

  validateForm()
  {
    if(nameTextEditingController.text.length < 3)
      {
        Fluttertoast.showToast(msg: "Name must be at least 3 Characters");
      }
    else if(!emailTextEditingController.text.contains("@ttu.edu"))
      {
        Fluttertoast.showToast(msg: "Please register with a valid TTU email");
      }
    else if(phoneTextEditingController.text.isEmpty || phoneTextEditingController.text.length < 10)
    {
      Fluttertoast.showToast(msg: "A Phone number is required and must be valid");
    }
    else if(passwordTextEditingController.text.length < 6)
    {
      Fluttertoast.showToast(msg: "Password Must be at least 6 characters");
    }
    else
    {
      showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext c)
          {
            return ProgressDialog(message: "Processing, Please Wait....");
          }
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: Column(
          children: [

            const SizedBox(height: 60,),

            Image.asset("images/texastechlogo.jpeg"),

            const SizedBox(height: 40,),

            const Text(
                "Register as a Driver",
                style: TextStyle(
                  fontSize: 26,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Montserrat',
                )
            ),

            const SizedBox(
              height: 15,
            ),

            Padding(
              padding: EdgeInsets.fromLTRB(20, 0, 20, 15),
              child: TextField(
                controller: nameTextEditingController,
                style: const TextStyle(
                  color: Colors.red, //colors text
                ),
                decoration: const InputDecoration(
                  labelText: "Name",
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
              padding: EdgeInsets.fromLTRB(20, 0, 20, 15),
              child: TextField(
                controller: emailTextEditingController,
                keyboardType: TextInputType.emailAddress,
                style: const TextStyle(
                  color: Colors.red, //colors text
                ),
                decoration: const InputDecoration(
                  labelText: "Email",
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
              padding: EdgeInsets.fromLTRB(20, 0, 20, 15),
              child: TextField(
                controller: phoneTextEditingController,
                keyboardType: TextInputType.phone,
                style: const TextStyle(
                  color: Colors.red, //colors text
                ),
                decoration: const InputDecoration(
                  labelText: "Phone",
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
            Padding(
              padding: EdgeInsets.fromLTRB(20, 0, 20, 15),
              child: TextField(
                controller: passwordTextEditingController,
                keyboardType: TextInputType.text,
                obscureText: true,
                style: const TextStyle(
                  color: Colors.red, //colors text
                ),
                decoration: const InputDecoration(
                  labelText: "Password",
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
            ), // Pass Field

            ElevatedButton(
              onPressed: () {
                validateForm();
              },
              child: const Text(
                "Create Account",
                style: TextStyle(
                  color: Colors.black54,
                  fontSize: 18,
                ),
              ),
            ),

            MaterialButton(
              splashColor: Colors.transparent,
              highlightColor: Colors.transparent,
              onPressed: () {  },
              child: TextButton(
                child: const Text(
                  "Already have an account? Login Here",
                  style: TextStyle(color: Colors.white, decoration: TextDecoration.underline),
                ),
                onPressed: ()
                {
                  Navigator.push(context, MaterialPageRoute(builder: (c) => LoginScreen()));
                },
              ),
            ),

          ],
        )
      ),
    );
  }
}
