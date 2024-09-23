import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class GanjilGenap extends StatefulWidget {
  const GanjilGenap({super.key});

  @override
  _GanjilGenapState createState() => _GanjilGenapState();
}

class _GanjilGenapState extends State<GanjilGenap> {
  int? _inputNumber;
  bool _isButtonClicked = false;
  String _result = '';

  void _checkAngka() {
    setState(() {
      if (_inputNumber == null) {
        _result = 'Angka INVALID';
      } else if (_inputNumber! % 2 == 0) {
        _result = '$_inputNumber adalah angka GENAP';
      } else {
        _result = '$_inputNumber adalah angka GANJIL';
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Menentukan Bilangan Ganjil/Genap'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _buildTextField(),
            const SizedBox(height: 20),
            _buildCheckButton(),
            const SizedBox(height: 20),
            if (_isButtonClicked) _buildResultText(),
          ],
        ),
      ),
    );
  }

  Widget _buildTextField() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: TextField(
        keyboardType: TextInputType.number,
        inputFormatters: [FilteringTextInputFormatter.digitsOnly],
        decoration: InputDecoration(
          labelText: 'Masukkan Angka',
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
          filled: true,
          fillColor: Colors.grey[200],
        ),
        onChanged: (value) {
          setState(() {
            _inputNumber = int.tryParse(value);
            _isButtonClicked = false;
          });
        },
      ),
    );
  }

  Widget _buildCheckButton() {
    return ElevatedButton(
      onPressed: () {
        _checkAngka();
        setState(() {
          _isButtonClicked = true;
        });
      },
      child: const Text('Cek'),
    );
  }

  Widget _buildResultText() {
    return Text(
      _result,
      style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
      textAlign: TextAlign.center,
    );
  }
}
