import 'package:flutter/material.dart';

class UiProvider extends ChangeNotifier{
  int _selectedMenuOption = 1;

  int get selectedMenuOption {
    return _selectedMenuOption;
  }

  set updateSelectedMenuOption( int i ) {
    _selectedMenuOption = i;
    notifyListeners();
  }
}