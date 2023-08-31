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
      bottomNavigationBar: GNav(
        tabs: const [
          GButton(icon: Icons.home, text: 'لیست محصولات'),
          GButton(icon: Icons.person, text: 'پروفایل'),
          GButton(icon: Icons.favorite_border, text: 'علاقه‌مندی‌ها'),
          GButton(icon: Icons.production_quantity_limits, text: 'محصولات ویژه'),
        ],
      ),
    );
  }
}
