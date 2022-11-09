import 'dart:html';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class siginup extends StatefulWidget {
  @override
  State<siginup> createState() => _siginupState();
}

class _siginupState extends State<siginup> {
  bool viewenable = true;

  var formkey = GlobalKey<FormState>();

  TextEditingController pass = TextEditingController();

  TextEditingController cpass = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          "REGISTER HERE!",
          style: TextStyle(color: Colors.white70),
        ),
      ),
      body: Form(
          key: formkey,
          child: ListView(
            children: [
              const Padding(padding: EdgeInsets.only(top: 30)),
              const Center(
                child: Text(
                  "Sign up",
                  style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(top: 15),
              ),
              const Center(
                child: Text("Create an Account,its free"),
              ),
              Padding(
                padding: const EdgeInsets.all(30),
                child: SizedBox(
                  height: 40,
                  width: 100,
                  child: TextFormField(
                    textInputAction: TextInputAction.next,
                    decoration: InputDecoration(
                      prefix: const Icon(Icons.account_circle),
                      labelText: "email",
                      hintText: "username must be your email",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                    validator: (email) {
                      if (email!.isEmpty || !email.contains("@.com")) {
                        return "enter a valid email ";
                      } else {
                        return null;
                      }
                    },
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(30),
                child: SizedBox(
                  height: 40,
                  width: 100,
                  child: TextFormField(
                      obscureText: viewenable,
                      controller: pass,
                      decoration: InputDecoration(
                        suffix: IconButton(
                          onPressed: () {
                            setState(() {
                              if (viewenable) {
                                viewenable == false;
                              } else {
                                viewenable == true;
                              }
                            });
                          },
                          icon: Icon(viewenable == true
                              ? Icons.visibility_off
                              : Icons.visibility),
                        ),
                        prefix: const Icon(Icons.password_outlined),
                        labelText: "password",
                        hintText: "pass length should be 6",
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20)),
                      ),
                      validator: (password) {
                        if (password!.isEmpty || password.length > 6) {
                          return "password length should be gretaerthan 6";
                        } else {
                          return null;
                        }
                      }),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(30),
                child: SizedBox(
                  height: 40,
                  width: 100,
                  child: TextFormField(
                      obscureText: viewenable,
                      controller: cpass,
                      decoration: InputDecoration(
                        suffix: IconButton(
                            onPressed: () {
                              setState(() {
                                if (viewenable) {
                                  viewenable == false;
                                } else {
                                  viewenable == true;
                                }
                              });
                            },
                            icon: Icon(viewenable == true
                                ? Icons.visibility_off
                                : Icons.visibility)),
                        prefix: const Icon(Icons.password_outlined),
                        labelText: "confirm password",
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20)),
                      ),
                      validator: (password) {
                        if (password!.isEmpty ||
                            password.length > 6 ||
                            pass.text != cpass.text) {
                          return "password should be same";
                        } else {
                          return null;
                        }
                      }),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(30),
                child: SizedBox(
                  height: 40,
                  width: 100,
                  child: ElevatedButton(
                    onPressed: () {
                      final valid = formkey.currentState!.validate();
                      if (valid) {
                        Fluttertoast.showToast(
                            msg: "Registered Successfully",
                            toastLength: Toast.LENGTH_SHORT,
                            gravity: ToastGravity.BOTTOM,
                            timeInSecForIosWeb: 1,
                            backgroundColor: Colors.black,
                            textColor: Colors.white,
                            fontSize: 16.0);
                      } else {
                        Fluttertoast.showToast(
                            msg:
                                "Registeration failed check the username or password",
                            toastLength: Toast.LENGTH_SHORT,
                            gravity: ToastGravity.BOTTOM,
                            timeInSecForIosWeb: 1,
                            backgroundColor: Colors.black,
                            textColor: Colors.white,
                            fontSize: 16.0);
                      }
                    },
                    child: const Text("sign up"),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.redAccent,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)),
                    ),
                  ),
                ),
              ),
            ],
          )),
    );
  }
}
