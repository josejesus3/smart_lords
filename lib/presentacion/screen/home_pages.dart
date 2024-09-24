import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Smart Lords'),
        backgroundColor: const Color(0xFFCEEBFF),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.notifications),
          ),
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
            SizedBox(
              height: 280,
              child: DrawerHeader(
                decoration: const BoxDecoration(color: Color(0xFF80CBC4)),
                child: Column(
                  children: [
                    const CircleAvatar(radius: 40),
                    const SizedBox(height: 10),
                    const Text('Nombre de Usuario'),
                    const Text('Estado (Región)'),
                    const SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(
                        5,
                        (index) => const Icon(Icons.flash_on,
                            color: Colors.yellow, size: 30),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            ..._buildDrawerItems(context),
          ],
        ),
      ),
      body: Column(
        children: [
          _buildHeaderImage(size),
          _buildQuizButton(
              context,
              size,
              'Start Quiz',
              'Test Question',
              'Question for evaluating knowledge on a topic',
              const Color.fromARGB(181, 28, 116, 204)),
          _buildQuizButton(
              context,
              size,
              'Start Duels',
              'Training Duels',
              'Engage in intense training duels to enhance your skills and strategies. Challenge your friends and become a master to achieve victory!',
              const Color.fromARGB(255, 177, 174, 174)),
        ],
      ),
    );
  }

  List<Widget> _buildDrawerItems(BuildContext context) {
    return [
      _buildDrawerItem(context, Icons.person, 'Editar Perfil', '/profile-page'),
      _buildDrawerItem(
          context, Icons.settings, 'Configuración', '/settings-page'),
      _buildDrawerItem(context, Icons.chat, 'Chat', '/chat-page'),
    ];
  }

  Widget _buildDrawerItem(
      BuildContext context, IconData icon, String title, String route) {
    return ListTile(
      leading: Icon(icon),
      title: Text(title),
      onTap: () => Navigator.pushNamed(context, route),
    );
  }

  Widget _buildHeaderImage(Size size) {
    return Container(
      width: size.width,
      height: 250,
      margin: const EdgeInsets.only(bottom: 10),
      decoration: BoxDecoration(
        color: const Color(0xFFF5F5DC),
        borderRadius: const BorderRadius.only(
            bottomLeft: Radius.circular(40), bottomRight: Radius.circular(40)),
        boxShadow: [
          BoxShadow(
              color: Colors.black.withOpacity(0.4),
              offset: const Offset(-3, 6),
              blurRadius: 8,
              spreadRadius: 1),
        ],
      ),
      child: Image.asset('assets/mundo.png'),
    );
  }

  Widget _buildQuizButton(BuildContext context, Size size, String label,
      String title, String description, Color color) {
    return Container(
      width: size.width,
      height: 210,
      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      decoration:
          BoxDecoration(color: color, borderRadius: BorderRadius.circular(20)),
      child: _buildOutlinedButton(
          context, label, title, description, '/quiz-page'),
    );
  }

  Widget _buildOutlinedButton(BuildContext context, String label, String title,
      String description, String route) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: SizedBox(
        height: 170,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title,
                textAlign: TextAlign.center,
                style: const TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold)),
            const SizedBox(height: 10),
            Expanded(
              child: Container(
                width: 247,
                child: Text(description,
                    textAlign: TextAlign.left,
                    style: const TextStyle(
                        color: Colors.white,
                        fontSize: 15,
                        fontWeight: FontWeight.bold)),
              ),
            ),
            SizedBox(
              width: 130,
              child: OutlinedButton(
                onPressed: () => Navigator.pushNamed(context, route),
                style: OutlinedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8)),
                ),
                child: Text(label,
                    style: const TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w500)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
