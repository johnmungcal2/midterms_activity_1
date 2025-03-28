import 'package:flutter/material.dart';
import 'package:lesson_5/model/user.dart';
import 'package:lesson_5/database/database.dart';

class SignupPage extends StatelessWidget {
  const SignupPage({super.key});

  @override
  Widget build(BuildContext context) {
    final usernameController = TextEditingController();
    final passwordController = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Signup'),
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
                  color: Theme.of(context).colorScheme.onSurface,
                ),
              ),
              cursorColor: Theme.of(context).colorScheme.primary,
            ),
            TextField(
              controller: passwordController,
              decoration: InputDecoration(
                labelText: 'Password',
                labelStyle: TextStyle(
                  color: Theme.of(context).colorScheme.onSurface,
                ),
              ),
              obscureText: true,
              cursorColor: Theme.of(context).colorScheme.primary,
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () async {
                final user = User()
                  ..username = usernameController.text
                  ..password = passwordController.text;

                await isar.writeTxn(() async {
                  await isar.users.put(user);
                });

                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: const Text('Account created!'),
                    backgroundColor: Theme.of(context).colorScheme.secondary,
                  ),
                );

                Navigator.pushReplacementNamed(context, '/login');
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Theme.of(context).colorScheme.primary,
                foregroundColor: Theme.of(context).colorScheme.onPrimary,
              ),
              child: const Text('Signup'),
            ),
          ],
        ),
      ),
    );
  }
}
