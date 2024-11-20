import 'package:flutter/material.dart';
import 'package:inicio/Configuracion/datos/videos.dart';
import 'package:inicio/Configuracion/pantallas/compartido/videofull_play.dart';
import 'package:inicio/Configuracion/pantallas/compartido/videos_botones.dart';
//import 'package:inicio/Configuracion/compartido/formatos/videofull_player.dart';

class VideoScrollVer extends StatelessWidget {
  final List<Videos> videoS;

  const VideoScrollVer({super.key, required this.videoS});

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      scrollDirection: Axis.vertical,
      physics: const BouncingScrollPhysics(),
      itemCount: videoS.length,
      itemBuilder: (context, index) {
        final Videos video = videoS[index];
        return Stack(
          children: [
            // Video + gradiente
            SizedBox.expand(
              child: VideoFullPlayer(
                nombre: video.nombre,
                videoURL: video.videoURL,
              ),
            ),
            // Iconos o botones
            Positioned(
              bottom: 40,
              right: 20,
              child: VideosBotones(videos: video),
            ),
          ],
        );
      },
    );
  }
}
