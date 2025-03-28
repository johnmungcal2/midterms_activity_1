import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:lesson_5/providers/cart_provider.dart';

class Cartpage extends ConsumerWidget {
  const Cartpage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final cartCars = ref.watch(cartNotifierProvider).toList();
    final total = ref.watch(cartTotalProvider);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primary,
        title: Text(
          'Your Rentals',
          style: TextStyle(color: Theme.of(context).colorScheme.onPrimary),
        ),
        centerTitle: true,
      ),
      body: Container(
        padding: EdgeInsets.all(30),
        child: Column(
          children: [
            Column(
              children: cartCars.map((car) {
                return Row(
                  children: [
                    Text(
                      "${car.title}",
                      style: TextStyle(
                          color: Theme.of(context).colorScheme.onSurface),
                    ),
                    Expanded(child: SizedBox()),
                    Text(
                      "₱${car.rentalPrice} /day",
                      style: TextStyle(
                          color: Theme.of(context).colorScheme.onSurface),
                    ),
                  ],
                );
              }).toList(),
            ),
            SizedBox(height: 30),
            Center(
              child: Text(
                "Total Rental Cost: ₱$total",
                style:
                    TextStyle(color: Theme.of(context).colorScheme.onSurface),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
