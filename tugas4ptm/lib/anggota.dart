import 'package:flutter/material.dart';

class Anggota extends StatelessWidget {
  const Anggota({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Anggota'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: const [
          CustomWidget(
            image: AssetImage('assets/anggota/aini.jpg'),
            text: 'Aini Nur Rachmani (124220141)',
          ),
          CustomWidget(
            image: AssetImage('assets/anggota/anindya.jpg'),
            text: 'Anindya Shafa (124220142)',
          ),
          CustomWidget(
            image: AssetImage('assets/anggota/irsyad.jpeg'),
            text: 'Irsyad Wicaksono (124220049)',
          ),
        ],
      ),
    );
  }
}

class CustomWidget extends StatelessWidget {
  final ImageProvider image;
  final String text;

  const CustomWidget({super.key, required this.image, required this.text});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Image(
          image: image,
          width: 100,
          height: 100,
          fit: BoxFit.cover,
        ),
        const SizedBox(height: 10), // Spacer
        Text(
          text,
          style: const TextStyle(fontSize: 18),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 20), // Spacer
      ],
    );
  }
}
