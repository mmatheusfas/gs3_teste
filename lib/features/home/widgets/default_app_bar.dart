import 'package:flutter/material.dart';

class DefaultAppBar extends StatelessWidget {
  const DefaultAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Icon(
          Icons.menu,
          size: 30,
          color: Colors.white,
        ),
        const Spacer(),
        const Text(
          'Olá, Cliente!',
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.white,
            fontSize: 18,
          ),
        ),
        const Spacer(),
        Row(
          children: [
            const Icon(
              Icons.chat_bubble_outline,
              color: Colors.white,
            ),
            const SizedBox(width: 6),
            Stack(
              children: [
                const Icon(
                  Icons.notifications_none,
                  color: Colors.white,
                ),
                Positioned(
                  left: 12,
                  bottom: 10,
                  child: Container(
                    padding: const EdgeInsets.all(2),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.white, width: 2),
                      shape: BoxShape.circle,
                    ),
                    child: const Text(
                      '3',
                      style: TextStyle(color: Colors.white, fontSize: 6),
                    ),
                  ),
                )
              ],
            ),
          ],
        ),
      ],
    );
  }
}
