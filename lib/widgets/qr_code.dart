import 'dart:convert';

import 'package:bus_ticket/models/ticket.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;


Future<List<Ticket>> fetchData() async {
  var url = Uri.parse('https://649369c2428c3d2035d1bf7f.mockapi.io/api/busticket/passagem'); // Substitua pela URL correta da sua API

  var response = await http.get(url);

  if (response.statusCode == 200) {
    List<dynamic> data = jsonDecode(response.body);
    return data.map((json) => Ticket.fromJson(json)).toList();
  } else {
    throw Exception('Falha ao carregar os dados da API');
  }
}

class QrCode extends StatelessWidget {
  const QrCode({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.cyan[50],
        borderRadius: const BorderRadius.all(Radius.circular(16)),
      ),
      child: FutureBuilder<List<Ticket>>(
        future: fetchData(),
        builder: (context, snapshot) {
           if (snapshot.connectionState == ConnectionState.waiting) {
                return CircularProgressIndicator();
              } else if (snapshot.hasError) {
                return Text('Erro: ${snapshot.error}');
              } else {
                List<Ticket> dados = snapshot.data ?? [];
                return Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: dados
                      .map(
                        (dado) => Text('Tipo: ${dado.tipo}\nNúmero da Passagem: ${dado.ticket} \nLocal de embarque: ${dado.embarque} \nDestino Final: ${dado.destinoFinal} \nValor: ${dado.valor} Reais \nTempo aproximado da viagem: ${dado.tempoViagem} min')
                      )
                      .toList(),
                );
              }
        }
      ),
    );
  }
}
