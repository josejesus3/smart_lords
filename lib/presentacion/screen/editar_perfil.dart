import 'package:flutter/material.dart';

class EditarPerfil extends StatelessWidget {
  const EditarPerfil({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        titleSpacing: size.width * 0.26,
        titleTextStyle: const TextStyle(color: Colors.black38),
        title: const Text('Edit Profile'),
        backgroundColor: Colors.white,
        actions: [
          TextButton(
            onPressed: () {},
            child: const Text(
              'Save',
              style: TextStyle(color: Colors.black38),
            ),
          ),
          const SizedBox(
            width: 10,
          )
        ],
      ),
      backgroundColor: Colors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Stack(
            alignment: Alignment.topRight,
            children: [
              Container(
                width: 170,
                height: 170,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.black12),
                  borderRadius: BorderRadius.circular(150),
                  image: const DecorationImage(
                    fit: BoxFit.cover,
                    image: NetworkImage(
                      'https://cdn.autobild.es/sites/navi.axelspringer.es/public/media/image/2016/09/569465-whatsapp-que-tus-contactos-ponen-rana-perfil.jpg?tf=1080x',
                    ),
                  ),
                ),
              ),
              Container(
                width: 60,
                height: 60,

                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(150),
                ), // Espacio alrededor del ícono
                child: Container(
                  width: 40,
                  height: 40,
                  margin: const EdgeInsets.all(8.0),
                  decoration: BoxDecoration(
                    color: Colors.black45,
                    borderRadius: BorderRadius.circular(150),
                  ),
                  child: IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.camera,
                      color: Colors.white,
                      size: 30,
                    ), // Ajusta el tamaño según sea necesario
                    // Cambia el color si lo deseas
                  ),
                ),
              ),
            ],
          ),
          _buildForm(size, context)
        ],
      ),
    );
  }

  Widget _buildForm(Size size, BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const SizedBox(
          height: 50,
        ),
        for (var field in [
          {
            'label': 'Username',
            'icon': Icons.person_outline,
          },
          {
            'label': 'Password',
            'icon': Icons.lock_outline,
          },
          {
            'label': 'State or Country',
            'icon': Icons.public_outlined,
          },
          {
            'label': 'Email',
            'icon': Icons.email_outlined,
          },
        ])
          _MyCustomFormField(
            label: field['label'].toString(),
            icon: field['icon'] != null
                ? Icon(
                    field['icon'] as IconData,
                  )
                : null,
          ),
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
    const outlineInputBorder = UnderlineInputBorder(
      borderSide: BorderSide(color: Colors.black),
    );
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 18, horizontal: 25),
      child: SizedBox(
        width: 350,
        height: 52,
        child: TextFormField(
          cursorColor: Colors.black,
          decoration: InputDecoration(
            labelText: label,
            labelStyle: const TextStyle(color: Colors.black45),
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
