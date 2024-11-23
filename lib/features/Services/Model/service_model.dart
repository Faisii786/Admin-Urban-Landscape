class ServiceModel {
  final String serviceId;
  final String serviceName;
  final String categoryName;
  final double price;
  final String description;
  final List<String> features;
  final String userId;
  final String userEmail;
  final String userName;
  final String imageUrl;
  final DateTime dateTime;

  ServiceModel({
    required this.serviceId,
    required this.serviceName,
    required this.price,
    required this.description,
    required this.features,
    required this.userId,
    required this.userEmail,
    required this.categoryName,
    required this.userName,
    required this.imageUrl,
    required this.dateTime,
  });

  Map<String, dynamic> toJson() {
    return {
      'serviceId': serviceId,
      'serviceName': serviceName,
      'price': price,
      'description': description,
      'features': features,
      'userId': userId,
      'userEmail': userEmail,
      'categoryName': categoryName,
      'userName': userName,
      'imageUrl': imageUrl,
      'dateTime': dateTime.toIso8601String(),
    };
  }

  factory ServiceModel.fromJson(Map<String, dynamic> json) {
    return ServiceModel(
      serviceId: json['serviceId'] as String,
      serviceName: json['serviceName'] as String,
      categoryName: json['categoryName'] as String,
      price: json['price'] as double,
      description: json['description'] as String,
      features: List<String>.from(json['features']),
      userId: json['userId'] as String,
      userEmail: json['userEmail'] as String,
      userName: json['userName'] as String,
      imageUrl: json['imageUrl'] as String,
      dateTime: DateTime.parse(json['dateTime'] as String),
    );
  }
}
