import 'package:flutter/material.dart';
import 'package:encryption/Service/encryption.dart';
import 'package:encryption/widgets/snackbar.dart';
import 'package:encryption/widgets/text_field.dart';

String decrypted = "";

class MainApp extends StatefulWidget {
  const MainApp({Key? key}) : super(key: key);

  @override
  _MainAppState createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  TextEditingController controllerMessageEncrypt = TextEditingController();
  TextEditingController controllerPasswordEncrypt = TextEditingController();
  TextEditingController controllerMessageDecrypt = TextEditingController();
  TextEditingController controllerPasswordDecrypt = TextEditingController();
  TextEditingController controllerPasswordDecrypted = TextEditingController();
  final messangerKey = GlobalKey<ScaffoldMessengerState>();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Encryption',
      scaffoldMessengerKey: messangerKey,
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.black,
        body: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              MyTextField(
                labelText: "Enter message to encrypt here",
                controller: controllerMessageEncrypt,
                autofocus: true,
              ),
              MyTextField(
                labelText: "Enter encryption password here",
                controller: controllerPasswordEncrypt,
              ),
              ElevatedButton(
                onPressed: () {
                  controllerMessageDecrypt.text = Encryption().encrypt64(
                      controllerMessageEncrypt.text,
                      controllerPasswordEncrypt.text);
                },
                child: const Text("Encrypt"),
              ),
              MyTextField(
                labelText: "Enter message to decrypt here",
                controller: controllerMessageDecrypt,
              ),
              MyTextField(
                labelText: "Enter decryption password here",
                controller: controllerPasswordDecrypt,
              ),
              ElevatedButton(
                onPressed: () {
                  decrypted = Encryption().decrypt64(
                      controllerMessageDecrypt.text,
                      controllerPasswordDecrypt.text);
                  showSnackBar(messangerKey, decrypted);
                  setState(() {
                    controllerPasswordDecrypted.text = decrypted;
                  });
                },
                child: const Text("Decrypt"),
              ),
              MyTextField(
                  controller: controllerPasswordDecrypted,
                  labelText: "Decrypted message"),
            ],
          ),
        ),
      ),
    );
  }
}
