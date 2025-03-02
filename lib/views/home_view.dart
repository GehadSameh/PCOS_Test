import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../viewmodels/auth_viewmodel.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    final authViewModel = Provider.of<AuthViewModel>(context);

    return Scaffold(
      appBar: AppBar(title: const Text("PCOS Classifier")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            authViewModel.user != null
                ? Column(
                    children: [
                      Text("Welcome, ${authViewModel.user!.email}"),
                      ElevatedButton(
                        onPressed: () => authViewModel.logout(),
                        child: const Text("Logout"),
                      ),
                    ],
                  )
                : Column(
                    children: [
                      ElevatedButton(
                        onPressed: () => Navigator.pushNamed(context, "/login"),
                        child: const Text("Login"),
                      ),
                      ElevatedButton(
                        onPressed: () => Navigator.pushNamed(context, "/register"),
                        child: const Text("Register"),
                      ),
                    ],
                  ),
          ],
        ),
      ),
    );
  }
}
