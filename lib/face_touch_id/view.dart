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
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Touch Face ID"),
        actions: [
          Visibility(
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
              TextButton(
                onPressed: () {},
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: const [
                    Text('Autenticar'),
                    Icon(Icons.perm_device_information)
                  ],
                ),
              ),
              TextButton(
                onPressed: () {},
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
