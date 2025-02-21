import 'package:flutter/material.dart';
import 'dart:async';

import '../auth/loginpage.dart'; // Update with the correct path to LoginPage

class Landingpage extends StatefulWidget {
  const Landingpage({super.key});

  @override
  _LandingpageState createState() => _LandingpageState();
}

class _LandingpageState extends State<Landingpage> {
  double _scale = 1.0; // Initial scale for animation

  @override
  void initState() {
    super.initState();
    // Start animation and navigate after 2 seconds
    Future.delayed(const Duration(milliseconds: 1500), () {
      setState(() {
        _scale = 0.0; // Zoom-out effect
      });
    });

    Future.delayed(const Duration(seconds: 2), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const LoginPage()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background gradient
          Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Color(0xFF000000), // Light green (top)
                  Color(0xFF252323), // White (bottom)
                ],
              ),
            ),
          ),
          // Animated Welcome Text
          Center(
            child: AnimatedScale(
              scale: _scale,
              duration: const Duration(milliseconds: 500), // Smooth zoom-out
              curve: Curves.easeOut,
              child: const Text(
                'Welcome to QuickPass!',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
