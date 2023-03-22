import 'package:driver_app/authentication/signup_screen.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget
{

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen>
{
  TextEditingController emailTextEditingController = TextEditingController();
  TextEditingController passwordTextEditingController = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: Column (
          children: [
            const SizedBox(height: 60,),

            Image.asset("images/texastechlogo.jpeg"),

            const SizedBox(height: 40,),

            const Text(
                "Login as a Driver",
                style: TextStyle(
                  fontSize: 26,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Montserrat',
                )
            ),

            const SizedBox(height: 15,),

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
            ), //email
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
            ), //password

            const SizedBox(
              height: 20,
            ),

            ElevatedButton(
              onPressed: ()
              {

              },
              child: const Text(
                "Login",
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
                  "Don't have an account? Sign Up Here",
                  style: TextStyle(color: Colors.white, decoration: TextDecoration.underline),
                ),
                onPressed: ()
                {
                  Navigator.push(context, MaterialPageRoute(builder: (c) => SignUpScreen()));
                },
              ),
            ),
          ],
        )
      ),
    );
  }
}
