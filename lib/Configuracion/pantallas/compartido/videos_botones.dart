import 'package:flutter/material.dart';
import 'package:inicio/Configuracion/compartido/formatos/formatos_visibles.dart';
import 'package:inicio/Configuracion/datos/videos.dart';
import 'package:animate_do/animate_do.dart';

class VideosBotones extends StatelessWidget {
  final Videos videos;

  const VideosBotones({super.key, required this.videos});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Botón personalizado con ícono de favorito
        _BotonPersonalizado(
          valor: videos.probar,
          icono: Icons.favorite,
          colorIcono: Colors.red,
        ),
        const SizedBox(height: 20),

        // Botón personalizado con ícono de vistas
        _BotonPersonalizado(
          valor: videos.vistas,
          icono: Icons.remove_red_eye_outlined,
        ),
        const SizedBox(height: 20),

        // Botón personalizado con ícono de reproducción y animación de rotación
        SpinPerfect(
          infinite: true,
          duration: const Duration(seconds: 5),
          child: const _BotonPersonalizado(
            valor: 0,
            icono: Icons.play_circle_outline,
          ),
        ),
      ],
    );
  }
}

class _BotonPersonalizado extends StatelessWidget {
  final int valor;
  final IconData icono;
  final Color? colorIcono;

  const _BotonPersonalizado({
    super.key,
    required this.valor,
    required this.icono,
    this.colorIcono = Colors.blue, // Color por defecto si no se especifica
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        IconButton(
          onPressed: () {},
          icon: Icon(icono, color: colorIcono),
        ),
        if (valor > 0)
          Text(FormatosVibles.formatoVisibleNumeros(valor.toDouble())),
      ],
    );
  }
}
