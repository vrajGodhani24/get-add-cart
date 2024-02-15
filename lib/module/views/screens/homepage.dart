import 'package:adv_4_animation/module/controller/product_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    ProductController productController = Get.put(ProductController());

    return Scaffold(
      appBar: AppBar(
        title: const Text("Home Page"),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {
              Get.changeTheme(
                  (Get.isDarkMode) ? ThemeData.light() : ThemeData.dark());
            },
            icon: const Icon(Icons.dark_mode),
          ),
          Badge(
            label: GetBuilder<ProductController>(
              builder: (controller) {
                return Text("${productController.totalCartQuantity}");
              },
            ),
            alignment: const Alignment(0.5, -0.5),
            child: IconButton(
              onPressed: () {
                Get.toNamed('page2');
              },
              icon: const Icon(Icons.shopping_cart),
            ),
          ),
        ],
      ),
      body: Container(
        alignment: Alignment.center,
        child: GetBuilder<ProductController>(
          builder: (controller) => ListView(
            children: productController.allProducts
                .map(
                  (e) => Card(
                    elevation: 2,
                    margin: const EdgeInsets.all(3),
                    child: ListTile(
                      leading: const FlutterLogo(size: 50),
                      title: Text(e.productName),
                      subtitle: Text("${e.price}"),
                      trailing: (e.cartQuantity > 0)
                          ? const Icon(
                              Icons.done,
                              color: Colors.green,
                            )
                          : GestureDetector(
                              onTap: () {
                                productController.addToCartProduct(e);
                              },
                              child:
                                  const Icon(Icons.add_shopping_cart_outlined),
                            ),
                    ),
                  ),
                )
                .toList(),
          ),
        ),
      ),
    );
  }
}
