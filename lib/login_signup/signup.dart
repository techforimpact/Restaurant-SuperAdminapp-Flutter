import 'dart:convert';
import 'package:flutter/material.dart';

import 'action_button.dart';
import 'constants.dart';

class SignUp extends StatefulWidget {
  final Function onLogInSelected;

  const SignUp({required this.onLogInSelected});

  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Padding(
      padding: EdgeInsets.all(size.height > 770
          ? 64
          : size.height > 670
              ? 32
              : 16),
      child: Center(
        child: Card(
          elevation: 5,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(25),
            ),
          ),
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 200),
            height: size.height *
                (size.height > 770
                    ? 0.7
                    : size.height > 670
                        ? 0.8
                        : 0.9),
            width: 500,
            color: Colors.white,
            child: Center(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(40),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "SIGN UP",
                        style: TextStyle(
                          fontFamily: "Nunito",
                          fontSize: 18,
                          color: Colors.grey[700],
                        ),
                      ),

                      const SizedBox(
                        height: 8,
                      ),

                      Container(
                        width: 30,
                        child: Divider(
                          color: kPrimaryColor,
                          thickness: 2,
                        ),
                      ),

                      const SizedBox(
                        height: 32,
                      ),

                      const TextField(
                        decoration: InputDecoration(
                          hintStyle: TextStyle(
                            fontFamily: "Nunito",
                          ),
                          hintText: 'Name',
                          labelText: 'Name',
                          suffixIcon: Icon(
                            Icons.person_outline,
                          ),
                        ),
                      ),

                      const SizedBox(
                        height: 32,
                      ),

                      const TextField(
                        decoration: InputDecoration(
                          hintStyle: TextStyle(
                            fontFamily: "Nunito",
                          ),
                          hintText: 'Email',
                          labelText: 'Email',
                          suffixIcon: Icon(
                            Icons.mail_outline,
                          ),
                        ),
                      ),

                      const SizedBox(
                        height: 32,
                      ),

                      const TextField(
                        decoration: InputDecoration(
                          hintStyle: TextStyle(
                            fontFamily: "Nunito",
                          ),
                          hintText: 'Password',
                          labelText: 'Password',
                          suffixIcon: Icon(
                            Icons.lock_outline,
                          ),
                        ),
                      ),

                      const SizedBox(
                        height: 32,
                      ),

                      const TextField(
                        decoration: InputDecoration(
                          hintStyle: TextStyle(
                            fontFamily: "Nunito",
                          ),
                          hintText: 'Confirm Password',
                          labelText: 'Confirm Password',
                          suffixIcon: Icon(
                            Icons.lock_outline,
                          ),
                        ),
                      ),

                      const SizedBox(
                        height: 64,
                      ),

                      InkWell(
                        onTap: () {
                          // Navigator.push(
                          //     context,
                          //     MaterialPageRoute(
                          //         builder: (builder) => HomeScreen()));
                        },
                        child: Container(
                          height: 50,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: kPrimaryColor,
                            borderRadius: const BorderRadius.all(
                              Radius.circular(25),
                            ),
                            boxShadow: [
                              BoxShadow(
                                color: kPrimaryColor.withOpacity(0.2),
                                spreadRadius: 4,
                                blurRadius: 7,
                                offset: const Offset(0, 3),
                              ),
                            ],
                          ),
                          child: Center(
                            child: isloading
                                ? const CircularProgressIndicator()
                                : const Text(
                                    'Create an account',
                                    style: TextStyle(
                                      fontFamily: "Nunito",
                                      color: Colors.white,
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                          ),
                        ),
                      ),
                      // actionButton("Create Account"),

                      const SizedBox(
                        height: 32,
                      ),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            "Already have an account?",
                            style: TextStyle(
                              fontFamily: "Nunito",
                              color: Colors.grey,
                              fontSize: 14,
                            ),
                          ),
                          const SizedBox(
                            width: 8,
                          ),
                          InkWell(
                            onTap: () {
                              widget.onLogInSelected();
                            },
                            child: Row(
                              children: [
                                Text(
                                  "Log In",
                                  style: TextStyle(
                                    fontFamily: "Nunito",
                                    color: kPrimaryColor,
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const SizedBox(
                                  width: 8,
                                ),
                                Icon(
                                  Icons.arrow_forward,
                                  color: kPrimaryColor,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  bool isloading = false;
}
