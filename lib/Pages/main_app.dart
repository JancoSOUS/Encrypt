import 'package:flutter/material.dart';
import 'package:flutter_application_1/Service/encryption.dart';
import 'package:flutter_application_1/widgets/snackbar.dart';
import 'package:flutter_application_1/widgets/text_field.dart';

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
  final messangerKey = GlobalKey<ScaffoldMessengerState>();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
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
              ),
              MyTextField(
                labelText: "Enter encryption password here",
                obscureText: true,
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
                obscureText: true,
                controller: controllerPasswordDecrypt,
              ),
              ElevatedButton(
                onPressed: () {
                  showSnackBar(
                      messangerKey,
                      Encryption().decrypt64(controllerMessageDecrypt.text,
                          controllerPasswordDecrypt.text));
                },
                child: const Text("Decrypt"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
