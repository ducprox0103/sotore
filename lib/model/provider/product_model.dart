class ProductModel {
  num? id;
  String? title;
  num? price;
  String? description;
  String? category;
  String? image;
  int quantity;
  // Float? thanhtien;
  // Float? tongtien;

  ProductModel(
      {this.id,
      this.title,
      this.image,
      this.description,
      this.category,
      this.price,
      this.quantity = 1});
  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
        id: json['id'],
        image: json['image'],
        title: json['title'],
        description: json['description'],
        category: json['category'],
        price: json['price']);
  }
}
