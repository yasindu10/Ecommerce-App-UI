import 'package:e_commerze/components/category_card.dart';
import 'package:e_commerze/components/pro_card.dart';
import 'package:e_commerze/constants/testing_constants.dart';
import 'package:e_commerze/models/product.dart';
import 'package:e_commerze/providers/page_providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';

class ForYouPage extends ConsumerStatefulWidget {
  const ForYouPage({super.key});

  @override
  ConsumerState<ForYouPage> createState() => _ForYouPageState();
}

class _ForYouPageState extends ConsumerState<ForYouPage> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: ListView(
          children: [
            const Gap(20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Hello, Yasindu',
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    boxShadow: const [
                      BoxShadow(
                        color: Color.fromARGB(5, 54, 54, 54),
                        spreadRadius: 4,
                        blurRadius: 7,
                        offset: Offset(0, 3), // changes position of shadow
                      ),
                    ],
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  padding: const EdgeInsets.all(10),
                  child: const Icon(
                    Icons.notifications_outlined,
                    size: 25,
                  ),
                )
              ],
            ),
            const Gap(25),
            //////////////////////// Search Bar
            Container(
              height: 50,
              padding: const EdgeInsets.symmetric(horizontal: 14),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(25),
                boxShadow: const [
                  BoxShadow(
                    color: Color.fromARGB(12, 54, 54, 54),
                    spreadRadius: 4,
                    blurRadius: 7,
                    offset: Offset(0, 2), // changes position of shadow
                  ),
                ],
              ),
              child: GestureDetector(
                onTap: () {
                  ref.watch(currentPageProvider.notifier)
                  .update((state) => 1);
                },
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.search,
                      color: Color.fromRGBO(0, 0, 0, 0.698),
                    ),
                    Gap(12),
                    Text('Search Products')
                  ],
                ),
              ),
            ),
            const Gap(22),
            //////////////////////// Categories
            SizedBox(
              height: 64,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: categories.length,
                itemBuilder: (context, index) {
                  return CategoryCard(
                      title: categories[index],
                      isActive: index == 0 ? true : false);
                },
              ),
            ),
            const Gap(25),
            //////////////////////// For you section
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Just For You',
                  style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  'View All',
                  style: TextStyle(
                    color: Colors.blueAccent,
                    fontWeight: FontWeight.bold,
                  ),
                )
              ],
            ),
            const Gap(16),
            SizedBox(
              height: size.height / 2.5,
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: products.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  Product item = products[index];
                  return ProductCard(
                    imagePath: item.imagePath,
                    price: item.price,
                    title: item.title,
                  );
                },
              ),
            ),
            const Gap(20),
            //////////////////////// Popular Section
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Popular Products',
                  style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  'View All',
                  style: TextStyle(
                    color: Colors.blueAccent,
                    fontWeight: FontWeight.bold,
                  ),
                )
              ],
            ),
            const Gap(16),
            SizedBox(
              height: size.height / 2.2,
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: products.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  Product item = products[index];
                  return ProductCard(
                    imagePath: item.imagePath,
                    price: item.price,
                    title: item.title,
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
