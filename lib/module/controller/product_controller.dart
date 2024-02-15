import 'package:get/get.dart';

import '../model/product.dart';

class ProductController extends GetxController {
  List<Product> cartProducts = <Product>[];

  int totalCartQuantity = 0;
  int totalCartPrice = 0;

  List<Product> allProducts = <Product>[
    Product(id: 1, productName: 'AC', price: 30000, cartQuantity: 0),
    Product(id: 2, productName: 'Fridge', price: 55000, cartQuantity: 0),
    Product(id: 3, productName: 'TV', price: 50000, cartQuantity: 0),
    Product(id: 4, productName: 'Laptop', price: 100000, cartQuantity: 0),
    Product(id: 5, productName: 'Phone', price: 80000, cartQuantity: 0),
    Product(id: 6, productName: 'Camera', price: 5000, cartQuantity: 0),
    Product(id: 7, productName: 'Watch', price: 1000, cartQuantity: 0),
    Product(id: 8, productName: 'Projector', price: 15000, cartQuantity: 0),
    Product(id: 9, productName: 'Speaker', price: 10000, cartQuantity: 0),
    Product(id: 10, productName: 'Computer', price: 60000, cartQuantity: 0),
  ];

  void addToCartProduct(Product product) {
    product.cartQuantity++;
    cartProducts.add(product);
    totalQuantity();
    totalPrice();
    update();
  }

  void incrementQuantity(Product product) {
    product.cartQuantity++;
    totalQuantity();
    totalPrice();
    update();
  }

  void decrementQuantity(Product product) {
    if (product.cartQuantity > 1) {
      product.cartQuantity--;
    } else {
      product.cartQuantity--;
      cartProducts.remove(product);
    }
    totalQuantity();
    totalPrice();
    update();
  }

  void totalQuantity() {
    totalCartQuantity = 0;
    for (var element in cartProducts) {
      totalCartQuantity += element.cartQuantity;
    }
    print(totalCartQuantity);
    update();
  }

  void totalPrice() {
    totalCartPrice = 0;
    for (var element in cartProducts) {
      totalCartPrice += element.cartQuantity * element.price;
    }
    print(totalCartPrice);
    update();
  }
}
