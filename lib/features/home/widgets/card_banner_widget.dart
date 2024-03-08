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

  void _didTapViewCardNumbers() {
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
          Expanded(
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  child: AspectRatio(
                    aspectRatio: 0.9 / 0.6,
                    child: Container(
                      color: Colors.grey.shade300,
                    ),
                  ),
                ),
                const SizedBox(width: 20),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      isNumbersVisible ? widget.cardNumber : widget.cardNumber.cardObscureNumber(),
                      style: const TextStyle(color: Colors.white, fontSize: 16),
                    ),
                    Text(
                      widget.cardFlag,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                  ],
                ),
                const Spacer(),
                IconButton(
                  color: Colors.white,
                  onPressed: _didTapViewCardNumbers,
                  icon: Icon(
                    Icons.remove_red_eye_outlined,
                    color: widget.index % 2 == 0 ? Colors.blue : Colors.grey,
                  ),
                )
              ],
            ),
          ),
          Divider(
            color: widget.index % 2 == 0 ? Colors.indigo.shade700 : Colors.blueGrey.shade700,
          ),
          Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Limite disponível',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 10,
                    ),
                  ),
                  Text(
                    'R\$ ${widget.availableLimit.doubleToStringFormated()}',
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
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
                      fontSize: 10,
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
