import 'package:flutter/material.dart';
import 'package:hardware/components/drawer.dart';

class GeoLocalizacaoView extends StatelessWidget {
  const GeoLocalizacaoView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      drawer: const CustomDrawer(),
    );
  }
}
