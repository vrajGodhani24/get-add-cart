import 'package:adv_4_animation/module/controller/product_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Page2 extends StatelessWidget {
  const Page2({super.key});

  @override
  Widget build(BuildContext context) {
    ProductController productController = Get.find();
    return Scaffold(
      appBar: AppBar(
        title: const Text("Page2"),
        centerTitle: true,
      ),
      body: Container(
        alignment: Alignment.center,
        child: GetBuilder<ProductController>(
          builder: (controller) => ListView(
            children: controller.cartProducts
                .map(
                  (e) => Card(
                    elevation: 2,
                    margin: const EdgeInsets.all(3),
                    child: ListTile(
                      visualDensity: const VisualDensity(vertical: 3),
                      leading: const FlutterLogo(size: 50),
                      title: Text(e.productName),
                      subtitle: Text("${e.price}"),
                      trailing: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              FloatingActionButton(
                                elevation: 0,
                                mini: true,
                                onPressed: () {
                                  productController.decrementQuantity(e);
                                },
                                child: const Icon(Icons.remove),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  "${e.cartQuantity}",
                                  style: const TextStyle(fontSize: 16),
                                ),
                              ),
                              FloatingActionButton(
                                elevation: 0,
                                mini: true,
                                onPressed: () {
                                  productController.incrementQuantity(e);
                                },
                                child: const Icon(Icons.add),
                              ),
                            ],
                          ),
                          Text(
                            "${e.cartQuantity * e.price}",
                            style: const TextStyle(fontSize: 14),
                          ),
                        ],
                      ),
                    ),
                  ),
                )
                .toList(),
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(10),
        child: Container(
          padding: const EdgeInsets.all(25),
          decoration: BoxDecoration(
            color: Colors.red,
            borderRadius: BorderRadius.circular(25),
          ),
          height: 80,
          width: double.infinity,
          alignment: Alignment.centerLeft,
          child: Row(
            children: [
              const Text(
                "Total: ",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 22,
                ),
              ),
              GetBuilder<ProductController>(builder: (controller) {
                return Text(
                  "${productController.totalCartPrice} Rs.",
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                );
              }),
            ],
          ),
        ),
      ),
    );
  }
}
