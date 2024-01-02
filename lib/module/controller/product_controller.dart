import 'package:adv_4_animation/module/model/product.dart';
import 'package:get/get.dart';

class ProductController extends GetxController {
  List<Product> allProducts = [
    Product(id: 1, name: "TV", price: 25000, quantity: 0),
    Product(id: 2, name: "AC", price: 38000, quantity: 0),
    Product(id: 3, name: "Laptop", price: 60000, quantity: 0),
    Product(id: 4, name: "Watch", price: 5000, quantity: 0),
    Product(id: 5, name: "Airbuds", price: 22000, quantity: 0),
    Product(id: 6, name: "Phone", price: 80000, quantity: 0),
  ];

  List<Product> cartProducts = [];

  void addToCartProduct(Product product) {
    cartProducts.add(product);
    product.quantity++;
    update();
  }

  void incrementQuantity(Product product) {
    product.quantity++;
    update();
  }

  void decrementQuantity(Product product) {
    if (product.quantity > 1) {
      product.quantity--;
    } else {
      product.quantity = 0;
      cartProducts.remove(product);
    }
    update();
  }
}
