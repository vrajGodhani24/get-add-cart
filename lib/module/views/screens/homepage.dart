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
        title: const Text("Counter"),
        centerTitle: true,
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Badge(
              label: GetBuilder<ProductController>(
                builder: (controller) {
                  return Text("${productController.cartProducts.length}");
                },
              ),
              child: IconButton(
                onPressed: () {
                  Get.toNamed('page2');
                },
                icon: const Icon(Icons.shopping_cart_rounded),
              ),
            ),
          ),
        ],
      ),
      body: Container(
        padding: const EdgeInsets.all(8),
        alignment: Alignment.center,
        child: GetBuilder<ProductController>(
          builder: (controller) {
            return ListView(
              children: productController.allProducts
                  .map(
                    (e) => Card(
                      elevation: 5,
                      child: ListTile(
                        leading: const FlutterLogo(size: 45),
                        title: Text(e.name),
                        subtitle: Text("${e.price}"),
                        trailing: GetBuilder<ProductController>(
                          builder: (controller) {
                            return (e.quantity == 0)
                                ? InkWell(
                                    onTap: () {
                                      productController.addToCartProduct(e);
                                    },
                                    child: const Icon(
                                        Icons.add_shopping_cart_outlined),
                                  )
                                : const Icon(Icons.done, color: Colors.green);
                          },
                        ),
                      ),
                    ),
                  )
                  .toList(),
            );
          },
        ),
      ),
    );
  }
}
