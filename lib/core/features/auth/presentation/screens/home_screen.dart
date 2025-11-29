import 'package:flutter/material.dart';

import '../../../../widgets/app_drawer.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: AppDrawer(), // الدروار فقط
      appBar: AppBar(
        title: const Text('Home'),
        backgroundColor: Colors.blueAccent,
      ),
      body: const Center(
        child: Text(
          'الصفحة الرئيسية',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
