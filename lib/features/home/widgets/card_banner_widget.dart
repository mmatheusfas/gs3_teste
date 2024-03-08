// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:gs3_test/support/extensions/double_extension.dart';
import 'package:gs3_test/support/extensions/string_extensions.dart';

class CardBannerWidget extends StatefulWidget {
  const CardBannerWidget({
    super.key,
    required this.cardNumber,
    required this.cardFlag,
    required this.availableLimit,
    required this.bestDayForBuying,
    required this.index,
  });

  final String cardNumber;
  final String cardFlag;
  final double availableLimit;
  final int bestDayForBuying;
  final int index;

  @override
  State<CardBannerWidget> createState() => _CardBannerWidgetState();
}

class _CardBannerWidgetState extends State<CardBannerWidget> {
  bool isNumbersVisible = false;
  void didTapViewCardNumbers() {
    setState(() {
      isNumbersVisible = !isNumbersVisible;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 350,
      padding: const EdgeInsets.all(12),
      margin: const EdgeInsets.only(top: 8, bottom: 8, right: 8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        gradient: widget.index % 2 == 0
            ? LinearGradient(
                colors: [
                  Colors.indigo.shade700,
                  Colors.indigo.shade800,
                  Colors.indigo.shade900,
                ],
                begin: Alignment.centerLeft,
                end: Alignment.center,
              )
            : LinearGradient(
                colors: [
                  Colors.blueGrey.shade700,
                  Colors.blueGrey.shade800,
                  Colors.blueGrey.shade900,
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
                height: 65,
                width: 100,
              ),
              const SizedBox(width: 20),
              Column(
                children: [
                  Text(
                    isNumbersVisible ? widget.cardNumber : widget.cardNumber.cardObscureNumber(),
                    style: const TextStyle(color: Colors.white, fontSize: 18),
                  ),
                  Text(
                    widget.cardFlag,
                    style: const TextStyle(color: Colors.white, fontSize: 18),
                  ),
                ],
              ),
              const Spacer(),
              IconButton(
                color: Colors.white,
                onPressed: didTapViewCardNumbers,
                icon: Icon(
                  Icons.remove_red_eye_outlined,
                  color: widget.index % 2 == 0 ? Colors.blue : Colors.grey,
                ),
              )
            ],
          ),
          Divider(
            color: widget.index % 2 == 0 ? Colors.indigo.shade700 : Colors.blueGrey.shade700,
          ),
          const Spacer(),
          Row(
            children: [
              Column(
                children: [
                  const Text(
                    'Limite disponível',
                    style: TextStyle(color: Colors.white, fontSize: 12),
                  ),
                  Text(
                    'R\$ ${widget.availableLimit.doubleToStringFormated()}',
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
                    widget.bestDayForBuying.toString(),
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
