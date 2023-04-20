import 'package:flutter/material.dart';

import '../widgets/qr_code.dart';
import '../widgets/question_card.dart';

class TicketPage extends StatelessWidget {
  const TicketPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          SafeArea(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: () => Navigator.of(context).pop(),
                  child: const Icon(
                    Icons.arrow_back_ios,
                  ),
                ),
                const Text(
                  'Passagens',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
                ),
                const SizedBox.shrink()
              ],
            ),
          ),
          const SizedBox(
            height: 32,
          ),
          const QrCode(),
          const SizedBox(
            height: 32,
          ),
          const QuestionCard(),
        ],
      ),
    );
  }
}
