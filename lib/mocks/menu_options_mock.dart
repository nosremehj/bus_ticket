import 'package:flutter/material.dart';

class MenuOptionsMock {
  final String text;
  final IconData icon;

  MenuOptionsMock(this.text, this.icon);
}

final menuOptionsMock = [
  MenuOptionsMock('Comprar ticket', Icons.qr_code),
  MenuOptionsMock('Mapa', Icons.map),
  MenuOptionsMock('Suporte', Icons.support_agent),
];
