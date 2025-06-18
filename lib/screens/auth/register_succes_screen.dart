import 'package:flutter/material.dart';

import '../../widgets/custom_loading.dart';
import 'login_screen.dart';

class RegisterSuccesScreen extends StatefulWidget {
  const RegisterSuccesScreen({super.key});

  @override
  State<RegisterSuccesScreen> createState() => _RegisterSuccesScreenState();
}

class _RegisterSuccesScreenState extends State<RegisterSuccesScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              const SizedBox(height: 40),
              // Logo centered at top
              Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("FLAW",
                        style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: Colors.black)),
                    Image.asset("assets/images/entypo_flower.png",
                        width: 24, height: 24),
                    Text("ESS",
                        style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: Colors.black))
                  ],
                ),
              ),

              const SizedBox(height: 60),

              // Green checkmark in circle
              Container(
                width: 80,
                height: 80,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: Colors.green,
                    width: 2.0,
                  ),
                ),
                child: const Center(
                  child: Icon(
                    Icons.check,
                    color: Colors.green,
                    size: 40,
                  ),
                ),
              ),

              const SizedBox(height: 25),

              // Success message heading
              const Text(
                "Registered successfully",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 20),

              // Description text
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 30.0),
                child: Text(
                  "The artist page has been successfully created. Please set up services and posts to reach customers.",
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.black87,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),

              // Spacer to push button to bottom
              const Spacer(),

              // Continue button at bottom
              SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                  onPressed: () {
                    loadingScreen(context, () => const LoginScreen());
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(
                        0xFFD3A5D3), // Purple color similar to the image
                    foregroundColor: Colors.black,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(4),
                    ),
                  ),
                  child: const Text(
                    "Continue",
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
