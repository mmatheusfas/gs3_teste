import 'package:flutter/material.dart';

class CardBannerWidget extends StatelessWidget {
  const CardBannerWidget({
    super.key,
    required this.cardNumber,
    required this.cardFlag,
    required this.availableLimit,
    required this.bestDayForBuying,
  });

  final String cardNumber;
  final String cardFlag;
  final double availableLimit;
  final int bestDayForBuying;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 350,
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        gradient: LinearGradient(
          colors: [
            Colors.indigo.shade600,
            Colors.indigo.shade700,
            Colors.indigo.shade800,
            Colors.indigo.shade900,
          ],
          begin: Alignment.centerLeft,
          end: Alignment.center,
        ),
      ),
      child: Column(
        children: [
          Row(
            children: [
              Container(
                color: Colors.grey.shade300,
                height: 60,
                width: 90,
              ),
              const SizedBox(width: 20),
              Column(
                children: [
                  Text(
                    cardNumber,
                    style: const TextStyle(color: Colors.white, fontSize: 18),
                  ),
                  Text(
                    cardFlag,
                    style: const TextStyle(color: Colors.white, fontSize: 18),
                  ),
                ],
              ),
              const Spacer(),
              IconButton(
                color: Colors.white,
                onPressed: () {},
                icon: const Icon(Icons.remove_red_eye),
              )
            ],
          ),
          const SizedBox(height: 8),
          Divider(
            color: Colors.indigo.shade700,
          ),
          const SizedBox(height: 8),
          Row(
            children: [
              Column(
                children: [
                  const Text(
                    'Limite disponível',
                    style: TextStyle(color: Colors.white, fontSize: 12),
                  ),
                  Text(
                    'R\$ ${availableLimit.toString()}',
                    style: const TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              const Spacer(),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  const Text(
                    'Melhor dia de compra',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 12,
                    ),
                  ),
                  Text(
                    bestDayForBuying.toString(),
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              )
            ],
          ),
        ],
      ),
    );
  }
}
