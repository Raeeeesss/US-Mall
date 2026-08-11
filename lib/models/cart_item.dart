class CartItem {
  final String title;
  final String price;
  final String originalPrice;
  final String imageAsset;
  int quantity;

  CartItem({
    required this.title,
    required this.price,
    required this.originalPrice,
    required this.imageAsset,
    this.quantity = 1,
  });

  double get unitPrice {
    final cleanPrice = price.replaceAll(RegExp(r'[^0-9.]'), '');
    return double.tryParse(cleanPrice) ?? 200.0;
  }

  double get totalAmount => unitPrice * quantity;
}
