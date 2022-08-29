import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:http/http.dart' as http;
import '../componentes/botao_login.dart';
import '../componentes/form_login.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  bool _chaveAtivacao = false;
  bool _isChecked = false;
  bool error = false;
  bool erro = false;
  bool mostraSnack = false;
  bool erroLoginInvalido = false;
  var hora;
  var now;
  var textoSnack;
  bool isChaveValida = false;
  var textoAlerta;
  var tituloAlerta;
  var dados;
  var code;

  @override
  Widget build(BuildContext context) {


  TextEditingController controllerUser = TextEditingController();
  TextEditingController controllerSenha = TextEditingController();
  TextEditingController controllerAtivacao = TextEditingController();
  double largura = MediaQuery.of(context).size.width;
  double altura = MediaQuery.of(context).size.height;


    Color getColor(Set<MaterialState> states) {
      const Set<MaterialState> interactiveStates = <MaterialState>{
        MaterialState.pressed,
        MaterialState.hovered,
        MaterialState.focused,
      };
      if (states.any(interactiveStates.contains)) {
        return Colors.deepPurpleAccent;
      }
      return Colors.deepPurpleAccent;
    }

    _alertaChave(BuildContext context, textoAlerta, tituloAlerta)
    {
      // configura o button
      Widget okButton = FlatButton(
        child: Text("Ok", style: TextStyle(color: Colors.red)),
        onPressed: () {
          Navigator.pop(context);

        },
      );
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return  AlertDialog(
            backgroundColor: Colors.black,
            title: Text(tituloAlerta, style: TextStyle(color: Colors.red),),
            content: Text(textoAlerta, style: TextStyle(color: Colors.white),
            ),
            actions: [
              okButton,
            ],
          );
        },
      );
    }

    void logar() async {
      if(isChaveValida == true){
        final now = DateTime.now();
        var now1 = now.toString().replaceAll('-', "").replaceAll(" ", "").replaceAll(":", '').replaceAll(".", '');
        var hora1 = hora.toString().replaceAll('-', "").replaceAll(" ", "").replaceAll(":", '').replaceAll(".", '');
        var now2 = double.parse(now1);
        var hora2 = double.parse(hora1);
        print("Chave valida");
        if(now2 >= hora2) {
          print("a hora é $now e a hora de vencomento é $hora");
          print("data venceu");
          textoAlerta = "Chave de ativação expirada";
          tituloAlerta = "Chave expirada";
          _alertaChave(context, textoAlerta, tituloAlerta);
          setState((){
            _chaveAtivacao = true;
          });

          hora = 0;
        }else {
          final now = DateTime.now();
          textoAlerta = "Login efetuado";
          tituloAlerta = "Sucesso";

          _alertaChave(context, textoAlerta, tituloAlerta);
        }
      }else{
        textoAlerta = "Desculpe, essa máquina não está cadastrada."
            "\n Para cadastrar, basta inserir a chave de ativação";
        tituloAlerta = "Máquina não cadastrada";

        _alertaChave(context, textoAlerta, tituloAlerta);
        hora = 0;
        setState((){
          _chaveAtivacao = true;
        });
      }
    }


    Future<Map?> validarAivacao() async {
      const url = 'http://localhost/controle/login/ativacao.php';
      http.Response response = await http.post(Uri.parse(url), body: {
        "chave": controllerAtivacao.text,
      });
      var map = await json.decode(response.body);
      final codigo = await map['code'];
      final result = await map['result'];
      this.code = codigo;
      this.dados = result;
      print(code);
      print(dados);

      if(code == 1){
        print("licensa ativada");
        var uso = dados[0]['uso'];
        if(uso == "0"){
          var txt;
          final now = DateTime.now();
          print("ok");
          var tempo = dados[0]['tempo'];

          if(tempo == "0"){
            txt = "de 0 dias" ;
            hora = '0';
          }else if(tempo == '1') {
            txt = "de 1 mês";
            hora = now.add(const Duration(hours: 744));
          }else if(tempo == '2'){
            txt = "de 2 meses";
            hora = now.add(const Duration(hours: 1464));
          }else if(tempo == '3'){
            txt = "de 3 meses";
            hora = now.add(const Duration(hours: 2208));
          }else if(tempo == '4'){
            txt = "de 4 meses";
            hora = now.add(const Duration(hours: 2952));
          }else if(tempo == '5'){
            txt = "de 5 meses";
            hora = now.add(const Duration(hours: 3672));
          }else if(tempo == '6'){
            txt = "de 6 meses";
            hora = now.add(const Duration(hours: 4416));
          }else if(tempo == '7'){
            txt = "de 7 meses";
            hora = now.add(const Duration(hours: 5136));
          }else if(tempo == '8'){
            txt = "de 8 meses";
            hora = now.add(const Duration(hours: 5880));
          }else if(tempo == '9'){
            txt = "de 9 meses";
            hora = now.add(const Duration(hours: 6600));
          }else if(tempo == '10'){
            txt = "de 10 meses";
            hora = now.add(const Duration(hours: 7344));
          }else if(tempo == '11'){
            txt = "de 11 meses";
            hora = now.add(const Duration(hours: 8064));
          }else if(tempo == '12') {
            txt = "de 12 meses";
            hora = now.add(const Duration(hours: 8808));
          }else if(tempo == '100') {
            txt = "de teste de 1 dia";
            hora = now.add(const Duration(hours: 5));
          }else if(tempo == '101') {
            txt = "de teste de 2 dias";
            hora = now.add(const Duration(hours: 5));
          }else if(tempo == '999') {
            txt = "Vitalicia";
            hora = now.add(const Duration(hours: 9999999999999));
          }
          isChaveValida = true;
          textoAlerta = "Sua licensa $txt foi ativada";
          tituloAlerta = "Parabéns";
          _alertaChave(context, textoAlerta, tituloAlerta);
          setState((){
            _chaveAtivacao = false;
          });

        }else{
          textoAlerta = "Essa chave está sendo usada em outra máquina";
          tituloAlerta = "ATENÇÂO";
          _alertaChave(context, textoAlerta, tituloAlerta);
        }
      }else {
        print("licensa não encontrada");
        textoAlerta = "Essa chave não é válida.";
        tituloAlerta = "ERRO";
        _alertaChave(context, textoAlerta, tituloAlerta);
      }


    }

    return Observer(builder: (_) {
      return Scaffold(
        body: Container(
          width: largura,
          height: altura,
          decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/images/2.png'), fit: BoxFit.cover),
          ),
          child: Stack(
            children: [
              Center(
                child: SingleChildScrollView(
                  child: Padding(
                    padding: EdgeInsets.all(16),
                    child: Card(
                      elevation: 4,
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(10),
                        ),
                      ),
                      child: Container(
                        padding: EdgeInsets.all(40),
                        width: 500,
                        child: Column(
                          children: [
                            Visibility(
                              visible: _chaveAtivacao ? true : false,
                              child: FormLogin(
                                  error: "erro",
                                  controle: controllerAtivacao,
                                  senha: false,
                                  hint_text: "Digite a chave de ativação",
                                  label_text: "Chave de ativação",
                                  icone: Icons.key),
                            ),
                            Visibility(
                              visible: _chaveAtivacao ? false : true,
                              child: FormLogin(
                                  controle: controllerUser,
                                  senha: false,
                                  hint_text: "Digite seu Login",
                                  label_text: "Login",
                                  icone: Icons.person_outline),
                            ),
                            Visibility(
                                visible: _chaveAtivacao ? false : true,
                                child: FormLogin(
                                    controle: controllerSenha,
                                    senha: true,
                                    hint_text: "Digite sua Senha",
                                    label_text: "Senha",
                                    icone: Icons.lock_outline)),
                            const SizedBox(
                              height: 20,
                            ),
                            Visibility(
                              visible: _chaveAtivacao? false : true,
                              child: SizedBox(
                                width: double.infinity,
                                child: BotaoLogin(
                                  texto: "Login",
                                  click: logar,


                                ),
                              ),),
                            Visibility(
                              visible: _chaveAtivacao? true : false,
                              child: SizedBox(
                                width: double.infinity,
                                child: BotaoLogin(
                                  texto: "Validar",
                                  click: validarAivacao,
                                ),
                              ),),
                            SizedBox(
                              height: _chaveAtivacao ? 0 : 20,
                            ),
                            Row(
                              children: [
                                Visibility(
                                  visible: _chaveAtivacao ? false : true,
                                  child: Checkbox(
                                    checkColor: Colors.white,
                                    fillColor:
                                    MaterialStateProperty.resolveWith(
                                        getColor),
                                    value: _isChecked,
                                    onChanged: (bool? value) {
                                      setState(() {
                                        _isChecked = value!;
                                      });
                                    },
                                  ),
                                ),
                                Visibility(
                                  visible: _chaveAtivacao ? false : true,
                                  child: Text("Lembre-me"),
                                ),
                                Visibility(
                                  visible: _chaveAtivacao ? false : true,
                                  child: const SizedBox(
                                    width: 80,
                                  ),
                                ),
                                const Text("Login"),
                                Switch(
                                    value: _chaveAtivacao,
                                    onChanged: (bool valor) {
                                      setState(() {
                                        _chaveAtivacao = valor;
                                      });
                                    }),
                                const Text("Ativação"),
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      );
    });
  }
}
