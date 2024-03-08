import 'package:flutter/material.dart';
import 'package:gs3_test/features/home/home_controller.dart';
import 'package:gs3_test/features/home/widgets/card_banner_widget.dart';
import 'package:gs3_test/features/home/widgets/default_app_bar.dart';
import 'package:gs3_test/features/home/widgets/favorites_card.dart';
import 'package:gs3_test/features/home/widgets/section_header.dart';
import 'package:gs3_test/features/home/widgets/spending_tile.dart';
import 'package:gs3_test/support/components/gradient_background.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final homeController = HomeController();
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    homeController.filterExpenses();
  }

  void didTapMenu() {
    _scaffoldKey.currentState?.openDrawer();
  }

  @override
  Widget build(BuildContext context) {
    var sizeOf = MediaQuery.sizeOf(context);

    return Scaffold(
      key: _scaffoldKey,
      drawer: Drawer(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 60, horizontal: 12),
          child: Column(
            children: [
              Container(
                width: double.infinity,
                height: 200,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/images/gs3_logo.png'),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const SizedBox(height: 12),
              const Divider(),
            ],
          ),
        ),
      ),
      body: GradientBackground(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(right: 12, left: 12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 60),
                DefaultAppBar(
                  onTapMenu: didTapMenu,
                ),
                Divider(thickness: 2, color: Colors.white.withOpacity(0.4)),
                SizedBox(
                  height: sizeOf.height * .2,
                  child: ListView.builder(
                    itemCount: homeController.cards.length,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (_, index) {
                      final creditCard = homeController.cards[index];

                      return CardBannerWidget(
                        cardNumber: creditCard.cardNumber,
                        cardFlag: creditCard.flag,
                        availableLimit: creditCard.availableLimit,
                        bestDayForBuying: creditCard.bestDayForShopping,
                        index: index,
                      );
                    },
                  ),
                ),
                Divider(color: Colors.white.withOpacity(0.5)),
                const SizedBox(height: 12),
                const SectionHeader(
                  sectionTitle: 'Meus favoritos',
                  actionTitle: 'Personalizar',
                  actionIcon: Icons.grid_view_outlined,
                ),
                SizedBox(
                  height: sizeOf.height * .15,
                  child: ListView.builder(
                    itemCount: homeController.favorites.length,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (_, index) {
                      final favorite = homeController.favorites[index];
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
                SizedBox(
                  height: sizeOf.height * .27,
                  child: ListView(
                    padding: EdgeInsets.zero,
                    children: [
                      const Text(
                        'Hoje, 05 Set',
                        style: TextStyle(
                          color: Colors.lightBlue,
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      SizedBox(
                        height: homeController.dailyExpenses.length * 75,
                        child: ListView.separated(
                          physics: const NeverScrollableScrollPhysics(),
                          padding: EdgeInsets.zero,
                          itemCount: homeController.dailyExpenses.length,
                          itemBuilder: (_, index) {
                            final expense = homeController.dailyExpenses[index];

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
                      SizedBox(
                        height: homeController.olderExpenses.length * 75,
                        child: ListView.separated(
                          physics: const NeverScrollableScrollPhysics(),
                          padding: EdgeInsets.zero,
                          itemCount: homeController.olderExpenses.length,
                          itemBuilder: (_, index) {
                            final expense = homeController.olderExpenses[index];

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
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
