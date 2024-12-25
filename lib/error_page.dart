import 'package:flutter/material.dart';

class ErrorPage extends StatelessWidget {
  final String error;

  const ErrorPage({super.key, required this.error});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepOrange[200],
        elevation: 3,
        shadowColor: Colors.grey[300],
        title: const Text(
          'Error Page',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'Error: $error',
          style: const TextStyle(fontSize: 18, color: Colors.red),
        ),
      ),
    );
  }
}
