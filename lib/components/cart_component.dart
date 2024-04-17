import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:gap/gap.dart';

class CartComponent extends StatefulWidget {
  final String imagePath;
  final String title;
  String price;

  CartComponent({
    super.key,
    required this.imagePath,
    required this.title,
    required this.price,
  });

  @override
  State<CartComponent> createState() => _CartComponentState();
}

class _CartComponentState extends State<CartComponent> {
  int _quantity = 1;

  // void changePrice() {
  //   widget.price = _quantity * widget.price;
  // }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
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
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 15),
      child: Row(
        children: [
          Image.network(
            widget.imagePath,
            width: 100,
          ),
          const Gap(10),
          SizedBox(
            width: size.width / 1.66,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.title,
                  softWrap: true,
                  maxLines: 2,
                  style: const TextStyle(
                    fontSize: 15.5,
                  ),
                ),
                const Gap(12),
                Row(
                  children: [
                    Text(
                      '\$${widget.price}',
                      style: const TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const Gap(30),
                    Row(
                      children: [
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              _quantity++;
                            });
                          },
                          child: Container(
                            padding: const EdgeInsets.all(4),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: Colors.grey[200],
                            ),
                            child: const Icon(Icons.add_rounded),
                          ),
                        ),
                        const Gap(15),
                        Text(
                          '${_quantity < 10 ? '0$_quantity' : _quantity}',
                          style: const TextStyle(fontSize: 17),
                        ),
                        const Gap(15),
                        GestureDetector(
                          onTap: () {
                            if (_quantity == 1) return;

                            setState(() {
                              _quantity--;
                            });
                          },
                          child: Container(
                            padding: const EdgeInsets.all(4),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: Colors.grey[200],
                            ),
                            child: const Icon(Icons.remove_rounded),
                          ),
                        )
                      ],
                    )
                  ],
                )
              ],
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.delete_rounded,
            ),
          )
        ],
      ),
    );
  }
}
