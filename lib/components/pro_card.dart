import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class ProductCard extends StatefulWidget {
  final String title;
  final String imagePath;
  final String price;

  const ProductCard({
    super.key,
    required this.title,
    required this.imagePath,
    required this.price,
  });

  @override
  State<ProductCard> createState() => _ProductCardState();
}

class _ProductCardState extends State<ProductCard> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      width: size.width / 2.4,
      margin: const EdgeInsets.only(right: 25),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.network(
              widget.imagePath,
              width: size.width / 2.5,
            ),
          ),
          const Gap(10),
          Text(
            widget.title,
            style: const TextStyle(
              fontSize: 14,
            ),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
          const Gap(8),
          Text(
            '\$${widget.price}',
            style: const TextStyle(
              fontSize: 17,
              fontWeight: FontWeight.bold,
            ),
          ),
          const Gap(10),
          Container(
            height: 38,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.black87,
            ),
            child: MaterialButton(
              onPressed: () {},
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.add_shopping_cart_rounded,
                    color: Colors.white,
                    size: 20,
                  ),
                  Gap(10),
                  Text(
                    'Add to cart',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 13,
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
