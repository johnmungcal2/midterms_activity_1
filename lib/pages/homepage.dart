import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:lesson_5/component/cart_icon.dart';
import 'package:lesson_5/providers/cars_provider.dart';
import 'package:lesson_5/providers/cart_provider.dart';

class HomePage extends HookConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final carCategories = ["All", "Sedan", "SUV", "MPV", "Truck"];
    final selectedCategory = useState('All');
    final allCars = ref.watch(carsProvider);
    final filteredCars = selectedCategory.value == "All"
        ? allCars
        : allCars
            .where((car) => car.category == selectedCategory.value)
            .toList();

    final cartCars = ref.watch(cartNotifierProvider);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primary,
        title: Text(
          'Available Cars',
          style: TextStyle(color: Theme.of(context).colorScheme.onPrimary),
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back), 
          onPressed: () {
            Navigator.pushReplacementNamed(
                context, '/login'); 
          },
        ),
        actions: [
          DropdownButton(
            value: selectedCategory.value,
            dropdownColor: Theme.of(context).colorScheme.primaryContainer,
            items: carCategories.map((value) {
              return DropdownMenuItem(
                value: value,
                child: Text(value),
              );
            }).toList(),
            onChanged: (String? newValue) {
              selectedCategory.value = newValue!;
            },
          ),
          CartIcon(),
        ],
      ),
      body: Container(
        padding: EdgeInsets.all(20),
        child: ListView.builder(
          itemCount: filteredCars.length,
          itemBuilder: (context, index) {
            return Container(
              padding: EdgeInsets.all(20),
              margin: EdgeInsets.only(bottom: 20),
              color: Theme.of(context).colorScheme.secondaryContainer,
              child: Row(
                children: [
                  Image.network(
                    filteredCars[index].imageUrl,
                    width: 80,
                    height: 80,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) {
                      return Icon(Icons.error, size: 80);
                    },
                  ),
                  SizedBox(width: 10),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          filteredCars[index].title,
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        Text("₱${filteredCars[index].rentalPrice} /day"),
                      ],
                    ),
                  ),
                  if (cartCars.contains(filteredCars[index]))
                    TextButton(
                      onPressed: () {
                        ref
                            .read(cartNotifierProvider.notifier)
                            .removeCar(filteredCars[index]);
                      },
                      style: TextButton.styleFrom(
                        foregroundColor: Theme.of(context).colorScheme.error,
                      ),
                      child: Text("Cancel Rental"),
                    ),
                  if (!cartCars.contains(filteredCars[index]))
                    TextButton(
                      onPressed: () {
                        ref
                            .read(cartNotifierProvider.notifier)
                            .addCar(filteredCars[index]);
                      },
                      style: TextButton.styleFrom(
                        foregroundColor: Theme.of(context).colorScheme.primary,
                      ),
                      child: Text("Rent Car"),
                    ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
