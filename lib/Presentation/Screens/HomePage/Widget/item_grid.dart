import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../BussinessLogic/ApiBloc/api_state.dart';
import '../../../../Data/Helpers/cart_provider.dart';
import '../../../Widgets/shimmer_loading.dart';


class ItemGrid extends StatelessWidget {
  final ApiState state;
  final double height;

  const ItemGrid({super.key, required this.state, required this.height});

  @override
  Widget build(BuildContext context) {
    if (state is ApiLoading) {
      return const ShimmerLoading();
    } else if (state is ApiLoaded) {
      final items = (state as ApiLoaded).items;
      return SizedBox(
        height: height * 0.6,
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 0.8,
          ),
          itemCount: items.length,
          itemBuilder: (context, index) {
            final item = items[index];
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Card(
                color: Colors.white,
                elevation: 5,
                child: Column(
                  children: [
                    SizedBox(
                      height: height * 0.114,
                      child: Image.network(item.image, fit: BoxFit.cover),
                    ),
                    Text(item.name),
                    Text('Price: ${item.price} LE'),
                    Text('${item.discount}% off'),
                    SizedBox(height: height * 0.01),
                    InkWell(
                      onTap: () {
                       Provider.of<CartProvider>(context, listen: false)
                                        .addItem(item);
                      },
                      child: Container(
                        width: double.infinity,
                        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                        decoration: BoxDecoration(
                          color: Theme.of(context).primaryColor,
                          borderRadius: const BorderRadius.vertical(
                            bottom: Radius.circular(20),
                          ),
                        ),
                        child: const Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Center(
                            child: Text(
                              'Add to Cart',
                              style: TextStyle(fontSize: 12, color: Colors.white),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      );
    } else if (state is ApiError) {
      return Center(child: Text('Error: ${(state as ApiError).message}'));
    }
    return const Center(child: Text('No items found.'));
  }
}
