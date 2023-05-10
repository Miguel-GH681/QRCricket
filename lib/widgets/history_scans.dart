import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/scan_list_provider.dart';
import '../theme/custom_theme.dart';

class HistoryScans extends StatelessWidget {
  final String tipo;
  const HistoryScans({super.key, required this.tipo});

  @override
  Widget build(BuildContext context) {
    
    final scanListProvider = Provider.of<ScanListProvider>(context);
    final scans = scanListProvider.scans;

    return ListView.builder(
      itemCount: scans.length,
      itemBuilder: (_, i ){
        return Dismissible(
          onDismissed: (_)=> null,
          direction: DismissDirection.startToEnd,
          key: UniqueKey(),
          child: ListTile(
            leading: Icon(
              tipo == 'http' ? Icons.network_check_outlined
              : Icons.map_outlined,
              color: Colors.red
            ),
            title: Text(scans[i].valor),
            subtitle: Text(scans[i].id.toString()),
            trailing: Icon( Icons.keyboard_arrow_right, color: CustomTheme.primary ),
          ),
        );  
      }     
    );
  }
}