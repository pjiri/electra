import 'package:walletconnect_dart/walletconnect_dart.dart';
import 'package:url_launcher/url_launcher_string.dart';

class WalletConnectService {
  static Future<String?> connect() async {
    final connector = WalletConnect(
      bridge: 'https://bridge.walletconnect.org',
      clientMeta: const PeerMeta(
        name: 'Electra',
        description: 'Web3 Voting App',
        url: 'https://electra.app',
        icons: ['https://electra.app/icon.png'],
      ),
    );

    if (!connector.connected) {
      final session = await connector.createSession(onDisplayUri: (uri) async {
        await launchUrlString(uri, mode: LaunchMode.externalApplication);
      });
      return session.accounts.isNotEmpty ? session.accounts[0] : null;
    }

    return null;
  }
}
