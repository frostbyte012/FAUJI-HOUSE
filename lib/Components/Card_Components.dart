import 'package:flutter/material.dart';

class CartProducts extends StatefulWidget {
  const CartProducts({Key key}) : super(key: key);

  @override
  _CartProductsState createState() => _CartProductsState();
}

class _CartProductsState extends State<CartProducts> {
  var ProductsList=[
    {
      "name":"Rent",
      "picture":"lib/images/home_adds/pexels-scott-webb-1029599.jpg",
      "sellerName":"Rishi",
      "location":"newDelhi",
      "features":"wifi",
      "price":85,
    },
    {
      "name":"HillsRent",
      "picture":"lib/images/home_adds/pexels-sharath-g-2251247.jpg",
      "sellerName":"Beauty",
      "location":"kolkata",
      "features":"wifi",
      "price":85,
    },
    {
      "name":"Palaces",
      "picture":"lib/images/home_adds/pexels-thgusstavo-santana-2102587.jpg",
      "sellerName":"Dinesh",
      "location":"siliguri",
      "features":"wifi",
      "price":67,
    },



  ];
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount:3,
        itemBuilder:(context,index){
          
          return SingleCartProd(
            cart_prod_features: ProductsList[index]["features"],
            cart_prod_location: ProductsList[index]["location"],
            cart_prod_name: ProductsList[index]["name"],
            cart_prod_picture: ProductsList[index]["picture"],
            cart_prod_price: ProductsList[index]["price"],
            cart_prod_seller: ProductsList[index]["sellerName"],

          );
          
        }
    );
  }
}

class SingleCartProd extends StatelessWidget {
  final cart_prod_name;
  final cart_prod_picture;
  final cart_prod_price;
  final cart_prod_seller;
  final cart_prod_location;
  final cart_prod_features;


  const SingleCartProd({
    this.cart_prod_name,
    this.cart_prod_picture,
    this.cart_prod_price,
    this.cart_prod_location,
    this.cart_prod_seller,
    this.cart_prod_features,

});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading:Image.asset(cart_prod_picture,height:80,width:100,),
        title:Text("${cart_prod_name}"),
        subtitle:Column(
          children: [
            Row(
              children: [
                Expanded(child: Text("Price: "),),
                Expanded(child: Text("\$${cart_prod_price}"),)
              ],
            ),
            Row(
              children: [
                Expanded(child: Text("Seller/Rent:"),),
                Expanded(child: Text(cart_prod_seller),)
              ],
            ),
            Row(
              children: [
                Expanded(child: Text("Location: "),),
                Expanded(child: Text(cart_prod_location),)
              ],
            ),
            Row(
              children: [
                Expanded(child: Text("Features:"),),
                Expanded(child: Text(cart_prod_features),)
              ],
            ),
            Row(
              children: [
                Padding(padding:EdgeInsets.fromLTRB(0,0,0,0),child: IconButton(icon:Icon(Icons.delete,color:Colors.red,),onPressed:(){},),),
                Padding(padding:EdgeInsets.fromLTRB(60,0,0,0),child: IconButton(icon:Icon(Icons.favorite,color:Colors.pink,),onPressed:(){},),),
              ],
            ),
          ],
        ),
        // subtitle: ,

      ),
    );
  }
}
