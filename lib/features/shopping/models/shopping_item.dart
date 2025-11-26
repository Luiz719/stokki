class ShoppingItem {
  final String? id;
  final String? name;
  final int? quantity;
  bool isPurchased = false;

  ShoppingItem({
    this.id,
    this.name,
    this.quantity,
    this.isPurchased = false,
  });

  factory ShoppingItem.empty() => ShoppingItem();
}