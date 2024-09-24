import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  // Define the exact color #25CB36
  static const Color primaryGreen = Color(0xFF25CB36);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background image with hand gestures (fully opaque)
          Image.asset(
            'assets/images/hand_background.png',
            fit: BoxFit.cover,
            width: double.infinity,
            height: double.infinity,
          ),
          SafeArea(
            child: Column(
              children: [
                // Title bar
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  color: const Color.fromARGB(255, 37, 203, 54),
                  child: const Text(
                    'BREAKING SILENCE',
                    style: TextStyle(
                      fontFamily: 'Kouten',
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: Column(
                      children: [
                        const SizedBox(height: 20),
                        // Logo
                        Container(
                          width: 150,
                          height: 150,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            gradient: const LinearGradient(
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                              colors: [Color(0xFF25CB36), Color(0xFFA860B4)],
                            ),
                            border: Border.all(
                              color: Colors.black,
                              width: 3,
                            ),
                          ),
                          child: Center(
                            child: Image.asset('assets/images/logo_hand.png', width: 100, height: 100),
                          ),
                        ),
                        const SizedBox(height: 40),
                        // Main Buttons
                        Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            _buildButton('TUTORIALS', () => Navigator.pushNamed(context, '/tutorial')),
                            const SizedBox(height: 20),
                            _buildButton('TEST', () => Navigator.pushNamed(context, '/test')),
                            const SizedBox(height: 20),
                            _buildButton('SETTINGS', () => Navigator.pushNamed(context, '/settings')),
                          ],
                        ),
                        const Spacer(),
                        // Exit Button
                        _buildButton('EXIT', () => Navigator.pop(context)),
                        const SizedBox(height: 40),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildButton(String text, VoidCallback onPressed) {
    return SizedBox(
      width: 150, // Approximately 60% of screen width for most devices
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color.fromARGB(255, 37, 203, 54).withOpacity(0.7), // Semi-transparent button background
          foregroundColor: Colors.black,
          padding: const EdgeInsets.symmetric(vertical: 15),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5),
            side: const BorderSide(color: Colors.black, width: 3),
          ),
        ),
        onPressed: onPressed,
        child: Text(
          text,
          style: const TextStyle(
            fontFamily: 'Kouten',
            fontSize: 25,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}