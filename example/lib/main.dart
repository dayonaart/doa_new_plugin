import 'package:doa/doa.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  MyApp({super.key});
  final doa = Doa();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Center(
          child: ElevatedButton(
              onPressed: () async {
                await doa.runDoa(context, callback: (p0) {
                  print(p0);
                });
              },
              child: const Text("OPEN DOA"))),
    ));
  }
}
