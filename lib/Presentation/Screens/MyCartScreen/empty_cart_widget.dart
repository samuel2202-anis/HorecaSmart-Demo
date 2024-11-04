import 'package:flutter/material.dart';

class EmptyCartWidget extends StatelessWidget {
  const EmptyCartWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
           Center(child: Icon(Icons.remove_shopping_cart,size: 100,color: Theme.of(context).colorScheme.primary,)),
          const SizedBox(height: 20),
           Center(child: Text('Your cart is empty \n Please add items',style: TextStyle(fontSize: 20,color: Theme.of(context).colorScheme.primary),)),
        ],
      );
  }
}