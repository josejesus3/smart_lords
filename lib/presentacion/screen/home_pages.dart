import 'package:flutter/material.dart';

import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Smart Lords'),
        backgroundColor: const Color(0xFFCEEBFF),
        actions: [
          IconButton(
            icon: const Icon(Icons.settings),
            onPressed: () {
              Navigator.pushNamed(context, '/settings-page');
            },
          ),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                color: const Color(0xFF80CBC4),
              ),
              child: Text(
                'Menú Principal',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),
            ListTile(
              leading: const Icon(Icons.person),
              title: const Text('Perfil'),
              onTap: () {
                Navigator.pushNamed(context, '/profile-page');
              },
            ),
            ListTile(
              leading: const Icon(Icons.notifications),
              title: const Text('Notificaciones'),
              onTap: () {
                Navigator.pushNamed(context, '/notifications-page');
              },
            ),
            ListTile(
              leading: const Icon(Icons.settings),
              title: const Text('Configuración'),
              onTap: () {
                Navigator.pushNamed(context, '/settings-page');
              },
            ),
          ],
        ),
      ),
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
                          fontWeight: FontWeight.w600,
                          fontSize: 20,
                        ),
                      ),
                    ),
                  ),
                  _buildOutlinedButton(context, 'Iniciar Juego', '/quiz-page'),
                  _buildOutlinedButton(
                      context, 'Repasar Quiz', '/review-pages'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildOutlinedButton(
      BuildContext context, String label, String route) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      child: OutlinedButton(
        onPressed: () {
          Navigator.pushNamed(context, route);
        },
        style: OutlinedButton.styleFrom(
          backgroundColor: Colors.indigo.shade100,
          elevation: 4,
          side: const BorderSide(width: 4.0),
          padding: const EdgeInsets.symmetric(vertical: 12),
        ),
        child: Text(
          label,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}
