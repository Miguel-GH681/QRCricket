import 'package:flutter/material.dart';
import 'package:qr_cricket/models/scan_model.dart';
import 'package:qr_cricket/providers/db_provider.dart';

class ScanListProvider extends ChangeNotifier{

  List<ScanModel> scans = [];
  String tipoSeleccionado = 'http';

  newScan( String valor ) async {
    final newScanModel = new ScanModel(valor: valor);
    final id = await DbProvider.db.newScan(newScanModel);
    newScanModel.id = id;
    if( tipoSeleccionado == newScanModel.tipo ){
      scans.add(newScanModel);
      notifyListeners();
    }
  }

  loadScans() async {
    final scans = await DbProvider.db.getScans();
    this.scans = [...scans];
    notifyListeners();
  }  

  loadScansByType(String tipo ) async {
    final scans = await DbProvider.db.getScansByType(tipo);
    this.scans = [...scans];
    tipoSeleccionado = tipo;
    notifyListeners();
  }

  deleteAll() async {
    await DbProvider.db.deleteScans();
    this.scans = [];
    notifyListeners();
  }
}