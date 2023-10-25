import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ImportExportDataSettingsPage extends StatelessWidget {
  const ImportExportDataSettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () => context.pop(),
              icon: const Icon(Icons.arrow_back_rounded))
        ],
        title: const Text('Import & Export data'),
      ),
      body: const Center(
        child: Text('Import Export data settings'),
      ),
    );
  }
}
