import 'package:flutter/material.dart';

class ErrorWitget extends StatefulWidget {
  const ErrorWitget({super.key});

  @override
  State<ErrorWitget> createState() => _ErrorWitgetState();
}

class _ErrorWitgetState extends State<ErrorWitget> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(child: const Text('error page')),
    );
  }
}
