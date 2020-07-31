library flutter_hdwallet;

abstract class HDWallet {

  String privateKey;
  String publicKey;
  String address;
  String keystore;
  String mnemonic;

  String name();

  HDWallet fromRandom();

  HDWallet fromPrivateKey(String privateKey);

  HDWallet fromPublicKey(String publicKey);

  HDWallet fromAddress(String address);

  HDWallet fromMnemonic(String mnemonic, String path);

  HDWallet fromKeystore(String keystore, String password);

  String sign(String data);
}
