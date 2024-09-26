import 'package:flutter/material.dart';

class Configuraciones extends StatefulWidget {
  const Configuraciones({super.key});

  @override
  State<Configuraciones> createState() => _ConfiguracionesState();
}

class _ConfiguracionesState extends State<Configuraciones> {
  bool isSwitched = false; // Estado para el switch de Dark Mode

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text('Settings'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            alignment: Alignment.topCenter,
            height: size.height * 0.8,
            width: size.width,
            decoration: const BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  offset: Offset(-1, -6),
                  color: Colors.black12,
                )
              ],
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
              child: Column(
                children: [
                  _opcionSwitch(
                    icon: Icons.dark_mode,
                    label: 'Dark Mode',

                    value: isSwitched,
                    onChanged: (value) {
                      setState(() {
                        isSwitched = value; // Cambia el estado
                      });
                    },
                    iconColor: Colors.black, // Cambia el color del ícono
                  ),
                  const SizedBox(height: 20),
                  _opcionListTile(
                    icon: Icons.notifications,
                    label: 'Notifications',
                    iconColor: Colors.pink,
                    labelR: 'On',
                    iconR: Icons.arrow_forward_ios,
                    onTap: () {
                      print("Notifications tapped");
                    },
                  ),
                  _opcionListTile(
                    icon: Icons.lock,
                    label: 'Privacy',
                    iconColor: Colors.pinkAccent,
                    labelR: '',
                    iconR: Icons.arrow_forward_ios,
                    onTap: () {
                      print("Privacy tapped");
                    },
                  ),
                  _opcionListTile(
                    icon: Icons.security,
                    label: 'Security',
                    iconColor: Colors.redAccent,
                    labelR: '',
                    iconR: Icons.arrow_forward_ios,
                    onTap: () {
                      print("Security tapped");
                    },
                  ),
                  _opcionListTile(
                    icon: Icons.person,
                    label: 'Account',
                    iconColor: Colors.green,
                    labelR: '',
                    iconR: Icons.arrow_forward_ios,
                    onTap: () {
                      print("Account tapped");
                    },
                  ),
                  _opcionListTile(
                    icon: Icons.help_outline,
                    label: 'Help',
                    iconColor: Colors.teal,
                    labelR: '',
                    iconR: Icons.arrow_forward_ios,
                    onTap: () {
                      print("Help tapped");
                    },
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  // Widget para la opción con Switch (Dark Mode)
  Widget _opcionSwitch({
    required IconData icon,
    required String label,
    required bool value,
    required ValueChanged<bool> onChanged,
    required Color iconColor,
  }) {
    return Row(
      children: [
        Icon(icon, color: iconColor),
        const SizedBox(width: 10),
        Text(label),
        const Spacer(),
        Switch(
          value: value,
          onChanged: onChanged,
        ),
      ],
    );
  }

  // Widget para las opciones con ListTile (para opciones como Notifications, Privacy, etc.)
  Widget _opcionListTile({
    required IconData icon,
    required String label,
    required String labelR,
    required IconData iconR,
    required Color iconColor,
    required VoidCallback onTap,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: InkWell(
        onTap: onTap, // Detecta el tap
        child: Row(
          children: [
            Icon(icon, color: iconColor),
            const SizedBox(width: 10),
            Text(label),
            const Spacer(),
            Text(labelR),
            const SizedBox(width: 10),
            Icon(iconR),
          ],
        ),
      ),
    );
  }
}
