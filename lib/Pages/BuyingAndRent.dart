import 'package:flutter/material.dart';
import 'package:fauji_house_app_new/Components/horizontal_list_view_componet.dart';
import 'package:fauji_house_app_new/Components/product_grid_view.dart';

class BuyersAndRentPage extends StatefulWidget {
  const BuyersAndRentPage({Key key}) : super(key: key);

  @override
  _BuyersAndRentPageState createState() => _BuyersAndRentPageState();
}

class _BuyersAndRentPageState extends State<BuyersAndRentPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:Colors.white,
      appBar: AppBar(
        elevation: 0.1,
        backgroundColor:Colors.green,
        title:Text("Buying and Rent"),
      ),
      body: ListView( //SingleChildScrollView can be used as well.
        children: [

          Padding(
            padding: EdgeInsets.all(10.0),
            child: Text("Top Rent Properties Recommended"),
          ),

          Divider(),


          Container(
            height: 360,
            child:Product_List(),
          ),

          Divider(),

          Padding(
            padding: EdgeInsets.all(10.0),
            child: Text("Top Categories"),
          ),

          Divider(),

          HorizontalListView(),

          Divider(),

          Padding(
            padding: EdgeInsets.all(10.0),
            child: Text("Latest Added Properties for SALE"),
          ),

          Divider(),

          Container(
            height: 360,
            child:Product_List(),
          ),




        ],
      ),
    );
  }
}

