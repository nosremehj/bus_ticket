import 'package:bus_ticket/mocks/menu_options_mock.dart';
import 'package:flutter/material.dart';

import '../widgets/menu_options.dart';
import '../widgets/question_card.dart';
import '../widgets/ticket_card.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        children: [
          SafeArea(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Olá, Usuário',
                  style: TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: Colors.grey[100],
                    borderRadius: const BorderRadius.all(
                      Radius.circular(12),
                    ),
                  ),
                  child: Stack(
                    children: [
                      const Icon(
                        Icons.notifications,
                        size: 36,
                      ),
                      Positioned(
                        right: 0,
                        child: Container(
                          padding: const EdgeInsets.all(1),
                          decoration: BoxDecoration(
                            color: Colors.cyan,
                            borderRadius: BorderRadius.circular(6),
                          ),
                          constraints: const BoxConstraints(
                            minWidth: 16,
                            minHeight: 16,
                          ),
                          child: const Text(
                            '2',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 8,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 48,
          ),
          const Text(
            'Minhas passagens: ',
            style: TextStyle(fontSize: 20),
          ),
          const SizedBox(
            height: 16,
          ),
          ConstrainedBox(
            constraints: const BoxConstraints(maxHeight: 150),
            child: Row(
              children: [
                Expanded(
                  child: ListView.separated(
                    separatorBuilder: (_, index) => const SizedBox(
                      width: 20,
                    ),
                    scrollDirection: Axis.horizontal,
                    itemCount: 3,
                    shrinkWrap: true,
                    itemBuilder: (_, index) {
                      return const TicketCard();
                    },
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 40,
          ),
          const Text(
            'Para você: ',
            style: TextStyle(fontSize: 20),
          ),
          const SizedBox(
            height: 16,
          ),
          ConstrainedBox(
            constraints: const BoxConstraints(
              maxHeight: 200,
            ),
            child: Row(
              children: [
                Expanded(
                  child: ListView.separated(
                    separatorBuilder: (_, index) => const SizedBox(
                      width: 20,
                    ),
                    scrollDirection: Axis.horizontal,
                    itemCount: menuOptionsMock.length,
                    shrinkWrap: true,
                    itemBuilder: (_, index) {
                      return MenuOptions(
                        text: menuOptionsMock[index].text,
                        icon: menuOptionsMock[index].icon,
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 16,
          ),
          const QuestionCard(),
        ],
      ),
    );
  }
}
