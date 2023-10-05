class ProductCRUD {
  final String title;
  final String price;
  final String description;
  final String category;
  final String image;

  ProductCRUD(
      {required this.title,
      required this.price,
      required this.description,
      required this.category,
      required this.image});
  Map<String, dynamic> toJson() => {
        "title": title,
        "price": price,
        "description": description,
        "category": category,
        "image": image,
      };
}
