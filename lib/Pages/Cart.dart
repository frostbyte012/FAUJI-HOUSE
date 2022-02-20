import 'package:flutter/material.dart';
import 'package:fauji_house_app_new/Components/Card_Components.dart';
import 'package:fauji_house_app_new/Components/Search.dart';

class Cart extends StatefulWidget {
  const Cart({Key key}) : super(key: key);

  @override
  _CartState createState() => _CartState();
}

class _CartState extends State<Cart> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.1,
        backgroundColor:Colors.green,
        actions: [
          IconButton(onPressed:(){
            Navigator.push(context, MaterialPageRoute(builder: (context)=>SearchPage()));
          }, icon:Icon(Icons.search,color: Colors.white,)),
          // IconButton(onPressed: (){}, icon:Icon(Icons.shopping_cart,color:Colors.white,)),
        ],
        title:Text("Cart"),
      ),

      body: CartProducts(),


      bottomNavigationBar: Container(
        color:Colors.white,
        child:Expanded(
          child:Row(
            children: [
              Expanded(child:Row(
                 children: [
                   Expanded(child: Padding(padding:EdgeInsets.fromLTRB(50,0,0,0),child: Text("Total: ")),),
                   Expanded(child: Text("\$ 250"),),
                 ],
               ),
              ),
              Expanded(child: MaterialButton(
                child:Text("Check Out"),
                color:Colors.green,
                onPressed: (){},
                textColor:Colors.white,
               ),
              ),

            ],
          ),
        ),

      ),
    );
  }
}
