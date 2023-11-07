import 'dart:convert';

import 'package:crypto/crypto.dart';

const String baseUrl = "https://gateway.marvel.com:443";
const String publicKey = "b45b747aa9c1af2df26e1c7b9a45b75a";
const String privateKey = "c743b1553007178fe8bfeb3bc362c2250c0e21cc";
const String timeStamp = "1";

String _hash() {
  const String input = '$timeStamp$privateKey$publicKey';
  return md5.convert(utf8.encode(input)).toString();
}

class BaseUrl {
  static const Map<String, String> headers = {
    "Content-Type": "application/json"
  };

  static String getUrl(String url) =>
      '$baseUrl$url?ts=$timeStamp&apikey=$publicKey&hash=${_hash()}&limit=100';
}
