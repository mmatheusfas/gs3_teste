import 'package:flutter/material.dart';
import 'package:gs3_test/features/home/widgets/card_banner_widget.dart';
import 'package:gs3_test/features/home/widgets/default_app_bar.dart';
import 'package:gs3_test/features/home/widgets/favorites_card.dart';
import 'package:gs3_test/features/home/widgets/section_header.dart';
import 'package:gs3_test/features/home/widgets/spending_tile.dart';
import 'package:gs3_test/models/credit_card.dart';
import 'package:gs3_test/models/expense.dart';
import 'package:gs3_test/support/components/gradient_background.dart';

import '../../models/favorite.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    var sizeOf = MediaQuery.sizeOf(context);

    final List<CreditCard> cards = [
      CreditCard(cardNumber: '1234 5678', flag: 'GS3 TEC', availableLimit: 7867.80, bestDayForShopping: 20),
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

    return Scaffold(
      body: GradientBackground(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(right: 12, left: 12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 60),
                const DefaultAppBar(),
                const SizedBox(height: 8),
                Divider(
                  thickness: 2,
                  color: Colors.white.withOpacity(0.4),
                ),
                const SizedBox(height: 8),
                SizedBox(
                  height: sizeOf.height * .21,
                  child: ListView.builder(
                    itemCount: cards.length,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (_, index) {
                      final creditCard = cards[index];

                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: CardBannerWidget(
                          cardNumber: creditCard.cardNumber,
                          cardFlag: creditCard.flag,
                          availableLimit: creditCard.availableLimit,
                          bestDayForBuying: creditCard.bestDayForShopping,
                        ),
                      );
                    },
                  ),
                ),
                Divider(
                  color: Colors.white.withOpacity(0.5),
                ),
                const SizedBox(height: 12),
                const SectionHeader(
                  sectionTitle: 'Meus favoritos',
                  actionTitle: 'Personalizar',
                  actionIcon: Icons.grid_view_outlined,
                ),
                SizedBox(
                  height: sizeOf.height * .15,
                  child: ListView.builder(
                    itemCount: favorites.length,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (_, index) {
                      final favorite = favorites[index];
                      return FavoritesCard(
                        icon: favorite.icon,
                        name: favorite.name,
                      );
                    },
                  ),
                ),
                Divider(
                  color: Colors.grey.withOpacity(0.2),
                ),
                const SizedBox(height: 12),
                const SectionHeader(
                  sectionTitle: 'Últimos lançamentos',
                  actionTitle: 'Ver todos',
                  actionIcon: Icons.arrow_forward_ios_rounded,
                ),
                const SizedBox(height: 12),
                const Text(
                  'Hoje, 05 Set',
                  style: TextStyle(
                    color: Colors.lightBlue,
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: 12),
                SizedBox(
                  height: sizeOf.height * .18,
                  child: ListView.separated(
                    padding: EdgeInsets.zero,
                    itemBuilder: (_, index) {
                      final expense = expenses[index];

                      return SpendingTile(
                        expenseTitle: expense.name,
                        date: expense.dateTime,
                        totalPrice: expense.totalPrice,
                        installments: expense.installments,
                      );
                    },
                    separatorBuilder: (_, __) => Divider(
                      color: Colors.grey.withOpacity(.2),
                    ),
                    itemCount: expenses.length,
                  ),
                ),
                const SizedBox(height: 12),
                const Text(
                  '03 Set',
                  style: TextStyle(
                    color: Colors.lightBlue,
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                /* SizedBox(
                  height: sizeOf.height * .18,
                  child: ListView.separated(
                    padding: EdgeInsets.zero,
                    itemBuilder: (_, __) {
                      return const SpendingTile();
                    },
                    separatorBuilder: (_, __) => const Divider(),
                    itemCount: 4,
                  ),
                ), */
              ],
            ),
          ),
        ),
      ),
    );
  }
}
