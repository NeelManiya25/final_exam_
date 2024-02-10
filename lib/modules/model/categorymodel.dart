class Catagory_Model {
  String title;
  String description;
  String category;
  String image;
  int id;
  var price;

  Catagory_Model({
    required this.id,
    required this.title,
    required this.category,
    required this.description,
    required this.image,
    required this.price,
  });

  factory Catagory_Model.formJSON({required Map data}) {
    return Catagory_Model(
      id: data['id'],
      title: data['title'],
      category: data['category'],
      description: data['description'],
      image: data['image'],
      price: data['price'],
    );
  }
}
