// DTO для плана подписки
class SubscriptionPlanDto {
  final String id;
  final String title;
  final String price;
  final String description;

  SubscriptionPlanDto({
    required this.id,
    required this.title,
    required this.price,
    required this.description,
  });

  // Метод для преобразования в JSON
  Map<String, dynamic> toJson() => {
    'id': id,
    'title': title,
    'price': price,
    'description': description,
  };

  // Метод для создания из JSON
  factory SubscriptionPlanDto.fromJson(Map<String, dynamic> json) {
    return SubscriptionPlanDto(
      id: json['id'] ?? '',
      title: json['title'] ?? '',
      price: json['price'] ?? '',
      description: json['description'] ?? '',
    );
  }
}
