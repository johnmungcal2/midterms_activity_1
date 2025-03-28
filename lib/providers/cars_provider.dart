import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:lesson_5/model/car.dart';

List allCars = [
  Car(
    id: "1",
    title: "Toyota Yaris Sedan",
    rentalPrice: 1644,
    category: "Sedan",
    imageUrl: "https://i.imgur.com/iCrdT15.jpeg",
  ),
  Car(
    id: "2",
    title: "Hyundai Accent",
    rentalPrice: 1268,
    category: "Sedan",
    imageUrl: "https://i.imgur.com/5gYobez.jpeg",
  ),
  Car(
    id: "3",
    title: "Nissan Sentra",
    rentalPrice: 1837,
    category: "Sedan",
    imageUrl: "https://i.imgur.com/T38iftP.jpeg",
  ),
  Car(
    id: "4",
    title: "Suzuki Jimny",
    rentalPrice: 3419,
    category: "SUV",
    imageUrl: "https://i.imgur.com/9kO2All.jpeg",
  ),
  Car(
    id: "4",
    title: "Toyota Fortuner",
    rentalPrice: 6854,
    category: "SUV",
    imageUrl: "https://i.imgur.com/FTLKBwH.jpeg",
  ),
  Car(
    id: "4",
    title: "Ford Ecosport",
    rentalPrice: 2506,
    category: "SUV",
    imageUrl: "https://i.imgur.com/OEtUJsG.jpeg",
  ),
  Car(
    id: "4",
    title: "Hyundai Tucson",
    rentalPrice: 2603,
    category: "SUV",
    imageUrl: "https://i.imgur.com/nJeZAEi.jpeg",
  ),
  Car(
    id: "4",
    title: "Toyota Innova",
    rentalPrice: 2522,
    category: "MPV",
    imageUrl: "https://i.imgur.com/g489zZp.jpeg",
  ),
  Car(
    id: "4",
    title: "Toyota Hilux",
    rentalPrice: 2394,
    category: "Truck",
    imageUrl: "https://i.imgur.com/AfFCWE4.jpeg",
  ),
];

final carsProvider = Provider<List>((ref) {
  return allCars;
});
