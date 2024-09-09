import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:smart_lords/presentacion/screen/home_screen.dart';
import 'package:smart_lords/presentacion/widget/formulario.dart';

class Registro extends StatefulWidget {
  const Registro({super.key});

  @override
  State<Registro> createState() => _RegistroState();
}

class _RegistroState extends State<Registro> {
  int numero = 0;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    carga();
  }

  void carga() async {
    await Future.delayed(const Duration(seconds: 2));
    setState(() {
      numero = 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    print(numero);
    if (numero == 0) {
      return const HomeScreen();
    } else {
      return Scaffold(
        backgroundColor: Colors.white,
        body: FadeInDown(child: const FormularioRegistro()),
      );
    }
  }
}
