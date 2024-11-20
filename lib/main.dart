import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:inicio/configuracion/repositorio/videos_repositorio.dart';
import 'package:inicio/configuracion/datasources/videos_datasource.dart';
import 'package:inicio/configuracion/temas/tema.dart';
import 'package:inicio/configuracion/proveedor/proveedor.dart';
import 'package:inicio/pantalla_inicio.dart';

void main() => runApp(const MiAplicativo());

class MiAplicativo extends StatelessWidget {
  const MiAplicativo({super.key});

  @override
  Widget build(BuildContext context) {
    // Configuración del repositorio
    final videoRepositorios = VideosLocalesRepositorio(
      videosDatasource1: VideosLocalesDatasource(),
    );

    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) =>
              Proveedor(videosRepositorio: videoRepositorios)..llamarVideo(),
        ),
      ],
      child: MaterialApp(
        title: 'TIK-TOK',
        debugShowCheckedModeBanner: false,
        theme: Tema().miTema(),
        home: const PantallaInicio(),
      ),
    );
  }
}
