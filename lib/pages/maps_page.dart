import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qr_cricket/theme/custom_theme.dart';
import 'package:qr_cricket/widgets/history_scans.dart';

import '../providers/scan_list_provider.dart';

class MapsPage extends StatelessWidget {
  const MapsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return HistoryScans(tipo: 'geo');
  }
}