import 'package:flutter/material.dart';
import 'package:isar/isar.dart';
import 'package:lesson_5/database/database.dart';
import 'package:lesson_5/model/user.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    final usernameController = TextEditingController();
    final passwordController = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
        backgroundColor: Theme.of(context).colorScheme.primary,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: usernameController,
              decoration: InputDecoration(
                labelText: 'Username',
                labelStyle: TextStyle(
                  color: Theme.of(context).colorScheme.onBackground,
                ),
              ),
              cursorColor: Theme.of(context).colorScheme.primary,
            ),
            TextField(
              controller: passwordController,
              decoration: InputDecoration(
                labelText: 'Password',
                labelStyle: TextStyle(
                  color: Theme.of(context).colorScheme.onBackground,
                ),
              ),
              obscureText: true,
              cursorColor: Theme.of(context).colorScheme.primary,
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () async {
                final username = usernameController.text;
                final password = passwordController.text;

                final user = await isar.users
                    .filter()
                    .usernameEqualTo(username)
                    .passwordEqualTo(password)
                    .findFirst();

                if (user != null) {
                  Navigator.pushReplacementNamed(context, '/home');
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: const Text('Invalid credentials'),
                      backgroundColor: Theme.of(context).colorScheme.error,
                    ),
                  );
                }
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Theme.of(context).colorScheme.primary,
                foregroundColor: Theme.of(context).colorScheme.onPrimary,
              ),
              child: const Text('Login'),
            ),
            const SizedBox(height: 20),
            TextButton(
              onPressed: () {
                Navigator.pushNamed(context, '/signup');
              },
              style: TextButton.styleFrom(
                foregroundColor: Theme.of(context).colorScheme.secondary,
              ),
              child: const Text("Don't have an account? Sign Up"),
            ),
          ],
        ),
      ),
    );
  }
}
