import 'package:flutter/material.dart';

class SpendingTile extends StatelessWidget {
  const SpendingTile({
    super.key,
    required this.expenseTitle,
    required this.date,
    required this.totalPrice,
    this.installments,
  });

  final String expenseTitle;
  final String date;
  final double totalPrice;
  final int? installments;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: Row(
        children: [
          Container(
            height: 40,
            width: 40,
            decoration: BoxDecoration(
              color: Colors.grey.shade50,
              borderRadius: BorderRadius.circular(16),
            ),
            child: const Center(
              child: Icon(
                Icons.phone_iphone_rounded,
                color: Colors.indigo,
              ),
            ),
          ),
          const SizedBox(width: 16),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                expenseTitle,
                style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
              ),
              Text(
                date,
                style: TextStyle(color: Colors.grey.shade600, fontSize: 12),
              ),
            ],
          ),
          const Spacer(),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                'R\$$totalPrice',
                style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
              ),
              Visibility(
                visible: installments != null,
                child: Text(
                  installments.toString(),
                  style: TextStyle(color: Colors.grey.shade600, fontSize: 12),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
