import 'package:flutter/material.dart';
import 'package:tugas4tpm/anggota.dart';
import 'package:tugas4tpm/angka.dart';
import 'package:tugas4tpm/logout.dart';
import 'package:tugas4tpm/penjumlahan.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Home',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        textTheme: const TextTheme(
          labelLarge: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            minimumSize: const Size(double.infinity, 50),
            padding: const EdgeInsets.symmetric(horizontal: 20),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
          ),
        ),
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  Widget _halamanTerpilih(int index) {
    switch (index) {
      case 0:
        return const MenuUtama();
      case 1:
        return const Anggota();
      case 2:
        return const GanjilGenap();
      case 3:
        return const LogoutDialog();
      default:
        return const MenuUtama();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Menu Utama'),
        centerTitle: true,
      ),
      body: _halamanTerpilih(_selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.list), label: 'Anggota'),
          BottomNavigationBarItem(icon: Icon(Icons.looks), label: 'Ganjil Genap'),
          BottomNavigationBarItem(icon: Icon(Icons.logout), label: 'Logout'),
        ],
      ),
    );
  }
}

class MenuUtama extends StatelessWidget {
  const MenuUtama({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          MenuButton('Daftar Anggota', () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const Anggota()),
            );
          }),
          MenuButton('Cek Ganjil Genap', () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const GanjilGenap()),
            );
          }),
          MenuButton('Penjumlahan', () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const Penjumlahan()),
            );
          }),
          MenuButton('Logout', () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const LogoutDialog()),
            );
          }),
        ],
      ),
    );
  }
}

class MenuButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;

  const MenuButton(this.text, this.onPressed, {super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
      child: ElevatedButton(
        onPressed: onPressed,
        child: Text(text),
      ),
    );
  }
}
