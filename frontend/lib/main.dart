import 'package:flutter/material.dart';
import 'screens/login_screen.dart';
import 'screens/registration_screen.dart';
import 'screens/home_screen.dart';
import 'screens/portfolio_screen.dart';
import 'screens/scholarship_screen.dart';
import 'screens/university_matches_screen.dart';
// import 'package:provider/provider.dart'; // If you decide to use Provider

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Udhann App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        fontFamily:
            'Inter', // Ensure Inter font is correctly added to pubspec.yaml and assets
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      initialRoute: '/register', // Start with registration
      routes: {
        '/register': (context) => RegistrationScreen(),
        '/login': (context) => LoginScreen(),
        '/home': (context) => HomeScreen(),
        '/portfolio': (context) => PortfolioScreen(),
        '/scholarships': (context) => ScholarshipsScreen(),
        '/university_matches': (context) => UniversityMatchesScreen(),
      },
    );
  }
}
