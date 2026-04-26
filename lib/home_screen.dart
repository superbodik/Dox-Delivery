import 'package:flutter/material.dart';
import 'app_theme.dart';
import 'restaurant_card.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('DOX DELIVERY', style: TextStyle(letterSpacing: 3)),
      ),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: const [
          Text('Выбирай лучшее ⚡', 
            style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold)),
          SizedBox(height: 20),
          RestaurantCard(name: 'Cyber Burger', time: '15-20 мин'),
          RestaurantCard(name: 'Neon Sushi', time: '30-40 мин'),
          RestaurantCard(name: 'Electric Pizza', time: '10-15 мин'),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed, 
        
        backgroundColor: AppTheme.background,
        selectedItemColor: AppTheme.accent,
        unselectedItemColor: Colors.white24,
        
        showSelectedLabels: true, 
        showUnselectedLabels: true,

        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.explore), label: 'Обзор'),
          BottomNavigationBarItem(icon: Icon(Icons.shopping_cart), label: 'Корзина'),
          BottomNavigationBarItem(icon: Icon(Icons.person_outline), label: 'Профиль'),
        ],
      ),
    );
  }
}