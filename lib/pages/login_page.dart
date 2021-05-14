import 'package:catalog/utils/routes.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String name="";
  bool Changebutton=false;
  
  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      child: SingleChildScrollView(
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
              "welcome to MurcyDom, $name",
              style: TextStyle(
                fontSize: 25,
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
                onChanged: (value){
                  name=value;
                  setState(() {});//it refreshes the page by calling build method..it does not work for stateless widget
                },
              ),

              TextFormField(
                obscureText: true,
                decoration:InputDecoration(
                  hintText: "Type your password",
                  labelText: "Password",
                ),
              ),

              SizedBox(
              height: 45.0,
             ),
              
              //in Inkwell we made the elevator button manually
              InkWell(      //we can use gesture inplace of Inkwell for clickable propertry..but in gesture there will be nothing which will shoe that it is clicking
                onTap: () async {
                  setState(() {
                  Changebutton=true;                    
                  });
                  await Future.delayed(Duration(seconds:1));
                      Navigator.pushNamed(context, MyRoutes.homeroute);
                },
                child: AnimatedContainer(
                  duration: Duration(seconds : 1),
                  height:40,
                  width:Changebutton? 75 : 150,
                  //color: Colors.deepPurple,
                  alignment: Alignment.center,
                  child: Changebutton?Icon(Icons.done,color:Colors.white) :Text(
                    "Log In",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                  decoration: BoxDecoration(
                    color: Colors.deepPurple,
                    borderRadius: BorderRadius.circular(Changebutton?20 : 10),
                  ),
                ),
              ),
              // ElevatedButton(
              //   child: Text("Log In"),
              //   style: TextButton.styleFrom(minimumSize: Size(125,40)),
              //   onPressed: (){
              //     Navigator.pushNamed(context, MyRoutes.homeroute);
              //   },
              //   ),   
              ],
            ),
          )
          ],
        ),
      ),
    );
  }
}