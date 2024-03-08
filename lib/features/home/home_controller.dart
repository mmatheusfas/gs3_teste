import 'package:flutter/material.dart';

import '../../models/credit_card.dart';
import '../../models/expense.dart';
import '../../models/favorite.dart';

class HomeController {
  final List<CreditCard> cards = [
    CreditCard(cardNumber: '1234 5621', flag: 'GS3 TEC', availableLimit: 7867.80, bestDayForShopping: 20),
    CreditCard(cardNumber: '4343 7899', flag: 'GS3 TEC', availableLimit: 8000, bestDayForShopping: 26),
  ];

  final List<Favorite> favorites = [
    Favorite(icon: Icons.credit_card_outlined, name: 'Cartão virtual'),
    Favorite(icon: Icons.credit_score_outlined, name: 'Cartão adicional'),
    Favorite(icon: Icons.shield_outlined, name: 'Seguros'),
    Favorite(icon: Icons.mail_outline_outlined, name: 'Pacotes'),
  ];

  final List<Expense> expenses = [
    Expense(name: 'Apple', totalPrice: 545.99, dateTime: '05/09 às 22:35', installments: 12),
    Expense(name: 'Uber*Uber*Trip', totalPrice: 12.96, dateTime: '05/09 às 15:25'),
    Expense(name: 'Carrefour', totalPrice: 349.76, dateTime: '03/09 às 9:34', installments: 3),
    Expense(name: 'Academia', totalPrice: 139.99, dateTime: '03/09 às 8:00'),
  ];

  final List<Expense> _dailyExpenses = [];
  final List<Expense> _olderExpenses = [];

  List<Expense> get dailyExpenses => _dailyExpenses;
  List<Expense> get olderExpenses => _olderExpenses;

  void filterExpenses() {
    for (var expense in expenses) {
      if (expense.dateTime.contains('05/09')) {
        _dailyExpenses.add(expense);
        continue;
      }

      _olderExpenses.add(expense);
    }
  }
}
