import 'package:e_commerze/components/cart_component.dart';
import 'package:e_commerze/constants/testing_constants.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: SafeArea(
        child: ListView(
          children: [
            const Gap(25),
            const Row(
              children: [
                Text(
                  'Cart',
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            const Gap(20),
            CartComponent(
              imagePath: products[0].imagePath,
              title: products[0].title,
              price: products[0].price,
              onePrice: int.parse(products[0].price),
            ),
          ],
        ),
      ),
    );
  }
}
