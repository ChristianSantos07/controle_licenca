import 'package:flutter/material.dart';

class BotaoLogin extends StatelessWidget {
  final String texto;
  final void Function()? click;

  const BotaoLogin({
    Key? key,
    required this.texto,
    this.click,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  ElevatedButton(
      onPressed: click,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8),
        child: Text(
          texto,
          style: const TextStyle(
              fontSize: 18
          ),
        ),
      ),
    );
  }
}