import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class FormLogin extends StatelessWidget {
  final TextEditingController controle;
  final bool senha;
  final hint_text;
  final String label_text;
  final IconData icone;
  final String? error;
  final onChanged;



  const FormLogin({
    Key? key,
    required this.controle,
    required this.senha,
    required this.hint_text,
    required this.label_text,
    required this.icone,
    this.error, this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (_) {
        return TextFormField(
          onChanged: onChanged,
          controller: controle,
          obscureText: senha,
          cursorColor: Colors.black,
          style: const TextStyle(
              fontSize: 18,
              color: Colors.black
          ),
          decoration: InputDecoration(
            errorText: error,
            hintText: hint_text,
            labelText: label_text,
            labelStyle: const TextStyle(
              fontSize: 21,
              color: Colors.black,
            ),
            suffixIcon: Icon(
              icone,
              color: Colors.black,
              size: 30,
            ),
            focusedBorder: const UnderlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.black,
                  width: 2,
                )),
            enabledBorder: const UnderlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.black,
                  width: 2,
                )),
          ),
        );
      }
    );
  }
}
