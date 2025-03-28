import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:lesson_5/pages/cartpage.dart';
import 'package:lesson_5/providers/cart_provider.dart';

class CartIcon extends ConsumerWidget {
  const CartIcon({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final numberOfCarsInCart = ref.watch(cartNotifierProvider).length;
    return Stack(
      children: [
        IconButton(
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return const Cartpage();
            }));
          },
          icon: Icon(
            Icons.car_rental,
            color: Theme.of(context).colorScheme.onSurface,
          ),
        ),
        if (numberOfCarsInCart > 0)
          Positioned(
            top: 5,
            right: 5,
            child: Container(
              width: 18,
              height: 18,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.error,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Text(
                '$numberOfCarsInCart',
                style: TextStyle(
                  color: Theme.of(context).colorScheme.onError,
                  fontSize: 12,
                ),
              ),
            ),
          ),
      ],
    );
  }
}
