import 'package:flutter/material.dart';

class MyAppBar extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0.1,
      backgroundColor:Colors.green,
      actions: [
        IconButton(onPressed:(){}, icon:Icon(Icons.search,color: Colors.white,)),
        IconButton(onPressed: (){}, icon:Icon(Icons.shopping_cart,color:Colors.white,)),
      ],
      title:Text("FaujiHouse"),
    );
  }
}
