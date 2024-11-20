import 'package:inicio/Configuracion/datos/videos.dart';

class VideoLocalModelo {
  final String name;
  final String videoUrl;
  final int likes;
  final int views;

  VideoLocalModelo({
    required this.name,
    required this.videoUrl,
    this.likes = 0,
    this.views = 0,
  });

  factory VideoLocalModelo.fromJson(Map<String, dynamic> json) {
    return VideoLocalModelo(
      name: json["name"] ?? "Sin Nombre de video",
      videoUrl: json["videoUrl"],
      likes: json["likes"] ?? 0,
      views: json["views"] ?? 0,
    );
  }

  Videos entidadVideos() {
    return Videos(
      nombre: name,
      videoURL: videoUrl,
      probar: likes,
      vistas: views,
    );
  }
}
