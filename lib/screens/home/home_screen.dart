import 'package:flutter/material.dart';

import 'components/categories.dart';
import 'components/discount_banner.dart';
import 'components/home_header.dart';
import 'components/popular_product.dart';
import 'components/special_offers.dart';

import 'package:shop_app/components/product_card.dart';
import 'package:shop_app/models/Product.dart';

import '../details/details_screen.dart';
import 'components/banner.dart';

class HomeScreen extends StatelessWidget {
  static String routeName = "/home";

  const HomeScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(vertical: 16),
          child: Column(
            children: [
              const HomeHeader(),
              const DiscountBanner(),
              const Categories(),
              const SpecialOffers(),
              const SizedBox(height: 20),
              const PopularProducts(),
              const SizedBox(height: 20),
              const banner(),
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 1),
                child: GridView.count(
                  shrinkWrap: true,
                  physics: const BouncingScrollPhysics(),
                  crossAxisCount: 2,
                  crossAxisSpacing: 0,
                  mainAxisSpacing: 10,
                  childAspectRatio: 0.95,
                  children: List.generate(
                    demoProducts.length,
                    (index) {
                      return Center(
                        child: Column(
                          children: <Widget>[
                            ProductCard(
                              product: demoProducts[index],
                              onPress: () => Navigator.pushNamed(
                                context,
                                DetailsScreen.routeName,
                                arguments: ProductDetailsArguments(
                                    product: demoProducts[index]),
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
