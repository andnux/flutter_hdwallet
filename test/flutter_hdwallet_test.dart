import 'package:flutter_hdwallet/eos/eos_hdwallet.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('adds one to input values', () {
    EosHDWallet wallet = EosHDWallet();
    wallet.fromRandom();
    print(wallet.mnemonic);
    print(wallet.privateKey);
    print(wallet.publicKey);
  });
}
