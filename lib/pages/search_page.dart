import 'package:e_commerze/constants/testing_constants.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: SafeArea(
          child: ListView(
            children: [
              const Gap(25),
              const Row(
                children: [
                  Text(
                    'Search',
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              const Gap(15),
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
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Icon(
                      Icons.search,
                      color: Color.fromRGBO(0, 0, 0, 0.698),
                    ),
                    const Gap(12),
                    SizedBox(
                      height: 50,
                      width: size.width / 1.5,
                      child: TextField(
                        decoration: const InputDecoration(
                          hintText: 'Search products',
                          hintStyle: TextStyle(
                              fontSize: 15,
                              color: Color.fromRGBO(0, 0, 0, 0.698)),
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const Gap(15),
              ListView.separated(
                separatorBuilder: (context, index) => const Gap(10),
                shrinkWrap: true,
                itemCount: products.length,
                itemBuilder: (context, index) => Container(
                  decoration: BoxDecoration(
                    boxShadow: const [
                      BoxShadow(
                        color: Color.fromARGB(12, 54, 54, 54),
                        spreadRadius: 4,
                        blurRadius: 7,
                        offset: Offset(0, 2), // changes position of shadow
                      ),
                    ],
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: ListTile(
                    trailing: IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.add_shopping_cart_rounded),
                    ),
                    leading: ClipRRect(
                      child: Image.network(products[index].imagePath),
                    ),
                    title: const Text('Product Name'),
                    subtitle: Text(
                      '\$${products[index].price}',
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
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
