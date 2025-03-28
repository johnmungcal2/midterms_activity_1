import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:lesson_5/model/car.dart';

class CartNotifier extends Notifier<Set> {
  @override
  Set build() {
    return {};
  }

  void addCar(Car car) {
    if (!state.contains(car)) {
      state = state.union({car});
    }
  }

  void removeCar(Car car) {
    if (state.contains(car)) {
      state = state.difference({car});
    }
  }
}

final cartNotifierProvider = NotifierProvider<CartNotifier, Set>(
  CartNotifier.new,
);

final cartTotalProvider = Provider<int>((ref) {
  final cartCars = ref.watch(cartNotifierProvider);
  int total = 0;
  for (Car car in cartCars) {
    total += car.rentalPrice; 
  }
  return total;
});