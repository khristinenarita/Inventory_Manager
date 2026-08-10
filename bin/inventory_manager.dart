import 'dart:io';
import 'package:riverpod/riverpod.dart';
import 'package:inventory_manager/providers.dart';

void main() {
  final container = ProviderContainer();
  final inventory = container.read(inventoryControllerProvider);

  while (true) {
    print('\n=== INVENTORY MANAGEMENT SYSTEM ===');
    print('1. View Inventory');
    print('2. Add New Product');
    print('3. Update Product Stock');
    print('4. Exit');
    stdout.write('Select an option: ');

    final choice = stdin.readLineSync();

    switch (choice) {
      case '1':
        final products = inventory.products;
        if (products.isEmpty) {
          print('\nInventory is currently empty.');
        } else {
          print('\nID | Name | Stock | Unit Price');
          print('-----------------------------------');
          for (var p in products) {
            print('${p.id} | ${p.name} | ${p.quantity} | \$${p.price.toStringAsFixed(2)}');
          }
        }
        break;

      case '2':
        stdout.write('Enter Product Name: ');
        final name = stdin.readLineSync() ?? '';
        stdout.write('Enter Quantity: ');
        final qty = int.tryParse(stdin.readLineSync() ?? '') ?? 0;
        stdout.write('Enter Price: ');
        final price = double.tryParse(stdin.readLineSync() ?? '') ?? 0.0;

        if (name.isNotEmpty && qty > 0 && price > 0) {
          inventory.addProduct(name, qty, price);
          print('Product added successfully!');
        } else {
          print('Invalid input details.');
        }
        break;

      case '3':
        stdout.write('Enter Product ID: ');
        final id = stdin.readLineSync() ?? '';
        stdout.write('Enter New Stock Quantity: ');
        final qty = int.tryParse(stdin.readLineSync() ?? '') ?? 0;

        if (inventory.updateQuantity(id, qty)) {
          print('Stock updated!');
        } else {
          print('Product ID not found.');
        }
        break;

      case '4':
        print('Exiting application...');
        exit(0);

      default:
        print('Invalid option. Try again.');
    }
  }
}