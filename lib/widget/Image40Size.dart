import 'package:flutter/material.dart';


class Image40Size extends StatelessWidget {
  final double sizeImage;
  final String src;
  Image40Size({Key? key, required this.sizeImage, this.src="google-img.png"}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10),
      width: sizeImage,
      height: sizeImage,
      decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(
              "assets/images/"+src
            ),
          )
      ),
    );
  }
}

