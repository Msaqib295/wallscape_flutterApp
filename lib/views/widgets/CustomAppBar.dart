import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget {
  
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: RichText(
        textAlign: TextAlign.center,
          text: TextSpan(
              text: "Wall" , style: TextStyle(color: Colors.black, fontSize: 20 , fontWeight: FontWeight.w600),
            children: [
              TextSpan(
                text: " Scape" , style: TextStyle(color: Colors.blueAccent, fontSize: 20 , fontWeight: FontWeight.w600)
              ),
            ]
          )


      ),
    );
  }
}
