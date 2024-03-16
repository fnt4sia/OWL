import 'package:flutter/material.dart';
import 'routes/routes.dart';
import '../../shared/widgets/navbar.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => MainPageState();
}

class MainPageState extends State<MainPage> {
  int _selectedIndex = 0;

  void _onChangeIndex(int newIndex) {
    setState(() {
      _selectedIndex = newIndex;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(238, 249, 253, 1),
      body: SafeArea(child: MainRoute.mainRoute[_selectedIndex]),
      bottomNavigationBar: Navbar(
        selectedIndex: _selectedIndex,
        onChangeIndex: _onChangeIndex,
      ),
    );
  }
}
