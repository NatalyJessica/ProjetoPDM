import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:projetof/lista.dart';
import 'package:http/http.dart' as http;

class mainReturnLista extends StatefulWidget {
  const mainReturnLista({super.key});

  @override
  State<mainReturnLista> createState() => _mainReturnListaState();
}

class _mainReturnListaState extends State<mainReturnLista> {
  //função onde retorna os usuarios carregado da api
  Future<List<lista>> mostrarLista() async {
    var url = Uri.parse('https://www.slmm.com.br/CTC/getLista.php');
    var response = await http.get(url);
    if (response.statusCode == 200) {
      List jsonResponse = json.decode(response.body);
      return jsonResponse.map((data) => new lista.fromJson(data)).toList();
    } else {
      throw Exception('Erro ao carregar dados do servidor');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Lista de Cadastrados'),
      ),
      body: FutureBuilder<List<lista>>(
          future: mostrarLista(),
          //snapshot retorna od dados
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return Center(
                child: Text('Erro ao carregar Lista'),
              );
            }
            if (snapshot.hasData) {
              return ListView.builder(
                itemCount: snapshot.data!.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(snapshot.data![index].nome),
                    subtitle: Text(snapshot.data![index].data),
                    trailing: Row(mainAxisSize: MainAxisSize.min, children: [
                      IconButton(
                          onPressed: () {},
                          icon: const Icon(Icons.delete),
                          color: Colors.black)
                    ]),
                  );
                },
              );
            }
            return Center(
              child: CircularProgressIndicator(),
            );
          }),
    );
  }
}
