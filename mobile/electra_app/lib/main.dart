import 'package:flutter/material.dart';
import 'screens/wallet_connect_screen.dart';

void main() {
  runApp(const ElectraApp());
}

class ElectraApp extends StatelessWidget {
  const ElectraApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Electra',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const WalletConnectScreen(),
    );
  }
}
