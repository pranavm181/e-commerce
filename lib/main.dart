// ignore_for_file: prefer_const_constructors

import 'package:ecommerce/cart_bloc.dart';
import 'package:ecommerce/firebase_options.dart';
import 'package:ecommerce/homepage.dart';
import 'package:ecommerce/notificationservice.dart';


import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
   
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
 NotificationService notificationService = NotificationService();
  await notificationService.initNotification();
 
  runApp(BlocProvider(create: (context) => CartBloc(),child: MaterialApp(
    home: Homepage(),
    debugShowCheckedModeBanner: false,
  )),);
    
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}
