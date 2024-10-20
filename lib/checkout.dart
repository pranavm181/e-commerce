// ignore_for_file: avoid_types_as_parameter_names

import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce/itempage.dart';


class CheckoutService {
  Future<void> storeOrderInFirebase(List<Item> cartItems) async {
    CollectionReference orders = FirebaseFirestore.instance.collection('orders');

    try {
      // Prepare order details
      List<Map<String, dynamic>> items = cartItems.map((item) => {
        'name': item.name,
        'price': item.price,
        'imageurl': item.imageurl,
      }).toList();

      // Calculate the total price
      double total = cartItems.fold(0.0, (sum, item) => sum + item.price);

      // Store order in Firebase
      await orders.add({
        'items': items,
        'total': total,
        'timestamp': FieldValue.serverTimestamp(),
      });

      log("Order added to Firebase!");
    } catch (e) {
      log("Error adding order to Firebase: $e");
    }
  }
}
