import 'package:horeca_smart/Data/Models/item_model.dart';

class CartItem {
  final Item item;
  int quantity;

  CartItem({required this.item, this.quantity = 1});
}
