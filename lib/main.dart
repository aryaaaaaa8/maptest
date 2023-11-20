import 'package:flutter/material.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

import 'wgt_map_station_selector.dart';
import 'wgt_smrt_logo.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: "Test",
      home: TestPage(),
    );
  }
}

class TestPage extends StatelessWidget {
  const TestPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Test")),
      body: Container(
        child: Center(
          child: WgtMrtLogo(
            width: 45,
            onTap: () {
              showBarModalBottomSheet(
                expand: false,
                isDismissible: true,
                context: context,
                backgroundColor: Theme.of(context).colorScheme.background,
                builder: (context) => const WgtMapStationSelector(),
                enableDrag: true,
              );
            },
          ),
        ),
      ),
    );
  }
}
