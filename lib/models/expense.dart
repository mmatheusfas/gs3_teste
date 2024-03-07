class Expense {
  String name;
  double totalPrice;
  String dateTime;
  int? installments;

  Expense({
    required this.name,
    required this.totalPrice,
    required this.dateTime,
    this.installments,
  });
}
