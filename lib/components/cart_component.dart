import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class CartComponent extends StatefulWidget {
  final String imagePath;
  final String title;
  String price;
  int onePrice;

  CartComponent({
    super.key,
    required this.imagePath,
    required this.title,
    required this.price,
    required this.onePrice,
  });

  @override
  State<CartComponent> createState() => _CartComponentState();
}

class _CartComponentState extends State<CartComponent> {
  int _quantity = 1;

  void changePrice() {
    widget.price = (widget.onePrice * _quantity).toString();
  }

  @override
  Widget build(BuildContext context) {
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
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 6),
      child: ListTile(
        contentPadding: const EdgeInsets.symmetric(horizontal: 10),
        leading: Image.network(
          widget.imagePath,
        ),
        title: Text(
          widget.title,
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
          style: const TextStyle(
            fontSize: 15,
          ),
        ),
        subtitle: Row(
          children: [
            Text(
              '\$${widget.price}',
              style: const TextStyle(
                fontSize: 17,
                fontWeight: FontWeight.bold,
              ),
            ),
            const Gap(10),
            Row(
              children: [
                GestureDetector(
                  onTap: () {
                    if (_quantity == 20) return;

                    setState(() {
                      _quantity++;
                    });
                    changePrice();
                  },
                  child: Container(
                    padding: const EdgeInsets.all(1),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.grey[200],
                    ),
                    child: const Icon(Icons.add_rounded),
                  ),
                ),
                const Gap(10),
                Text(
                  '${_quantity < 10 ? '0$_quantity' : _quantity}',
                  style: const TextStyle(fontSize: 17),
                ),
                const Gap(10),
                GestureDetector(
                  onTap: () {
                    if (_quantity == 1) return;

                    setState(() {
                      _quantity--;
                    });
                    changePrice();
                  },
                  child: Container(
                    padding: const EdgeInsets.all(1),
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
        ),
        trailing: IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.delete_rounded,
          ),
        ),
      ),
    );
  }
}
