import 'package:flutter/material.dart';
import 'package:hardware/components/drawer.dart';
import 'package:hardware/sensores/controller.dart';

class SensoresView extends StatefulWidget {
  const SensoresView({Key? key}) : super(key: key);

  @override
  State<SensoresView> createState() => _SensoresViewState();
}

class _SensoresViewState extends State<SensoresView> {
  final controller = SensoresController();

  @override
  void initState() {
    controller.getAccelerometer();
    controller.addListener(() {
      setState(() {});
    });
    super.initState();
  }

  @override
  void dispose() {
    for (var subscript in controller.streamSubscription) {
      subscript.cancel();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sensores'),
      ),
      drawer: const CustomDrawer(),
      body: Container(
        alignment: AlignmentDirectional.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              "Acelerômetro: ${controller.accelerometerValues}",
              style: TextStyle(fontSize: 20),
            ),
            Text(
              "Giroscópio:",
              style: TextStyle(fontSize: 20),
            ),
            Text(
              "Magnetômetro:",
              style: TextStyle(fontSize: 20),
            )
          ],
        ),
      ),
    );
  }
}
