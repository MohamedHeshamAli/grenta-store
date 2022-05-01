class Category {
  final String id, name, imageURL;
  Category({
    required this.id,
    required this.imageURL,
    required this.name,
  });
  factory Category.fromJson(Map<String, dynamic> catJson) {
    return Category(id: catJson[""], imageURL: catJson[""], name: catJson[""]);
  }
}
