import 'package:flutter/material.dart';
import 'package:fauji_house_app_new/Components/MyOrder_Components.dart';
import 'package:fauji_house_app_new/Components/Search.dart';

class MyOrders extends StatefulWidget {
  const MyOrders({Key key}) : super(key: key);

  @override
  _MyOrdersState createState() => _MyOrdersState();
}

class _MyOrdersState extends State<MyOrders> {
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
        title:Text("My Orders"),
      ),

      body: MyOrdersProducts(),


      bottomNavigationBar: Container(
        color:Colors.white,
        child:Expanded(
          child:Row(
            children: [
              Expanded(child: MaterialButton(
                child:Text("Cancel Orders."),
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
