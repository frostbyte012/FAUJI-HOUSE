import 'package:flutter/material.dart';

class MyOrdersProducts extends StatefulWidget {
  const MyOrdersProducts({Key key}) : super(key: key);

  @override
  _MyOrdersProductsState createState() => _MyOrdersProductsState();
}

class _MyOrdersProductsState extends State<MyOrdersProducts> {
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

          return SingleMyOrderProd(
            order_prod_features: ProductsList[index]["features"],
            order_prod_location: ProductsList[index]["location"],
            order_prod_name: ProductsList[index]["name"],
            order_prod_picture: ProductsList[index]["picture"],
            order_prod_price: ProductsList[index]["price"],
            order_prod_seller: ProductsList[index]["sellerName"],

          );

        }
    );
  }
}

class SingleMyOrderProd extends StatelessWidget {
  final order_prod_name;
  final order_prod_picture;
  final order_prod_price;
  final order_prod_seller;
  final order_prod_location;
  final order_prod_features;


  const SingleMyOrderProd({
    this.order_prod_name,
    this.order_prod_picture,
    this.order_prod_price,
    this.order_prod_location,
    this.order_prod_seller,
    this.order_prod_features,

  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading:Image.asset(order_prod_picture,height:80,width:100,),
        title:Text("${order_prod_name}"),
        subtitle:Column(
          children: [
            Row(
              children: [
                Expanded(child: Text("Price: "),),
                Expanded(child: Text("\$${order_prod_price}"),)
              ],
            ),
            Row(
              children: [
                Expanded(child: Text("Seller/Rent:"),),
                Expanded(child: Text(order_prod_seller),)
              ],
            ),
            Row(
              children: [
                Expanded(child: Text("Location: "),),
                Expanded(child: Text(order_prod_location),)
              ],
            ),
            Row(
              children: [
                Expanded(child: Text("Features:"),),
                Expanded(child: Text(order_prod_features),)
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
