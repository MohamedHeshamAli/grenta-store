class Product {
  final String id;
  final String name;
  final double price;
  late final double priceAfterRebate;
  final double rebate;
  final String mainImageURL;

  Product({
    required this.id,
    required this.name,
    required this.price,
    this.rebate = 0,
    required this.mainImageURL,
  }) {
    rebate == 0
        ? priceAfterRebate = price
        : priceAfterRebate = price - price * rebate / 100;
  }
}
