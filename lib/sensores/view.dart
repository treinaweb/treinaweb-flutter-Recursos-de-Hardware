import 'package:flutter/material.dart';
import 'package:hardware/components/drawer.dart';

class SensoresView extends StatefulWidget {
  const SensoresView({Key? key}) : super(key: key);

  @override
  State<SensoresView> createState() => _SensoresViewState();
}

class _SensoresViewState extends State<SensoresView> {
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
          children: const [
            Text(
              "Acelerômetro:",
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
