import 'package:flutter_hdwallet/eos/key.dart';
import 'package:flutter_hdwallet/flutter_hdwallet.dart';
import 'package:flutter_hdwallet/bip39/bip39.dart' as bip39;

class EosHDWallet extends HDWallet {
  @override
  String name() {
    return "EOS";
  }

  @override
  HDWallet fromRandom() {
    String mnemonic = bip39.generateMnemonic();
    String seed = bip39.mnemonicToSeed(mnemonic).toString();
    EOSPrivateKey key = EOSPrivateKey.fromSeed(seed);
    this.mnemonic = mnemonic;
    this.privateKey = key.toString();
    this.publicKey = key.toEOSPublicKey().toString();
    return this;
  }

  @override
  EosHDWallet fromPrivateKey(String privateKey) {
    EOSPrivateKey key = EOSPrivateKey.fromString(privateKey);
    this.privateKey = privateKey;
    this.publicKey = key.toEOSPublicKey().toString();
    return this;
  }

  @override
  EosHDWallet fromPublicKey(String publicKey) {}

  @override
  EosHDWallet fromAddress(String address) {}

  @override
  EosHDWallet fromMnemonic(String mnemonic, String path) {
    String seed = bip39.mnemonicToSeed(mnemonic).toString();
    EOSPrivateKey key = EOSPrivateKey.fromSeed(seed);
    this.mnemonic = mnemonic;
    this.privateKey = key.toString();
    this.publicKey = key.toEOSPublicKey().toString();
  }

  @override
  EosHDWallet fromKeystore(String keystore, String password) {}

  @override
  String sign(String data) {
    if (this.privateKey == null || this.privateKey.length == 0) {}
    EOSPrivateKey key = EOSPrivateKey.fromString(privateKey);
    return key.signString(data).toString();
  }
}
