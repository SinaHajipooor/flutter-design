import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class BottomTabs extends StatefulWidget {
  const BottomTabs({super.key});

  @override
  State<BottomTabs> createState() => _BottomTabsState();
}

class _BottomTabsState extends State<BottomTabs> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Container(
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
          child: GNav(
            backgroundColor: Colors.white,
            activeColor: Colors.purple,
            tabBackgroundColor: Colors.purple[100]!,
            padding: const EdgeInsets.all(15),
            onTabChange: (index) {},
            gap: 2,
            tabs: const [
              GButton(
                icon: Icons.person,
                text: 'پروفایل',
              ),
              GButton(icon: Icons.home, text: 'محصولات'),
              GButton(icon: Icons.favorite_border, text: 'علاقه‌مندی‌ها'),
              GButton(icon: Icons.production_quantity_limits, text: 'سبد خرید'),
            ],
          ),
        ),
      ),
    );
  }
}
