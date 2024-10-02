import 'dart:async';
import 'package:flutter/material.dart';
import 'package:htci/Pages/Home_page.dart';

void main() {
  runApp(const HTCIApp());
}

class HTCIApp extends StatelessWidget {
  const HTCIApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: LoginPage(),
      ),
    );
  }
}

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  int _currentPage = 0; // Track the current page index
  late Timer _timer; // Timer for auto-scroll

  final PageController _pageController = PageController();

  final List<Map<String, String>> carouselData = [
    {
      'image': 'image/hq.jpg', // Replace with your image asset
      'text': 'Experience divine convenience: Book temple pujas anytime, anywhere with HTCI APP.'
    },
    {
      'image': 'image/night.jpeg', // Another image asset
      'text': 'Offering your prayers has never been easier. Book your puja now!'
    },
    {
      'image': 'image/Htci.png', // Another image asset
      'text': 'Get blessings delivered to your home from anywhere in World.'
    }
  ];

  @override
  void initState() {
    super.initState();

    // Set up a timer for automatic page scrolling
    _timer = Timer.periodic(const Duration(seconds: 4), (Timer timer) {
      if (_currentPage < carouselData.length - 1) {
        _currentPage++;
      } else {
        _currentPage = 0;
      }
      _pageController.animateToPage(
        _currentPage,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeIn,
      );
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              flex: 3,
              child: PageView.builder(
                controller: _pageController,
                onPageChanged: (index) {
                  setState(() {
                    _currentPage = index;
                  });
                },
                itemCount: carouselData.length,
                itemBuilder: (context, index) {
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // Properly spaced Image and text
                      Image.asset(
                        carouselData[index]['image']!,
                        height: 350,
                        width: double.infinity,
                        fit: BoxFit.contain,
                      ),
                      Flexible(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20.0),
                          child: Text(
                            carouselData[index]['text']!,
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                              fontSize: 14,
                              color: Colors.black54,
                            ),
                          ),
                        ),
                      ),
                    ],
                  );
                },
              ),
            ),

            // Carousel Indicator (Dots)
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                carouselData.length,
                    (index) => buildDot(index, _currentPage),
              ),
            ),
            const SizedBox(height: 20),

            // Continue with Phone Number and Guest buttons
            Expanded(
              flex: 2,
              child: Column(
                children: [
                  ElevatedButton(
                    onPressed: () {
                      // Navigate to HomePage when the "Continue with Phone Number" button is pressed
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => HomePage()),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.orange, // Background color
                      padding: const EdgeInsets.symmetric(
                          vertical: 15, horizontal: 30),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                    child: const Text(
                      'CONTINUE WITH PHONE NUMBER',
                      style: TextStyle(fontSize: 16, color: Colors.white),
                    ),
                  ),
                  const SizedBox(height: 20),

                  // Continue as Guest Button
                  OutlinedButton(
                    onPressed: () {
                      // Navigate to HomePage when the "Continue as Guest" button is pressed
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => HomePage()),
                      );
                    },
                    style: OutlinedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(
                          vertical: 15, horizontal: 30),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                    child: Text(
                      'CONTINUE AS A GUEST',
                      style: TextStyle(
                          fontSize: 16, color: Colors.grey.shade800),
                    ),
                  ),
                  const Spacer(),
                  TextButton(
                    onPressed: () {
                      // Handle sign up
                    },
                    child: const Text(
                      "Don't have an account? Sign up",
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.orange,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Build the carousel dot indicator
  Widget buildDot(int index, int currentPage) {
    return Container(
      margin: const EdgeInsets.only(right: 5),
      height: 8,
      width: _currentPage == index ? 25 : 8, // Enlarged if selected
      decoration: BoxDecoration(
        color: _currentPage == index ? Colors.orange : Colors.grey,
        borderRadius: BorderRadius.circular(20),
      ),
    );
  }
}
