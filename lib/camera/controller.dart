import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class CameraController extends ChangeNotifier {
  final _imagePiCker = ImagePicker();
  var listImages = <File>[];

  Future<void> acessGalery() async {
    final XFile? img =
        await _imagePiCker.pickImage(source: ImageSource.gallery);
    if (img != null) {
      listImages.add(File(img.path));
      notifyListeners();
    }
  }

  Future<void> acessGaleryMultipleImage() async {
    final List<XFile>? imgs = await _imagePiCker.pickMultiImage();

    if (imgs != null) {
      imgs.forEach((img) {
        listImages.add(File(img.path));
      });
      notifyListeners();
    }
  }
}
