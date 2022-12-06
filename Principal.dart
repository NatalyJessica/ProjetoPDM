import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:projetof/returnLista.dart';

class mainPrincipal extends StatefulWidget {
  const mainPrincipal({Key? key}) : super(key: key);

  @override
  _mainPrincipalState createState() => _mainPrincipalState();
}

class _mainPrincipalState extends State<mainPrincipal> {
  final controller1 = TextEditingController();
  final controller2 = TextEditingController();
  @override
  void dispose1() {
    controller1.dispose();
    super.dispose();
  }

  @override
  void dispose2() {
    controller2.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(" Cadastrar na Lista")),
      body: Container(
        padding: EdgeInsets.all(20),
        child: Column(children: [
          Text('Informe seu nome:'),
          TextFormField(
            controller: controller1,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
            ),
          ),
          SizedBox(
            height: 5,
          ),
          Text('Informe a data de hoje:'),
          TextFormField(
            controller: controller2,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          ElevatedButton(
              onPressed: () {
                print('entrou');
              },
              child: Text("Adicionar")),
          SizedBox(
            height: 100,
          ),
          ElevatedButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => mainReturnLista()));
              },
              child: Text("Lista de Cadastrados"))
        ]),
      ),
    );
  }
}

//mostrar lista-OK
//incluir na lista
//exluir da lista
//qrcode
