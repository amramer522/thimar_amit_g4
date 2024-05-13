import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:refresh_me/refresh_me.dart';
import 'package:thimar_amit_g4/core/design/app_image.dart';
import 'package:thimar_amit_g4/views/main/home_nav/pages/home/components/categories_section.dart';

import 'components/main_app_bar.dart';
import 'components/products_section.dart';
import 'components/slider_section.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MainAppBar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SliderSection(),
            CategoriesSection(),
            ProductsSection(),
          ],
        ),
      ),
    );
  }
}
