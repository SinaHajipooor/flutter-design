import 'package:flutter/material.dart';
import 'package:testui/navigation/bottomTabs/bottom_tabs.dart';

class HomeScreen extends StatelessWidget {
  static const routeName = '/home-screen';
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const BottomTabs();
  }
}
