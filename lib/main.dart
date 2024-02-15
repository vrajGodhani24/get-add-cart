import 'package:adv_4_animation/module/views/screens/homepage.dart';
import 'package:adv_4_animation/module/views/screens/page2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(
    GetMaterialApp(
      debugShowCheckedModeBanner: false,
      getPages: <GetPage>[
        GetPage(name: '/', page: () => const HomePage()),
        GetPage(name: '/page2', page: () => const Page2()),
      ],
    ),
  );
}
