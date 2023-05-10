import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qr_cricket/providers/scan_list_provider.dart';
import 'package:qr_cricket/theme/custom_theme.dart';

import '../widgets/history_scans.dart';

class AdressesPage extends StatelessWidget {
  const AdressesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return HistoryScans(tipo: 'http');
  }
}