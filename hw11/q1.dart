abstract class Product {
  String id;
  String name;
  double price;
  double discount;

  Product(this.id, this.name, this.price, {this.discount = 0.0});

  double get discountedPrice => price * (1 - discount / 100);

  @override
  String toString() => "$name: \$discountedPrice USD";
}

class PhysicalProduct extends Product {
  String category;
  int stockQuantity;

  PhysicalProduct(
      String id, String name, double price, this.category, this.stockQuantity,
      {double discount = 0.0})
      : super(id, name, price, discount: discount);
}

class DigitalProduct extends Product {
  String downloadLink;

  DigitalProduct(String id, String name, double price, this.downloadLink,
      {double discount = 0.0})
      : super(id, name, price, discount: discount);
}

class Inventory {
  List<Product> products = [];

  void addProduct(Product product) => products.add(product);
  void removeProduct(String id) => products.removeWhere((p) => p.id == id);

  List<Product> filterByCategory(String category) => products
      .where((p) => p is PhysicalProduct && p.category == category)
      .toList();

  List<Product> filterByType<T extends Product>() =>
      products.where((p) => p is T).toList();

  double get totalInventoryValue => products.fold(
      0,
      (sum, p) =>
          sum +
          (p is PhysicalProduct
              ? p.stockQuantity * p.discountedPrice
              : p.discountedPrice));
}

void main() {
  Inventory inventory = Inventory();

  inventory.addProduct(
      PhysicalProduct("P1", "Laptop", 1000, "Electronics", 5, discount: 10));
  inventory.addProduct(PhysicalProduct("P2", "Shirt", 50, "Clothing", 20));
  inventory.addProduct(
      DigitalProduct("D1", "E-Book", 15, "ebook.com/download", discount: 5));

  print("📦 Total Inventory Value: \$${inventory.totalInventoryValue}");
  print(
      "🔎 Electronics Products: ${inventory.filterByCategory("Electronics")}");
  print("💻 Digital Products: ${inventory.filterByType<DigitalProduct>()}");
}
