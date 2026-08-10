import 'package:riverpod/riverpod.dart';
import 'services/inventory_controller.dart';

final inventoryControllerProvider = Provider<InventoryController>((ref) {
  return InventoryController();
});