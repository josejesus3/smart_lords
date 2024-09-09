import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  Stream<String> getLoandingMessage() {
    final message = <String>[
      'El conocimiento es Poder',
      'Entrena tu Mente ',
      'Se el mas Rapido',
      'Prepara lo necesario',
      'Pronto comenzamos'
    ];
    return Stream.periodic(
      const Duration(milliseconds: 1200),
      (step) {
        return message[step];
      },
    ).take(message.length);
  }

  @override
  Widget build(BuildContext context) {
    final textStyle = Theme.of(context).textTheme;
    return Scaffold(
      backgroundColor: const Color(0xFFCEEBFF),
      body: Center(
        child: Column(
          children: [
            const SizedBox(
              height: 177,
            ),
            Image.asset('assets/mundo.png'),
            Text(
              'Smart Lords',
              style: textStyle.titleLarge,
            ),
            StreamBuilder(
              stream: getLoandingMessage(),
              builder: (context, snapshot) {
                if (!snapshot.hasData) return const Text('Cargando...');

                return Text(snapshot.data!);
              },
            ),
            const Padding(
              padding: EdgeInsets.all(20),
              child: SizedBox(
                width: 23,
                height: 23,
                child: CircularProgressIndicator(
                  color: Colors.blue,
                  strokeWidth: 1,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
