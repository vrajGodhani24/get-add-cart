import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'module/views/screens/homepage.dart';
import 'module/views/screens/page2.dart';

void main() {
  runApp(
    GetMaterialApp(
      debugShowCheckedModeBanner: false,
      getPages: [
        GetPage(name: '/', page: () => const HomePage()),
        GetPage(name: '/page2', page: () => const Page2()),
      ],
    ),
  );
}
