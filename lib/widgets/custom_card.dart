import 'package:flutter/material.dart';
import 'package:store_app/models/product_model.dart';
import 'package:store_app/screens/product_details.dart';

class CustomCard extends StatefulWidget {
  CustomCard({super.key, required this.product});
  ProductModel product;

  @override
  State<CustomCard> createState() => _CustomCardState();
}

class _CustomCardState extends State<CustomCard> {
  bool isFavorited = false;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, ProductDetails.id,
            arguments: widget.product);
      },
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Container(
            decoration: BoxDecoration(boxShadow: [
              BoxShadow(
                  blurRadius: 20,
                  color: Colors.grey.withOpacity(.10),
                  offset: const Offset(1, 3),
                  spreadRadius: 1),
              //   BoxShadow(
              //     blurRadius: 0,
              //   color: Colors.white,
              // offset: Offset(-3, -3),
              //  spreadRadius: 0),
            ]),
            child: Card(
              elevation: 3,
              color: Colors.white,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.product.title.substring(0, 7),
                      style: const TextStyle(color: Colors.grey, fontSize: 17),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          r'$ ' '${widget.product.price.toString()}',
                          style: const TextStyle(fontSize: 16),
                        ),
                        IconButton(
                          icon: Icon(
                            Icons.favorite,
                            color: isFavorited
                                ? Colors.red
                                : Colors.grey[
                                    200], // Red if favorited, white if not
                          ),
                          onPressed: () {
                            setState(() {
                              isFavorited =
                                  !isFavorited; // Toggle favorite state
                            });
                          },
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            right: 32,
            bottom: 85,
            child: Image.network(
              widget.product.image,
              height: 100,
              width: 100,
            ),
          )
        ],
      ),
    );
  }
}
