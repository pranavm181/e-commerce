// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, use_build_context_synchronously, must_be_immutable

import 'dart:developer';

import 'package:ecommerce/homepage.dart';
import 'package:ecommerce/signup.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class SignInpage extends StatelessWidget {
  SignInpage({super.key});
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    Future signin() async {
      try {
        await FirebaseAuth.instance.signInWithEmailAndPassword(
            email: email.text, password: password.text);
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => Homepage(),
            ));
      } catch (e) {
        log(e.toString());
      }
    }

    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Sign In',
              style: TextStyle(
                  fontSize: 25,
                  color: Colors.black,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            TextField(
              controller: email,
              decoration: InputDecoration(
                labelText: 'Email',
                labelStyle: TextStyle(color: Colors.black, fontSize: 18),
                fillColor: Colors.grey[100],
                filled: true,
                floatingLabelAlignment: FloatingLabelAlignment.start,
                contentPadding: EdgeInsets.all(10.0),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                  borderSide: BorderSide(color: Colors.transparent),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                  borderSide: BorderSide(color: Colors.transparent),
                ),
              ),
            ),
            SizedBox(height: 25),
            TextField(
              controller: password,
              obscureText: true,
              decoration: InputDecoration(
                labelText: 'Password',
                labelStyle: TextStyle(color: Colors.black, fontSize: 18),
                fillColor: Colors.grey[100],
                filled: true,
                floatingLabelAlignment: FloatingLabelAlignment.start,
                contentPadding: EdgeInsets.all(10.0),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                  borderSide: BorderSide(style: BorderStyle.none),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                  borderSide: BorderSide(style: BorderStyle.none),
                ),
              ),
            ),
            Align(
              alignment: Alignment.centerRight,
              child: TextButton(
                onPressed: () {},
                child: Text(
                  'Forgot Password!',
                  style: TextStyle(
                      color: Colors.lightBlueAccent,
                      fontSize: 15,
                      decoration: TextDecoration.underline,
                      decorationColor: Colors.lightBlueAccent),
                ),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                signin();
              },
              style: ButtonStyle(
                  backgroundColor: WidgetStatePropertyAll(Colors.black),
                  fixedSize: WidgetStatePropertyAll(Size.fromWidth(480)),
                  minimumSize: WidgetStatePropertyAll(Size.fromHeight(45))),
              child: Text(
                'Login',
                style: TextStyle(color: Colors.white, fontSize: 18),
              ),
            ),
            SizedBox(height: 10),
            Center(
              child: Text(
                'Or',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
              ),
            ),
            SizedBox(height: 2),
            ElevatedButton(
              onPressed: () {},
              style: ButtonStyle(
                  backgroundColor: WidgetStatePropertyAll(Colors.white),
                  fixedSize: WidgetStatePropertyAll(Size.fromWidth(480)),
                  minimumSize: WidgetStatePropertyAll(Size.fromHeight(45)),
                  shape: WidgetStatePropertyAll(RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(0)))),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: 20,
                    width: 20,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage('lib/images/google.png'))),
                  ),
                  SizedBox(width: 5),
                  Text(
                    'Sign in with Google',
                    style: TextStyle(color: Colors.black, fontSize: 18),
                  ),
                ],
              ),
            ),
            SizedBox(height: 8),
            Row(
              children: [
                Text("Don't have an account?"),
                TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Signup(),
                      ),
                    );
                  },
                  child: Text(
                    'Register',
                    style: TextStyle(
                        color: Colors.lightBlueAccent,
                        decoration: TextDecoration.underline,
                        decorationColor: Colors.lightBlueAccent),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
