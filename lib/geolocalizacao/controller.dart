import 'package:flutter/cupertino.dart';
import 'package:geolocator/geolocator.dart';

class GeolocalizacaoController extends ChangeNotifier {
  var lat = 0.0;
  var log = 0.0;
  String erro = '';

  Future<void> getPosicao() async {
    try {
      final postion = await _posicaoAtual();
      lat = postion.latitude;
      log = postion.longitude;
    } catch (e) {
      erro = "$e";
    } finally {
      notifyListeners();
    }
  }

  Future<Position> _posicaoAtual() async {
    LocationPermission permission;

    final bool ativado = await Geolocator.isLocationServiceEnabled();

    if (!ativado) {
      return Future.error("Os serviços de localização estão desativados");
    }

    permission = await Geolocator.checkPermission();

    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error("As permissões de localização foram negadas");
      }
    }

    if (permission == LocationPermission.deniedForever) {
      return Future.error(
          "As permissões de localização foram negadas permanentemente, não podemos solicitar permissão");
    }

    return await Geolocator.getCurrentPosition();
  }
}
