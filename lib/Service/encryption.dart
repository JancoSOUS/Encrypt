import 'dart:convert';
import 'package:crypto/crypto.dart';
import 'package:encrypt/encrypt.dart';

class Encryption {
  final iv = IV.fromLength(16);

  String decrypt64(String data, String password) {
    final key = Key.fromUtf8(md5.convert(utf8.encode(password)).toString());
    final encrypter = Encrypter(AES(key));
    String decrypted;

    try {
      decrypted = encrypter.decrypt64(data, iv: iv);
    } catch (e) {
      decrypted = e.toString();
    }

    return decrypted;
  }

  String encrypt64(String data, String password) {
    final key = Key.fromUtf8(md5.convert(utf8.encode(password)).toString());
    final encrypter = Encrypter(AES(key));
    final encrypted = encrypter.encrypt(data, iv: iv).base64;

    return encrypted;
  }
}
