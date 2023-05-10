import 'package:flutter/material.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:provider/provider.dart';
import 'package:qr_cricket/providers/scan_list_provider.dart';

class ScannerButton extends StatelessWidget {
  const ScannerButton({super.key});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      elevation: 0,
      onPressed: () async {
        //String barcodeScanRes = await FlutterBarcodeScanner.scanBarcode('#3D8BEF', 'Cancelar', false, ScanMode.QR);
        const barcodeScanResGeo = 'geo://www.mycompiler.io/view/FWRK46tyBVj';
        const barcodeScanResHttp = 'http://www.mycompiler.io/view/FWRK46tyBVj';
        final scanListProvider = Provider.of<ScanListProvider>(context, listen: false);
        scanListProvider.newScan(barcodeScanResGeo);
        scanListProvider.newScan(barcodeScanResHttp);

      },
      child: const Icon(Icons.filter_center_focus),
    );
  }
}