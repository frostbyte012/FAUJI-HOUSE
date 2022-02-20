import 'package:flutter/material.dart';

class FavouritesProducts extends StatefulWidget {
  const FavouritesProducts({Key key}) : super(key: key);

  @override
  _FavouritesProductsState createState() => _FavouritesProductsState();
}

class _FavouritesProductsState extends State<FavouritesProducts> {
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

          return SingleFavouritesProd(
            favourites_prod_features: ProductsList[index]["features"],
            favourites_prod_location: ProductsList[index]["location"],
            favourites_prod_name: ProductsList[index]["name"],
            favourites_prod_picture: ProductsList[index]["picture"],
            favourites_prod_price: ProductsList[index]["price"],
            favourites_prod_seller: ProductsList[index]["sellerName"],

          );

        }
    );
  }
}

class SingleFavouritesProd extends StatelessWidget {
  final favourites_prod_name;
  final favourites_prod_picture;
  final favourites_prod_price;
  final favourites_prod_seller;
  final favourites_prod_location;
  final favourites_prod_features;


  const SingleFavouritesProd({
    this.favourites_prod_name,
    this.favourites_prod_picture,
    this.favourites_prod_price,
    this.favourites_prod_location,
    this.favourites_prod_seller,
    this.favourites_prod_features,

  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading:Image.asset(favourites_prod_picture,height:80,width:100,),
        title:Text("${favourites_prod_name}"),
        subtitle:Column(
          children: [
            Row(
              children: [
                Expanded(child: Text("Price: "),),
                Expanded(child: Text("\$${favourites_prod_price}"),)
              ],
            ),
            Row(
              children: [
                Expanded(child: Text("Seller/Rent:"),),
                Expanded(child: Text(favourites_prod_seller),)
              ],
            ),
            Row(
              children: [
                Expanded(child: Text("Location: "),),
                Expanded(child: Text(favourites_prod_location),)
              ],
            ),
            Row(
              children: [
                Expanded(child: Text("Features:"),),
                Expanded(child: Text(favourites_prod_features),)
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
