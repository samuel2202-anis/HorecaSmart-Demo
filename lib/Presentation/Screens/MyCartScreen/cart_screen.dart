import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../Data/Helpers/cart_provider.dart';
import '../../Widgets/coming_soon.dart';
import 'empty_cart_widget.dart';

class MyCartScreen extends StatelessWidget {
  const MyCartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final cartProvider = Provider.of<CartProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title:const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
             Text('My Cart', style: TextStyle(color: Colors.white)),
            SizedBox(width: 8),
              Icon(
          Icons.shopping_cart, color: Colors.white,
        ),
          ],
        ),
        backgroundColor: Theme.of(context).colorScheme.primary,
        centerTitle: true,
        
        elevation: 3,
      ),
      body:  cartProvider.cartItems.isEmpty?
      const EmptyCartWidget():
      Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: cartProvider.cartItems.length,
              itemBuilder: (context, index) {
                final cartItem = cartProvider.cartItems[index];
                return Card(
                  child: ListTile(
                    title: Text(cartItem.item.name),
                    subtitle: Text('Price: ${cartItem.item.price} LE'),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        IconButton(
                          icon: const Icon(Icons.remove),
                          onPressed: () {
                            Provider.of<CartProvider>(context, listen: false).decreaseQuantity(cartItem);
                          },
                        ),
                        Text('${cartItem.quantity}'),
                        IconButton(
                          icon: const Icon(Icons.add),
                          onPressed: () {
                            Provider.of<CartProvider>(context, listen: false).increaseQuantity(cartItem);
                          },
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
          Text('Total: ${cartProvider.totalPrice} LE'),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Theme.of(context).colorScheme.primary,
              ),
              onPressed: () {
                showDialog(
                context: context,
                builder: (BuildContext context) {
                  return const ComingSoonDialog(); 
                },
              );
              },
              child: const Text('Confirm Order',style: TextStyle(color: Colors.white),),
            ),
          ),
        ],
      ),
    );
  }

}