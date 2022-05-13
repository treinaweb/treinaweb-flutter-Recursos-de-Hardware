import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:local_auth/local_auth.dart';

class TouchFaceIdController extends ChangeNotifier {
  final _auth = LocalAuthentication();
  String _authorized = "Não Autorizado";
  bool _isSupported = false;

  bool get isSupported => _isSupported;
  String get authorized => _authorized;

  Future<void> isDeviceSupported() async {
    _isSupported = await _auth.isDeviceSupported();
    notifyListeners();
  }

  Future<void> authentcate() async {
    if (!_isSupported) return;

    var authenticated = false;

    try {
      _authorized = "Autenticando...";
      notifyListeners();

      authenticated = await _auth.authenticate(
          localizedReason: "Deixe o SO determinar o método de autenticação",
          options: const AuthenticationOptions(
            useErrorDialogs: true,
            stickyAuth: true,
          ));
    } on PlatformException catch (e) {
      _authorized = "Erro - ${e.message}";
      notifyListeners();
      return;
    }

    _authorized = authenticated ? "Autorizado" : "Não autorizado";
    notifyListeners();
  }

  Future<void> authenticateWithBiometrics() async {
    if (!_isSupported) return;

    var authenticated = false;

    try {
      _authorized = "Autenticando...";
      notifyListeners();

      authenticated = await _auth.authenticate(
          localizedReason:
              "Digite sua impressão digital (ou rosto ou qualquer outra coisa) para autenticar",
          options: const AuthenticationOptions(
            useErrorDialogs: true,
            stickyAuth: true,
            biometricOnly: true,
          ));
    } on PlatformException catch (e) {
      _authorized = "Erro - ${e.message}";
      notifyListeners();
      return;
    }

    _authorized = authenticated ? "Autorizado" : "Não autorizado";
    notifyListeners();
  }
}
