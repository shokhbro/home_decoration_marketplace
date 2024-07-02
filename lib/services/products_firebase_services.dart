import 'package:cloud_firestore/cloud_firestore.dart';

class ProductsFirebaseServices {
  final CollectionReference productCollection =
      FirebaseFirestore.instance.collection('products');

  Stream<QuerySnapshot> getProducts() {
    return productCollection.snapshots();
  }

  Future<void> addProduct(Map<String, dynamic> productData) async {
    try {
      await productCollection.add(productData);
    } catch (e) {
      print('Error adding product: $e');
    }
  }
}
