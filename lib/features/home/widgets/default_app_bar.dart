import 'package:flutter/material.dart';

class DefaultAppBar extends StatelessWidget {
  const DefaultAppBar({super.key, required this.onTapMenu});

  final VoidCallback? onTapMenu;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        InkWell(
          onTap: onTapMenu,
          child: const Icon(
            Icons.menu,
            size: 30,
            color: Colors.white,
          ),
        ),
        const Spacer(),
        RichText(
          text: const TextSpan(
            style: TextStyle(color: Colors.white, fontSize: 18),
            children: [
              TextSpan(text: 'Olá,'),
              TextSpan(
                text: ' Cliente',
                style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
        const Spacer(),
        Row(
          children: [
            const Icon(
              Icons.chat_bubble_outline_rounded,
              color: Colors.white,
            ),
            const SizedBox(width: 6),
            Stack(
              clipBehavior: Clip.none,
              children: [
                const Icon(
                  Icons.notifications_none,
                  color: Colors.white,
                ),
                Positioned(
                  left: 13,
                  bottom: 11,
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
