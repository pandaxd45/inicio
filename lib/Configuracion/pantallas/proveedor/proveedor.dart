import 'package:flutter/material.dart';
import 'package:inicio/Configuracion/compartido/video_local.dart';
import 'package:inicio/Configuracion/datos/videos.dart';
import 'package:inicio/Configuracion/models/video_local_modelo.dart';

class VisorProveedor extends ChangeNotifier {
  bool iniciarVideo = true;
  List<Videos> videoos = [];

  Future<void> llamarVideo() async {
    // Espera del video
    await Future.delayed(const Duration(seconds: 2));

    // Convertimos el JSON a nuestro tipo de dato Videos
    final List<Videos> nuevosVideos = videoLocal
        .map((videos) => VideoLocalModelo.fromJson(videos).entidadVideos())
        .toList();

    videoos.addAll(nuevosVideos);
    iniciarVideo = false;

    // Lógica para llamar videos (puedes añadir la implementación aquí)
    notifyListeners();
  }
}
