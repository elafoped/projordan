

class ServiceItemModel {
  final String name;
  final String phone;
  final double rating;
  final int projects;
  final String description;
  final String image;

  ServiceItemModel({
    required this.name,
    required this.phone,
    required this.rating,
    required this.projects,
    required this.description,
    required this.image,
  });

  factory ServiceItemModel.fromMap(Map<String, dynamic> map) {
    return ServiceItemModel(
      name: map['name'],
      phone: map['phone'],
      rating: (map['rating'] as num).toDouble(),
      projects: map['projects'],
      description: map['description'],
      image: map['image'],
    );
  }
}
