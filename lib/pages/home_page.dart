import 'package:flutter/material.dart';
import 'package:qr_cricket/widgets/custom_navigatorbar.dart';
import 'package:qr_cricket/widgets/scanner_button.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Historial'),
        actions: [
          IconButton(
            onPressed: ()=>null, 
            icon: const Icon(Icons.delete_forever)
          )
        ],
      ),
      body: const Center(
        child: Text('Home Page'),
      ),
      bottomNavigationBar: CustomNavigatorBar(),
      floatingActionButton: ScannerButton(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}