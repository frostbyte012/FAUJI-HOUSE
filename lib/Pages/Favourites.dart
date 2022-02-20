import 'package:flutter/material.dart';
import 'package:fauji_house_app_new/Components/Favourites_components.dart';
import 'package:fauji_house_app_new/Components/Search.dart';

class Favourites extends StatefulWidget {
  const Favourites({Key key}) : super(key: key);

  @override
  _FavouritesState createState() => _FavouritesState();
}

class _FavouritesState extends State<Favourites> {
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
        title:Text("My Favourites"),
      ),

      body: FavouritesProducts(),


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
                child:Text("Add To Cart."),
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
