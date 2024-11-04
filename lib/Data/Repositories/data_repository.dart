import 'package:cloud_firestore/cloud_firestore.dart';

import '../Models/item_model.dart';

class DataRepository {
    final FirebaseFirestore _firestore = FirebaseFirestore.instance;

    Future<List<Item>> fetchItems(String collectionName) async {
        QuerySnapshot snapshot = await _firestore.collection(collectionName).get();
        return snapshot.docs.map((doc) => Item.fromFirestore(doc)).toList();
    }
}