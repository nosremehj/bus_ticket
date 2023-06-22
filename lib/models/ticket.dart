

class Ticket{
  String destinoFinal;
  String tipo;
  String embarque;
  String ticket;
  double valor;
  int tempoViagem;

  Ticket({ required this.destinoFinal, required this.tipo, 
  required this.embarque, required this.ticket, required this.valor, required this.tempoViagem});

  factory Ticket.fromJson(Map<String, dynamic> json){
    return Ticket(
    destinoFinal: json['destinoFinal'],
    tipo: json['tipo'],
    embarque: json['embarque'],
    ticket: json['ticket'],
    valor: json['valor'],
    tempoViagem: json['tempoViagem']
    );
  }
}