import 'package:flutter/material.dart';
import '../services/wallet_connect_service.dart';

class WalletConnectScreen extends StatefulWidget {
  const WalletConnectScreen({super.key});

  @override
  State<WalletConnectScreen> createState() => _WalletConnectScreenState();
}

class _WalletConnectScreenState extends State<WalletConnectScreen> {
  String _walletAddress = '';

  Future<void> _connectWallet() async {
    final address = await WalletConnectService.connect();
    setState(() {
      _walletAddress = address ?? 'Connection failed';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Electra - Connect Wallet')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: _connectWallet,
              child: const Text('Connect Wallet'),
            ),
            const SizedBox(height: 20),
            Text(_walletAddress),
          ],
        ),
      ),
    );
  }
}
