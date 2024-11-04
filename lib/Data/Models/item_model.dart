import 'package:cloud_firestore/cloud_firestore.dart';

// Define the Item model
class Item {
    final String name;
    final int discount;
    final String image;
    final double price;

    Item({required this.name, required this.discount, required this.image, required this.price});

    // Factory method to create an Item from Firestore document
    factory Item.fromFirestore(DocumentSnapshot doc) {
        Map data = doc.data() as Map;
        return Item(
            name: data['name'] ?? '',
            discount: data['discount'] ?? 0,
            image: data['image'] ?? '',
            price: data['price']?.toDouble() ?? 0.0,
        );
    }
}