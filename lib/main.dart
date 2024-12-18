import 'package:clubkompass/features/blog/addPost/add_post_screen.dart';
import 'package:clubkompass/features/login/logic/user_provider.dart';
import 'package:clubkompass/features/login/registration_screen.dart';
import 'package:clubkompass/firebase_options.dart';
import 'package:clubkompass/landing_screen.dart';
import 'package:clubkompass/navigation.dart';
import 'package:clubkompass/theme/theme.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => UserProvider()),
      ],
      child: const MainApp(),
    ),
  );
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  ThemeMode themeMode = ThemeMode.system;
  bool _isDarkMode = true;

  void toggleTheme() {
    _isDarkMode = !_isDarkMode;
    setState(() {
      if (_isDarkMode) {
        themeMode = ThemeMode.dark;
      } else {
        themeMode = ThemeMode.light;
      }
    });
  }

  final router = {
    '/': (context) => const LandingScreen(),
    '/register': (context) => const RegistrationScreen(),
    '/navigation': (context) => const Navigation(),
    '/add_post': (context) => const AddPostScreen()
  };

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: router,
      themeMode: themeMode,
      theme: GlobalThemeData.lightThemeData,
      darkTheme: GlobalThemeData.darkThemeData,
      //home: const LandingScreen()
    );
  }
}
