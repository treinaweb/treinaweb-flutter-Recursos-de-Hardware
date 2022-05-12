import 'package:flutter/material.dart';
import 'package:hardware/camera/view.dart';
import 'package:hardware/face_touch_id/view.dart';
import 'package:hardware/geolocalizacao/view.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pushReplacement(MaterialPageRoute(
                builder: (ctx) => GeoLocalizacaoView(),
              ));
            },
            child: const Text('Geolocalização'),
          ),
          TextButton(
            onPressed: () {
              Navigator.of(context).pushReplacement(MaterialPageRoute(
                builder: (ctx) => CameraView(),
              ));
            },
            child: const Text('Câmera'),
          ),
          TextButton(
            onPressed: () {
              Navigator.of(context).pushReplacement(MaterialPageRoute(
                builder: (ctx) => const TouchFaceIDView(),
              ));
            },
            child: const Text('Touch Face ID'),
          )
        ],
      ),
    );
  }
}
