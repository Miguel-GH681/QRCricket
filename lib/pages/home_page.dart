import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qr_cricket/models/scan_model.dart';
import 'package:qr_cricket/pages/adresses_page.dart';
import 'package:qr_cricket/pages/maps_page.dart';
import 'package:qr_cricket/providers/db_provider.dart';
import 'package:qr_cricket/providers/ui_provider.dart';
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
      body: const _HomePageBody(),
      bottomNavigationBar: CustomNavigatorBar(),
      floatingActionButton: ScannerButton(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}

class _HomePageBody extends StatelessWidget {
  const _HomePageBody({super.key});

  @override
  Widget build(BuildContext context) {

    final uiProvider = Provider.of<UiProvider>(context);

    final currentIndex = uiProvider.selectedMenuOption;

    // final tempScan = new ScanModel(valor: 'http://localhost');
    // DbProvider.db.getScanById(2).then((scan)=> print(scan.valor));

    switch (currentIndex) {
      case 0:
        return MapsPage();

      case 1:
        return AdressesPage();

      default:
        return MapsPage();
    }
  }
}