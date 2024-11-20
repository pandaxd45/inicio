import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class VideoFullPlayer extends StatefulWidget {
  final String nombre;
  final String videoURL;

  const VideoFullPlayer({
    super.key,
    required this.nombre,
    required this.videoURL,
  });

  @override
  State<VideoFullPlayer> createState() => _VideoFullPlayerState();
}

class _VideoFullPlayerState extends State<VideoFullPlayer> {
  late VideoPlayerController controladorVideo;

  @override
  void initState() {
    super.initState();
    controladorVideo = VideoPlayerController.asset(widget.videoURL)
      // Modifica el volumen (0-1)
      ..setVolume(0.5)
      // Modifica la reproducción en bucle (true/false)
      ..setLooping(false)
      ..play();
  }

  @override
  void dispose() {
    controladorVideo.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: controladorVideo.initialize(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          return AspectRatio(
            aspectRatio: controladorVideo.value.aspectRatio,
            child: Stack(
              children: [
                VideoPlayer(controladorVideo),
                // Texto
                Positioned(
                  bottom: 50,
                  left: 30,
                  child: _NombreVideo(descripcion: widget.nombre),
                ),
              ],
            ),
          );
        } else {
          return const Center(
            child: CircularProgressIndicator(strokeWidth: 2),
          );
        }
      },
    );
  }
}

class _NombreVideo extends StatelessWidget {
  final String descripcion;

  const _NombreVideo({super.key, required this.descripcion});

  @override
  Widget build(BuildContext context) {
    final ancho = MediaQuery.of(context).size;
    final estiloTitulo = Theme.of(context).textTheme.titleLarge;
    return SizedBox(
      width: ancho.width * 0.6,
      child: Text(
        descripcion,
        maxLines: 2,
        style: estiloTitulo,
      ),
    );
  }
}
