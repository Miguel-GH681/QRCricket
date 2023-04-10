import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/ui_provider.dart';

class CustomNavigatorBar extends StatelessWidget {
  const CustomNavigatorBar({super.key});

  @override
  Widget build(BuildContext context) {

    final uiProvider = Provider.of<UiProvider>(context);

    final currentIndex = uiProvider.selectedMenuOption;

    return BottomNavigationBar(
      onTap: (value) => uiProvider.updateSelectedMenuOption = value,
      currentIndex: currentIndex,
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