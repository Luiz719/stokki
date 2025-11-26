class ShoppingList {
  final String id;
  final String title;
  final DateTime createdAt;
  final List<String> items;

  ShoppingList({
    required this.id,
    required this.title,
    required this.createdAt,
    required this.items,
  });

  factory ShoppingList.fromJson(Map<String, dynamic> json) {
    return ShoppingList(
      id: json['id'],
      title: json['title'],
      createdAt: DateTime.parse(json['createdAt']),
      items: List<String>.from(json['items']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'createdAt': createdAt.toIso8601String(),
      'items': items,
    };
  }
}