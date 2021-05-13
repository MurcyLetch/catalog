import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      child: Column(
        children: [
          Image.asset(
            "assets/images/login_img.png",
            fit: BoxFit.cover,
          ),
          SizedBox(
            height: 20.0,
          ),
          Text(
            "welcome",
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(
            height: 20.0,
          ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 16.0,horizontal: 32.0),
          child: Column(
            children: [
                        TextFormField(
              decoration:InputDecoration(
                hintText: "Enter User Name",
                labelText: "Username",
              ),
            ),

            TextFormField(
              obscureText: true,
              decoration:InputDecoration(
                hintText: "Type your password",
                labelText: "Password",
              ),
            ),

            SizedBox(
            height: 20.0,
           ),
            
            ElevatedButton(
              child: Text("Log In"),
              style: TextButton.styleFrom(),
              onPressed: (){
                print("hi murcyletch");
              },
              ),
            ],
          ),
        )
        ],
      ),
    );
  }
}