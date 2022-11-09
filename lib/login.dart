import 'package:flutter/material.dart';
import 'package:flutter_application_1/signup.dart';
import 'package:fluttertoast/fluttertoast.dart';

class loginpage extends StatefulWidget {
  @override
  State<loginpage> createState() => _loginpageState();
}

class _loginpageState extends State<loginpage> {
  bool viewenable = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Padding(padding: EdgeInsets.only(top: 70)),
              const Text(
                "Login",
                style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
              ),
              const Padding(
                padding: EdgeInsets.only(top: 15),
              ),
              const Text(
                "welcome back!Login with your credentials",
                style: TextStyle(fontSize: 15),
              ),
              const Padding(padding: EdgeInsets.all(30)),
              const SizedBox(
                height: 40,
                width: 300,
                child: TextField(
                    decoration: InputDecoration(
                  prefixIcon: Icon(Icons.account_circle),
                  label: Text("username"),
                  hintText: "usename must be your email",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.horizontal(),
                    borderSide: BorderSide(color: Colors.blueAccent),
                  ),
                )),
              ),
              const Padding(padding: EdgeInsets.all(20)),
              SizedBox(
                height: 40,
                width: 300,
                child: TextField(
                  
                  //obscuringCharacter: "*",
                  obscureText: viewenable,
                  decoration: InputDecoration(
                    suffixIcon: IconButton(
                        onPressed: () {
                          setState(() {
                            if (viewenable) {
                              viewenable = false;
                            } else {
                              viewenable = true;
                            }
                          });
                        },
                        icon: Icon(viewenable == true
                            ? Icons.visibility_off
                            : Icons.visibility)),
                    prefixIcon: const Icon(Icons.app_registration),
                    label: const Text("Password"),
                    hintText: "password length should be 6",
                    border: const OutlineInputBorder(
                      borderRadius: BorderRadius.horizontal(),
                      borderSide: BorderSide(color: Colors.blueAccent),
                    ),
                  ),
                ),
              ),
              const Padding(padding: EdgeInsets.only(top: 60)),
              SizedBox(
                height: 40,
                width: 250,
                child: ElevatedButton(
                  onPressed: () {
                    Fluttertoast.showToast(
        msg: "Login Successfull",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.black,
        textColor: Colors.white,
        fontSize: 16.0
    );
                  },
                  child: const Text("Login"),
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blueAccent),
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(top: 15),
              ),
              TextButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => siginup()));
                },
                child: const Text("don't have an account?signup"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
