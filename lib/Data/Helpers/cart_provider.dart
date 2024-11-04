import 'package:flutter/material.dart';

import '../Models/cart_model.dart';
import '../Models/item_model.dart';



class CartProvider with ChangeNotifier {
  final List<CartItem> _cartItems = [];

  List<CartItem> get cartItems => _cartItems;

  void addItem(Item item) {
    final existingItem = _cartItems.firstWhere(
      (cartItem) => cartItem.item.name == item.name,
      orElse: () => CartItem(item: item, quantity: 0),
    );

    if (existingItem.quantity > 0) {
      existingItem.quantity++;
    } else {
      _cartItems.add(CartItem(item: item));
    }
    notifyListeners();
  }

  void increaseQuantity(CartItem cartItem) {
    cartItem.quantity++;
    notifyListeners();
  }

  void decreaseQuantity(CartItem cartItem) {
    if (cartItem.quantity > 1) {
      cartItem.quantity--;
    } else {
      _cartItems.remove(cartItem);
    }
    notifyListeners();
  }

  double get totalPrice {
    return _cartItems.fold(0, (total, cartItem) => total + (cartItem.item.price * cartItem.quantity));
  }
} 