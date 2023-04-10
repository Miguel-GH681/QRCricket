import 'package:flutter/material.dart';

class CustomNavigatorBar extends StatelessWidget {
  const CustomNavigatorBar({super.key});

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.map),
          label: 'Mapas'
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.keyboard_double_arrow_right_rounded),
          label: 'Direcciones'
        ),
      ]
    );
  }
}