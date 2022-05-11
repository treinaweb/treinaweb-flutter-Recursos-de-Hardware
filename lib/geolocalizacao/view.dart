import 'package:flutter/material.dart';
import 'package:hardware/components/drawer.dart';
import 'package:hardware/geolocalizacao/controller.dart';

class GeoLocalizacaoView extends StatelessWidget {
  GeoLocalizacaoView({Key? key}) : super(key: key);

  final controller = GeolocalizacaoController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      drawer: const CustomDrawer(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AnimatedBuilder(
              animation: controller,
              builder: (_, _child) {
                if (controller.erro != '') {
                  return Text(
                    controller.erro,
                    style: const TextStyle(fontSize: 30),
                  );
                }
                return Text(
                  "Lat: ${controller.lat} Long: ${controller.log}",
                  style: const TextStyle(fontSize: 30),
                );
              },
            ),
            OutlinedButton(
              onPressed: controller.getPosicao,
              child: const Text("Capturar"),
            )
          ],
        ),
      ),
    );
  }
}
