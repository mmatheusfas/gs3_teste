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
      child: IntrinsicHeight(
        child: Row(
          children: [
            Stack(
              clipBehavior: Clip.none,
              children: [
                Container(
                  height: 40,
                  width: 40,
                  decoration: BoxDecoration(
                    color: Colors.grey.shade50,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Center(
                    child: Icon(
                      iconSelector(),
                      color: Colors.indigo,
                    ),
                  ),
                ),
                Visibility(
                  visible: expenseTitle.contains('Uber'),
                  child: const Positioned(
                    right: 1,
                    bottom: 30,
                    child: CircleAvatar(
                      radius: 6,
                      backgroundColor: Colors.orange,
                      child: Center(
                        child: Text(
                          '!',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 8,
                          ),
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
            const SizedBox(width: 16),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  expenseTitle,
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Text(
                  date,
                  style: TextStyle(
                    color: Colors.grey.shade600,
                    fontSize: 12,
                  ),
                ),
              ],
            ),
            const Spacer(),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  'R\$$totalPrice',
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Visibility(
                  visible: installments != null,
                  child: Text(
                    'em ${installments}x',
                    style: TextStyle(
                      color: Colors.grey.shade600,
                      fontSize: 12,
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  IconData iconSelector() {
    switch (expenseTitle) {
      case 'Apple':
        return Icons.phone_iphone_rounded;
      case 'Uber*Uber*Trip':
        return Icons.local_taxi_outlined;
      case 'Carrefour':
        return Icons.shopping_cart_outlined;
      case 'Academia':
        return Icons.sports_gymnastics_outlined;
    }
    return Icons.monetization_on;
  }
}
