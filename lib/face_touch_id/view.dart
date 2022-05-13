import 'package:flutter/material.dart';
import 'package:hardware/components/drawer.dart';
import 'package:hardware/face_touch_id/controller.dart';

class TouchFaceIDView extends StatefulWidget {
  const TouchFaceIDView({Key? key}) : super(key: key);

  @override
  State<TouchFaceIDView> createState() => _TouchFaceIDViewState();
}

class _TouchFaceIDViewState extends State<TouchFaceIDView> {
  final controller = TouchFaceIdController();

  @override
  void initState() {
    controller.addListener(() {
      setState(() {});
    });
    controller.isDeviceSupported();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Touch Face ID"),
        actions: [
          Visibility(
            visible: !controller.isSupported,
            child: Row(
              children: const [Text("Não suportado"), Icon(Icons.dangerous)],
            ),
          ),
        ],
      ),
      drawer: const CustomDrawer(),
      body: ListView(
        children: [
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(15),
                child: Text(
                  controller.authorized,
                  style: const TextStyle(fontSize: 30),
                ),
              ),
              TextButton(
                onPressed: () {
                  controller.authentcate();
                },
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: const [
                    Text('Autenticar'),
                    Icon(Icons.perm_device_information)
                  ],
                ),
              ),
              TextButton(
                onPressed: () {
                  controller.authenticateWithBiometrics();
                },
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: const [
                    Text("Autenticar: somente biometria"),
                    Icon(Icons.perm_device_information)
                  ],
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
