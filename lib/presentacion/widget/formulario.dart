import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:smart_lords/presentacion/widget/formulario_login.dart';

class FormularioRegistro extends StatelessWidget {
  const FormularioRegistro({super.key});

  @override
  Widget build(BuildContext context) {
    final textStyle = Theme.of(context).textTheme;
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Stack(
                children: [
                  Image.asset('assets/Paises_fondo.png'),
                  Positioned(
                    bottom: 15,
                    left: 20,
                    child: Text(
                      'Create an Account',
                      style: textStyle.titleLarge,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 30,
              ),
              const _MyCustomFormState(
                label: 'Username',
                hint: '',
                icon: Icons.person_2_outlined,
              ),
              const _MyCustomFormState(
                label: 'Email',
                hint: '',
                icon: Icons.email_outlined,
              ),
              const _MyCustomFormState(
                label: 'Password',
                hint: '',
                icon: Icons.password_outlined,
              ),
              const _MyCustomFormState(
                label: 'Confirm Password',
                hint: '',
                icon: Icons.password_outlined,
              ),
              const SizedBox(
                height: 10,
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
                  backgroundColor: const Color(0xFFCEEBFF),
                ),
                child: const Text(
                  'Sign Up',
                  style: TextStyle(color: Colors.black),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
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
                          color: Colors.black,
                          decoration: TextDecoration.underline),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

class _MyCustomFormState extends StatelessWidget {
  final String label;
  final String hint;
  final IconData icon;
  const _MyCustomFormState({
    super.key,
    required this.label,
    required this.hint,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    final outlineInputBorder = OutlineInputBorder(
      borderSide: const BorderSide(
        color: Color(0xFFCEEBFF),
      ),
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
              labelStyle: const TextStyle(
                color: Colors.black,
              ),
              hintText: hint,
              hintStyle: const TextStyle(
                color: Color(0xFFCEEBFF),
              ),
              suffixIcon: Icon(icon),
              border: outlineInputBorder,
              focusedBorder: outlineInputBorder),
        ),
      ),
    );
  }
}
