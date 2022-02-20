import 'package:fauji_house_app_new/Pages/pages.dart';
import 'package:flutter/material.dart';

class Product_List extends StatefulWidget {

//   const ProductGridView({
//
// });

  @override
  _Product_ListState createState() => _Product_ListState();
}

class _Product_ListState extends State<Product_List> {
  var product=[
    {
      "name":"New House",
      "picture":"lib/images/home_adds/pexels-mark-mccammon-1080721.jpg",
      "old_price":100,
      "price":85,
    },
    {
      "name":"New Ready Home",
      "picture":"lib/images/home_adds/pexels-pixabay-259588.jpg",
      "old_price":100,
      "price":85,
    },
    {
      "name":"Bunglow",
      "picture":"lib/images/home_adds/pexels-pixabay-280229.jpg",
      "old_price":100,
      "price":85,
    },
    {
      "name":"Rent",
      "picture":"lib/images/home_adds/pexels-scott-webb-1029599.jpg",
      "old_price":100,
      "price":85,
    },
    {
      "name":"HillsRent",
      "picture":"lib/images/home_adds/pexels-sharath-g-2251247.jpg",
      "old_price":100,
      "price":85,
    },
    {
      "name":"Palaces",
      "picture":"lib/images/home_adds/pexels-thgusstavo-santana-2102587.jpg",
      "old_price":100,
      "price":85,
    },
    {
      "name":"Shared",
      "picture":"lib/images/home_adds/pexels-binyamin-mellish-186077.jpg",
      "old_price":100,
      "price":85,
    },
    {
      "name":"Paying Guest",
      "picture":"lib/images/home_adds/pexels-andrea-piacquadio-935743.jpg",
      "old_price":100,
      "price":85,
    },
    {
      "name":"Bunglow",
      "picture":"lib/images/home_adds/pexels-cottonbro-4783534.jpg",
      "old_price":100,
      "price":85,
    },
    {
      "name":"Appartment",
      "picture":"lib/images/home_adds/pexels-mark-mccammon-1080721.jpg",
      "old_price":100,
      "price":85,
    },
    {
      "name":"Flats",
      "picture":"lib/images/home_adds/pexels-scott-webb-1029599.jpg",
      "old_price":100,
      "price":85,
    },


  ];
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        itemCount: product.length,
        gridDelegate:new SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        itemBuilder:(BuildContext context,int index){
          return SingleProduct(
            prod_name:product[index]['name'],
            prod_old_price:product[index]["old_price"],
            prod_picture:product[index]["picture"],
            prod_price:product[index]["price"],
          );
        },
    );
  }
}

class SingleProduct extends StatelessWidget {
  final prod_name;
  final prod_picture;
  final prod_old_price;
  final prod_price;

  const SingleProduct({
    this.prod_name,
    this.prod_old_price,
    this.prod_picture,
    this.prod_price,
});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Hero(
        tag:prod_name,
        child:Material(
          child:InkWell(
            onTap: ()=> Navigator.of(context).push(MaterialPageRoute(builder: (context)=>ProductDetails(

                     image_product:prod_picture,
                     product_name: prod_name,
                     new_price:prod_price,
                     old_price: prod_old_price,

              ),
             ),
            ),
            child: GridTile(
              child: Image.asset(prod_picture,fit:BoxFit.cover,),
              footer:Container(
                color: Colors.white70,
                child: ListTile(
                  leading: Text(prod_name,style: TextStyle(fontWeight: FontWeight.bold),),
                  title: Text("\$$prod_price",style:TextStyle(color:Colors.green,fontWeight: FontWeight.w800),),
                  subtitle:Text("\$$prod_old_price",style:TextStyle(color:Colors.black54,fontWeight: FontWeight.w800,
                      decoration: TextDecoration.lineThrough,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      );
  }
}
