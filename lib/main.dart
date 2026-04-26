import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart'; 
import 'app_theme.dart';
import 'login_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  try {
    await Firebase.initializeApp();
    print("Firebase успешно запущен!");
  } catch (e) {
    print("Ошибка инициализации Firebase: $e");
  }

  runApp(const DoxDeliveryApp());
}

class DoxDeliveryApp extends StatelessWidget {
  const DoxDeliveryApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Dox Delivery',
      theme: AppTheme.darkTheme,
      home: const LoginScreen(), 
    );
  }
}