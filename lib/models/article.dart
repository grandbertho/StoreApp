class Article {
  final int id;
  final String title;
  final String price;
  final String category;
  final String description;
  final String image;

  Article({required this.id, required this.title, required this.price, required this.category,  required this.description, 
    required this.image });

  factory Article.fromJson(Map<String, dynamic> jsonData) {
    return Article(
      id: jsonData['id'], 
      title: jsonData['title'], 
      price: jsonData['price'].toString(), 
      category: jsonData['category'], 
      description: jsonData['description'], 
      image: jsonData['image'], 
    );
  }
}
