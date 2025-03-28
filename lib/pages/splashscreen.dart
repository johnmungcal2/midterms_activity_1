import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class Splashscreen extends HookConsumerWidget {
  const Splashscreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final opacity = useState(0.0);

    useEffect(() {
      Future.delayed(Duration(milliseconds: 500), () {
        opacity.value = 1.0;
        Future.delayed(Duration(seconds: 3), () {
          Navigator.pushReplacementNamed(context, '/login');
        });
      });
    }, const []);

    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.primary, 
      body: Center(
        child: AnimatedOpacity(
          opacity: opacity.value,
          duration: Duration(seconds: 1),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.directions_car,
                size: 100,
                color: Theme.of(context).colorScheme.onPrimary, 
              ),
              const SizedBox(height: 20),
              Text(
                "Car Rental App",
                style: TextStyle(
                  fontSize: 30,
                  color: Theme.of(context).colorScheme.onPrimary, 
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
