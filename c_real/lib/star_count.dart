import 'package:flutter/material.dart';

class StarCount extends StatelessWidget {
  const StarCount({
    required this.starNum,
    required this.size,
    Key? key,
  }) : super(key: key);

  final int starNum;
  final double size;

  @override
  Widget build(BuildContext context) {
    if (starNum == 1) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Icon(
            Icons.star,
            color: Color(0xff9EC151),
            size: size,
          ),
          Icon(
            Icons.star,
            color: Color(0xffE0DFE9),
            size: size,
          ),
          Icon(
            Icons.star,
            color: Color(0xffE0DFE9),
            size: size,
          ),
          Icon(
            Icons.star,
            color: Color(0xffE0DFE9),
            size: size,
          ),
          Icon(
            Icons.star,
            color: Color(0xffE0DFE9),
            size: size,
          ),
        ],
      );
    } else if (starNum == 2) {
      return Row(
        children: [
          Icon(
            Icons.star,
            color: Color(0xff9EC151),
            size: size,
          ),
          Icon(
            Icons.star,
            color: Color(0xff9EC151),
            size: size,
          ),
          Icon(
            Icons.star,
            color: Color(0xffE0DFE9),
            size: size,
          ),
          Icon(
            Icons.star,
            color: Color(0xffE0DFE9),
            size: size,
          ),
          Icon(
            Icons.star,
            color: Color(0xffE0DFE9),
            size: size,
          ),
        ],
      );
    } else if (starNum == 3) {
      return Row(
        children: [
          Icon(
            Icons.star,
            color: Color(0xff9EC151),
            size: size,
          ),
          Icon(
            Icons.star,
            color: Color(0xff9EC151),
            size: size,
          ),
          Icon(
            Icons.star,
            color: Color(0xff9EC151),
            size: size,
          ),
          Icon(
            Icons.star,
            color: Color(0xffE0DFE9),
            size: size,
          ),
          Icon(
            Icons.star,
            color: Color(0xffE0DFE9),
            size: size,
          ),
        ],
      );
    } else if (starNum == 4) {
      return Row(
        children: [
          Icon(
            Icons.star,
            color: Color(0xff9EC151),
            size: size,
          ),
          Icon(
            Icons.star,
            color: Color(0xff9EC151),
            size: size,
          ),
          Icon(
            Icons.star,
            color: Color(0xff9EC151),
            size: size,
          ),
          Icon(
            Icons.star,
            color: Color(0xff9EC151),
            size: size,
          ),
          Icon(
            Icons.star,
            color: Color(0xffE0DFE9),
            size: size,
          ),
        ],
      );
    } else if (starNum == 5) {
      return Row(
        children: [
          Icon(
            Icons.star,
            color: Color(0xff9EC151),
            size: size,
          ),
          Icon(
            Icons.star,
            color: Color(0xff9EC151),
            size: size,
          ),
          Icon(
            Icons.star,
            color: Color(0xff9EC151),
            size: size,
          ),
          Icon(
            Icons.star,
            color: Color(0xff9EC151),
            size: size,
          ),
          Icon(
            Icons.star,
            color: Color(0xff9EC151),
            size: size,
          ),
        ],
      );
    } else {
      return Row(
        children: [],
      );
    }
  }
}
