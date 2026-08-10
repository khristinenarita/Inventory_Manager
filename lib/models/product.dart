class Product {
  final String id;
  final String name;
  final int quantity;
  final double price;

  Product({
    required this.id,
    required this.name,
    required this.quantity,
    required this.price,
  });

  Product copyWith({
    String? name,
    int? quantity,
    double? price,
  }) {
    return Product(
      id: id,
      name: name ?? this.name,
      quantity: quantity ?? this.quantity,
      price: price ?? this.price,
    );
  }
}