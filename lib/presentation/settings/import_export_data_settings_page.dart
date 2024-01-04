import 'package:flutter/material.dart';

class ImportExportDataSettingsPage extends StatelessWidget {
  const ImportExportDataSettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Import & Export data'),
      ),
      body: const Center(
        child: Text('Import Export data settings'),
      ),
    );
  }
}
