import 'package:flutter/material.dart';
import 'package:inicio/Configuracion/pantallas/proveedor/visor_proveedor.dart';
import 'package:inicio/Configuracion/pantallas/compartido/video_scroll_ver.dart';
import 'package:provider/provider.dart';

class VisorPantalla extends StatelessWidget {
  const VisorPantalla({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    final visorProveedor = context.watch<VisorProveedor>();

    return Scaffold(
      body: visorProveedor.iniciarVideo
          ? const Center(
              child: CircularProgressIndicator(
                strokeWidth: 2,
              ),
            )
          : VideoScrollVer(videoS: visorProveedor.videoos),
    ); // Scaffold
  }
}
