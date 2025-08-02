
import 'package:flutter/material.dart';
import 'screens/login_screen.dart';
import 'screens/registration_screen.dart';
import 'screens/home_screen.dart';
import 'screens/portfolio_screen.dart';
import 'screens/scholarship_screen.dart';
import 'screens/university_matches_screen.dart';
import 'utils/global_state.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await userManager.init(); // Initialize userManager to load token
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
        fontFamily: 'Inter',
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      initialRoute: userManager.token.isNotEmpty ? '/home' : '/register',
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
