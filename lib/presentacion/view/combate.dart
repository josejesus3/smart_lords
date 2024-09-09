import 'package:flutter/material.dart';

class Combate extends StatelessWidget {
  const Combate({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Stack(
            children: [
              Image.asset('assets/mundo jugando.png'),
              Positioned(
                right: 10,
                child: Row(
                  children: [
                    IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.settings,
                          size: 20,
                        )),
                    IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.info_outline,
                          size: 20,
                        ))
                  ],
                ),
              )
            ],
          ),
          SizedBox(
            height: 40,
          ),
          ElevatedButton(
            onPressed: () {
              // Implement your signup functionality here
            },
            style: ElevatedButton.styleFrom(
              padding:
                  const EdgeInsets.symmetric(horizontal: 100, vertical: 16),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              backgroundColor: Colors.yellow,
            ),
            child: const Text(
              'Jugar',
              style: TextStyle(color: Colors.black),
            ),
          ),
        ],
      ),
    );
  }
}
