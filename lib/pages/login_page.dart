import 'package:catalog/utils/routes.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String name="";
  // ignore: non_constant_identifier_names
  bool Changebutton=false;
  final _formkey=GlobalKey<FormState>();
  movetohome(BuildContext context) async {
    //after it returns true we can enter in to homepage
      if(_formkey.currentState.validate()){
        setState((){
        Changebutton=true;                    
        });
        await Future.delayed(Duration(seconds:1));
        await Navigator.pushNamed(context, MyRoutes.homeroute);
        setState(() {
        Changebutton=false;                    
        });
        }
  }
  @override
  Widget build(BuildContext context) {
    return Material(
      color: context.canvasColor,

      
      child: SingleChildScrollView(
        child: Form(
          key: _formkey,
          child: Column(
            children: [
              SizedBox(
                height: 20.0,
              ),
              Image.asset(
                "assets/images/logincat.png",
                fit: BoxFit.cover,
              ),
              SizedBox(
                height: 30.0,
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
                  // ignore: missing_return
                  validator: (value){
                    if(value.isEmpty){
                      return "username can not be empty";
                    }

                    return null;
                  },
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
                  //validator portion....
                  validator: (value){
                    if(value.isEmpty){
                      return "password is mandatory";
                    }
                    else if(value.length<6){
                      return "password length should be atleast 6";
                    }

                    return null;
                  },
                ),

                SizedBox(
                height: 45.0,
               ),
                
                //in Inkwell we made the elevator button manually
                Material(
                  color: context.theme.buttonColor,
                  borderRadius: BorderRadius.circular(Changebutton?20 : 10),
                  child: InkWell(      //we can use gesture inplace of Inkwell for clickable propertry..but in gesture there will be nothing which will shoe that it is clicking
                    onTap: () =>movetohome(context),
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
      ),
    );
  }
}