import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.only(top: 60, bottom: 50),
              child: Image.asset('assets/mundo.png'),
            ),
            Card(
              margin: const EdgeInsets.all(20),
              child: ListView(
                shrinkWrap: true,
                padding: const EdgeInsets.all(10),
                children: [
                  Container(
                    height: 50,
                    margin: const EdgeInsets.only(top: 10, bottom: 25),
                    child: const Center(
                      child: Text(
                        'Smart Lords',
                        style: TextStyle(
                            fontWeight: FontWeight.w600, fontSize: 20),
                      ),
                    ),
                  ),
                  OutlinedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/quiz-page');
                    },
                    style: OutlinedButton.styleFrom(
                        backgroundColor: Colors.indigo.shade100,
                        elevation: 4,
                        side: const BorderSide(width: 4.0)),
                    child: const Text('Iniciar Juego '),
                  ),
                  OutlinedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/review-pages');
                    },
                    style: OutlinedButton.styleFrom(
                        backgroundColor: Colors.indigo.shade100,
                        elevation: 4,
                        side: const BorderSide(width: 4.0)),
                    child: const Text('Repasar Quiz'),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
