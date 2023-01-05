import 'package:flutter/cupertino.dart';

class CostumeShape extends CustomClipper<Path>{
  @override
  getClip(Size size) {
   double height = size.height;
   double width =size.width;

   Path path = Path();
   path.lineTo(0, size.height - 140);
   path.quadraticBezierTo(
       size.width / 2, size.height,
       size.width, size.height - 100);
   path.lineTo(size.width, 0);
   path.close();
   return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper oldClipper) {
    // TODO: implement shouldReclip
    return true;
  }
  
}