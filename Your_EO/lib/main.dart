import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:your_eo/pages/login.dart';
import 'package:your_eo/pages/signup.dart';
import 'package:your_eo/pages/home.dart';
import 'package:your_eo/pages/kategori.dart';
import 'package:your_eo/pages/favorite.dart';
import 'package:your_eo/pages/booking_saya.dart';
import 'package:your_eo/components/favorite_model.dart';
import 'package:your_eo/components/navbar.dart';
import 'package:your_eo/components/drawer.dart';
import 'package:your_eo/theme/theme.dart';
import 'package:your_eo/theme/util.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (_) => FavoriteModel(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int _currentIndex = 0;

  final List<Widget> _pages = [
    HomePage(),
    KategoriPage(),
    FavoritePage(),
    BookingSayaPage(),
  ];

  @override
  Widget build(BuildContext context) {
    final brightness = View.of(context).platformDispatcher.platformBrightness;
    TextTheme textTheme = createTextTheme(context, "Poppins", "PT Sans");
    MaterialTheme theme = MaterialTheme(textTheme);

    return MaterialApp(
      title: 'YourEO',
      debugShowCheckedModeBanner: false,
      theme: brightness == Brightness.light ? theme.light() : theme.dark(),

      initialRoute: '/login',
      routes: {
        '/login': (context) => const LoginPage(),
        '/signup': (context) => const SignupPage(),
        '/home': (context) => buildMainScaffold(),
        '/kategori': (context) => KategoriPage(),
        '/favorite': (context) => FavoritePage(),
        '/booking_saya': (context) => BookingSayaPage(),
      },
    );
  }

  Widget buildMainScaffold() {
    return Scaffold(
      appBar: AppBar(
        title: Image.asset('assets/logo2.png', height: 40),
        centerTitle: true,
      ),
      drawer: DrawerMenu(
        onSelectPage: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
      body: _pages[_currentIndex],
      bottomNavigationBar: BottomNavbar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
    );
  }
}
