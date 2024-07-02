import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:home_decoration_marketplace/services/products_firebase_services.dart';

class ProductController extends ChangeNotifier {
  final firebaseConroller = ProductsFirebaseServices();

  Stream<QuerySnapshot> get list {
    return firebaseConroller.getProducts();
  }
}
