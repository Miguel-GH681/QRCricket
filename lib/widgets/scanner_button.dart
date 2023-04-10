import 'package:flutter/material.dart';

class ScannerButton extends StatelessWidget {
  const ScannerButton({super.key});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      elevation: 0,
      onPressed: ()=> null,
      child: const Icon(Icons.filter_center_focus),
    );
  }
}