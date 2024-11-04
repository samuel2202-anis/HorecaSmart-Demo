import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../Data/Helpers/cart_provider.dart';

class Header extends StatelessWidget {
  final String name;
  final Function(int) onNavigate;

  const Header({super.key, required this.name, required this.onNavigate});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'Welcome Back, $name!',
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          Stack(
            children: [
              IconButton(
                icon: const Icon(Icons.shopping_cart),
                onPressed: () {
                  onNavigate(2);
                },
              ),
              Positioned(
                right: 0,
                child: Consumer<CartProvider>(
                  builder: (context, cartProvider, child) {
                    return cartProvider.cartItems.isEmpty
                        ? const Text('')
                        : Container(
                            padding: const EdgeInsets.all(2),
                            decoration: BoxDecoration(
                              color: Colors.red,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            constraints: const BoxConstraints(
                              minWidth: 16,
                              minHeight: 16,
                            ),
                            child: Text(
                              '${cartProvider.cartItems.length}',
                              style: const TextStyle(color: Colors.white, fontSize: 12),
                              textAlign: TextAlign.center,
                            ),
                          );
                  },
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
