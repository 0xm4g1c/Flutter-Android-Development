class Product {
  final String name;
  final int price;
  final String size;
  final String form;
  final String material;
  final String lens;
  final String color;

  Product(
      {required this.name,
      required this.price,
      required this.size,
      required this.form,
      required this.material,
      required this.lens,
      required this.color});
}

final diorproductInfo = Product(
    name: 'Dior Stellaire',
    price: 250,
    size: '54/20/145',
    form: 'Circle',
    material: 'Metal',
    lens: 'Demo',
    color: 'Gold (J5G)');
