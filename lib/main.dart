import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:smart_lords/presentacion/screen/configuraciones.dart';
import 'package:smart_lords/presentacion/screen/editar_perfil.dart';
import 'package:smart_lords/presentacion/screen/home_pages.dart';
import 'package:smart_lords/presentacion/screen/quiz_page.dart';
import 'package:smart_lords/presentacion/screen/review_page.dart';
import 'package:smart_lords/presentacion/view/registro.dart';
import 'package:smart_lords/presentacion/widget/formulario.dart';
import 'package:smart_lords/presentacion/widget/formulario_login.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => const Registro(),
        '/formulario': (context) => const FormularioRegistro(),
        '/formulario-login': (context) => const FormularioLogin(),
        '/home-page': (context) => const HomePage(),
        '/quiz-page': (context) => const QuizPage(),
        '/review-pages': (context) => const ReviewPages(),
        '/editar-perfil': (context) => const EditarPerfil(),
        '/settings-page': (context) => const Configuraciones()
      },
    );
  }
}
