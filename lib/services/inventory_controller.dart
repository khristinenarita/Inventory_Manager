import '../models/product.dart';

class InventoryController {
  final List<Product> _products = [];

  List<Product> get products => List.unmodifiable(_products);

  void addProduct(String name, int quantity, double price) {
    final id = 'PROD-${DateTime.now().millisecondsSinceEpoch.toString().substring(7)}';
    _products.add(Product(id: id, name: name, quantity: quantity, price: price));
  }

  bool updateQuantity(String id, int newQuantity) {
    final index = _products.indexWhere((p) => p.id == id);
    if (index != -1) {
      _products[index] = _products[index].copyWith(quantity: newQuantity);
      return true;
    }
    return false;
  }
}