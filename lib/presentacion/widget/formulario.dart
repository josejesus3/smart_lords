import 'package:flutter/material.dart';

class FormularioRegistro extends StatelessWidget {
  const FormularioRegistro({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: SizedBox(
          height: size.height,
          child: Stack(
            alignment: Alignment.center,
            children: [
              _buildHeader(size),
              _buildForm(size, context),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHeader(Size size) {
    return Positioned(
      top: 0,
      child: Container(
        height: 380,
        width: size.width,
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.only(
            bottomLeft: Radius.circular(240),
          ),
          color: const Color(0xFFCEEBFF),
          boxShadow: [
            BoxShadow(
              color: Colors.black
                  .withOpacity(0.3), // Color de la sombra con opacidad
              offset: const Offset(
                  -4, 8), // Desplazamiento hacia la izquierda y abajo
              blurRadius: 10, // Nivel de desenfoque de la sombra
              spreadRadius: 2, // Extensión de la sombra
            ),
          ],
        ),
        child: const Center(
          child: Text(
            'Create an Account',
            style: TextStyle(color: Colors.black38, fontSize: 25),
          ),
        ),
      ),
    );
  }

  Widget _buildForm(Size size, BuildContext context) {
    return Positioned(
      bottom: 25,
      child: Container(
        height: size.height * 0.6,
        width: size.width,
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(280),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              const Spacer(),
              for (var field in [
                {'label': 'Username', 'icon': Icons.person_outline},
                {'label': 'Email', 'icon': Icons.email_outlined},
                {'label': 'Password', 'icon': Icons.lock_outline},
                {'label': 'Confirm Password', 'icon': Icons.lock_outline},
              ])
                _MyCustomFormField(
                  label: field['label'].toString(),
                  icon: field['icon'] != null
                      ? Icon(
                          field['icon'] as IconData,
                        )
                      : null,
                ),
              const SizedBox(height: 30),
              _buildSignUpButton(),
              const SizedBox(height: 10),
              _buildLoginRow(context),
            ],
          ),
        ),
      ),
    );
  }

  ElevatedButton _buildSignUpButton() {
    return ElevatedButton(
      onPressed: () {
        // Implement your signup functionality here
      },
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.symmetric(horizontal: 100, vertical: 16),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        backgroundColor: const Color(0xFFCEEBFF),
      ),
      child: const Text('Sign Up', style: TextStyle(color: Colors.black)),
    );
  }

  Widget _buildLoginRow(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Already have an account?'),
            TextButton(
              onPressed: () {
                Navigator.pushNamed(context, '/formulario-login');
              },
              child: const Text(
                'Log In',
                style: TextStyle(
                    color: Colors.black, decoration: TextDecoration.underline),
              ),
            ),
          ],
        ),
        SizedBox(
          width: 280,
          height: 25,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Image.asset(
                'assets/google.png',
              ),
              Image.asset('assets/facebook.png'),
              Image.asset('assets/apple.png'),
            ],
          ),
        )
      ],
    );
  }
}

class _MyCustomFormField extends StatelessWidget {
  final String label;
  final Widget? icon;

  const _MyCustomFormField({
    super.key,
    required this.label,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    final outlineInputBorder = OutlineInputBorder(
      borderSide: const BorderSide(color: Color(0xFFCEEBFF)),
      borderRadius: BorderRadius.circular(5),
    );
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SizedBox(
        width: 350,
        height: 52,
        child: TextFormField(
          cursorColor: Colors.black,
          decoration: InputDecoration(
            labelText: label,
            labelStyle: const TextStyle(color: Colors.black),
            hintStyle: const TextStyle(color: Color(0xFFCEEBFF)),
            suffixIcon: icon,
            border: outlineInputBorder,
            focusedBorder: outlineInputBorder,
          ),
        ),
      ),
    );
  }
}
