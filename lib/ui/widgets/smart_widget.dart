import 'package:first_app/data/models/smart.dart';
import 'package:flutter/material.dart';

class TextAndIcon extends StatelessWidget {
  final Smart smart;

  const TextAndIcon({super.key, required this.smart});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(25),
      ),
      margin: const EdgeInsets.all(15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            height: 100,
            width: 100,
            margin: const EdgeInsets.all(15),
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15),
                image: DecorationImage(
                    image: NetworkImage(
                      smart.thumbnail,
                    ))),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: 200,
                child: Text(
                  smart.title,
                ),
              ),
              SizedBox(
                width: 200,
                child: Align(
                  alignment: Alignment.center,
                  child: Text(smart.price.toString()),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}