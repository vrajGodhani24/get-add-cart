import 'package:adv_4_animation/module/controller/product_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Page2 extends StatefulWidget {
  const Page2({super.key});

  @override
  State<Page2> createState() => _Page2State();
}

class _Page2State extends State<Page2> {
  @override
  Widget build(BuildContext context) {
    ProductController productController = Get.find();

    return Scaffold(
      appBar: AppBar(
        title: const Text("Page2"),
        centerTitle: true,
      ),
      body: Container(
        padding: const EdgeInsets.all(8),
        alignment: Alignment.center,
        child: GetBuilder<ProductController>(
          builder: (controller) {
            return ListView(
              children: productController.cartProducts
                  .map(
                    (e) => Card(
                      elevation: 5,
                      child: ListTile(
                        leading: const FlutterLogo(size: 45),
                        title: Text(e.name),
                        subtitle: Text("${e.price}"),
                        trailing: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            IconButton(
                              onPressed: () {
                                productController.incrementQuantity(e);
                              },
                              icon: const Icon(Icons.add),
                            ),
                            GetBuilder<ProductController>(
                              builder: (controller) {
                                return Text(
                                  "${e.quantity}",
                                  style: const TextStyle(fontSize: 18),
                                );
                              },
                            ),
                            IconButton(
                              onPressed: () {
                                productController.decrementQuantity(e);
                              },
                              icon: const Icon(Icons.remove),
                            ),
                          ],
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
