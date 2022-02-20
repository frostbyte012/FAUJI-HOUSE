import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fauji_house_app_new/Pages/BuyingAndRent.dart';
import 'package:fauji_house_app_new/Pages/Sellers.dart';
import 'package:fauji_house_app_new/Pages/Settings.dart';
import 'package:fauji_house_app_new/model/user_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:carousel_pro/carousel_pro.dart';
import 'package:fauji_house_app_new/Components/horizontal_list_view_componet.dart';
import 'package:fauji_house_app_new/Components/product_grid_view.dart';
import 'package:fauji_house_app_new/Pages/Cart.dart';
import "package:fauji_house_app_new/Pages/Locations.dart";
import "package:fauji_house_app_new/Components/Search.dart";
import 'package:fauji_house_app_new/Pages/Favourites.dart';
import 'package:fauji_house_app_new/Pages/My Orders.dart';
import 'package:fauji_house_app_new/Pages/MyProfile.dart';
import 'package:fauji_house_app_new/Pages/AccountFile.dart';



class MainCarousel extends StatelessWidget {
  const MainCarousel({Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      child: Carousel(
        boxFit: BoxFit.cover,
        images: [

          AssetImage("lib/images/home_adds/pexels-andrea-piacquadio-935743.jpg"),
          AssetImage("lib/images/home_adds/pexels-binyamin-mellish-1396122.jpg"),
          AssetImage("lib/images/home_adds/pexels-cottonbro-4783534.jpg"),
          AssetImage("lib/images/home_adds/pexels-expect-best-323780.jpg"),
          AssetImage("lib/images/home_adds/pexels-julia-kuzenkov-1974596.jpg"),

        ],
        animationDuration:Duration(milliseconds: 1000),
        animationCurve:Curves.fastLinearToSlowEaseIn,
        // dotBgColor:Colors.yourchoice,
        // dotColor: Color.yourchoice,
        dotSize: 3.0,
        indicatorBgPadding:4.0,
      ),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  User user = FirebaseAuth.instance.currentUser;
  UserModel loggedInUser = UserModel();

  @override
  void initState() {
    super.initState();
    FirebaseFirestore.instance
        .collection("users")
        .doc(user.uid)
        .collection("details")
        .doc("detailsofuser")
        .get()
        .then((value) {
      this.loggedInUser = UserModel.fromMap(value.data());
      setState(() {});
    });
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
        elevation: 0.1,
        backgroundColor:Colors.green,
        actions: [
          IconButton(onPressed:(){
            Navigator.push(context,MaterialPageRoute(builder: (context)=>SearchPage()));
          }, icon:Icon(Icons.search,color: Colors.white,),),
          IconButton(onPressed: (){
            Navigator.push(context,MaterialPageRoute(builder: (context)=>Cart()));
          }, icon:Icon(Icons.shopping_cart,color:Colors.white,),),
        ],
        title:Text('FaujiHouse'),
      ),
      drawer:Drawer(
        child:ListView(
          children: [
            UserAccountsDrawerHeader(
              decoration:BoxDecoration(
                color: Colors.green,
              ),
              currentAccountPicture:GestureDetector(
                child: loggedInUser.profilePicURl==null?CircleAvatar(
                  backgroundColor:Colors.grey,
                  child: Icon(Icons.person,color: Colors.white,
                  ),
                ):CircleAvatar(
                  backgroundImage:NetworkImage("${loggedInUser.profilePicURl}",),
                  maxRadius:75.0,
                  backgroundColor:Colors.black,
                ),

              ),
              accountName:Text('${loggedInUser.firstName} ${loggedInUser.secondName}'),
              accountEmail:Text('${loggedInUser.email}'),
            ),
            InkWell(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>HomePage()));
              },
              child: ListTile(
                title: Text('Home'),
                leading: Icon(Icons.home,color: Colors.grey,),
              ),
            ),
            InkWell(
              onTap: (){
                Navigator.push(context,MaterialPageRoute(builder: (context)=>MyProfilePage()));
              },
              child: ListTile(
                title: Text('My Account'),
                leading: Icon(Icons.person,color: Colors.grey,),
              ),
            ),

            InkWell(
              onTap: (){
                Navigator.push(context,MaterialPageRoute(builder: (context)=>MyOrders()));
              },
              child: ListTile(
                title: Text('My Orders'),
                leading: Icon(Icons.shopping_basket,color: Colors.grey,),
              ),
            ),

            InkWell(
              onTap: (){
                Navigator.push(context,MaterialPageRoute(builder: (context)=>BuyersAndRentPage()));
              },
              child: ListTile(
                title: Text('Buyers and Rent'),
                leading: Icon(Icons.money,color: Colors.grey,),
              ),
            ),

            InkWell(
              onTap: (){
                Navigator.push(context,MaterialPageRoute(builder: (context)=>SellersPage(uid:loggedInUser.uid,)));
              },
              child: ListTile(
                title: Text('Sell Property'),
                leading: Icon(Icons.money_sharp,color: Colors.grey,),
              ),
            ),

            InkWell(
              onTap: (){
                Navigator.push(context,MaterialPageRoute(builder: (context)=>LocationPage()));
              },
              child: ListTile(
                title: Text('Locations'),
                leading: Icon(Icons.location_on,color: Colors.grey,),
              ),
            ),

            InkWell(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>Favourites()));
              },
              child: ListTile(
                title: Text('Favourites'),
                leading: Icon(Icons.favorite,color: Colors.grey,),
              ),
            ),

            Divider(
              //height:0.005,
              color:Colors.grey,),

            InkWell(
              onTap: (){
                Navigator.push(context,MaterialPageRoute(builder: (context)=>MySettingsPage()));
              },
              child: ListTile(
                title: Text('Settings'),
                leading: Icon(Icons.settings,color: Colors.green,),
              ),
            ),

            InkWell(
              onTap: (){},
              child: ListTile(
                title: Text('About'),
                leading: Icon(Icons.help,color: Colors.green,),
              ),
            ),

            InkWell(
              onTap: (){},
              child: ListTile(
                title: Text('Assistant'),
                leading: Icon(Icons.chat_sharp,color: Colors.green,),
              ),
            ),

            InkWell(
              onTap: (){},
              child: ListTile(
                title: Text('Indian Army and Paramilitary Section'),
                leading: Icon(Icons.chat_sharp,color: Colors.green,),
              ),
            ),

          ],
        ),
      ),
      body: ListView(
        children: [
          MainCarousel(),//Main Carousel

          Padding(padding:EdgeInsets.all(10.0),//Categories Text
            child:Text("Categories"),),

          HorizontalListView(),//Horizontal Components Scrolling Widget

          Padding(padding: EdgeInsets.all(10.0),child: Text("Recent Products"),),//Recent Products Text

          Container(
            height:300.0,
            child:Flexible(child: Product_List()),
          ),

        ],
      ),

      bottomNavigationBar: BottomAppBar(
        elevation:0.1,
        color: Colors.green,
        child:Container(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              IconButton(onPressed: (){},icon:Icon(Icons.home)),
              IconButton(onPressed: (){},icon:Icon(Icons.card_giftcard,size:35.0,)),
              IconButton(onPressed: (){
                Navigator.push(context,MaterialPageRoute(builder: (context)=>MyAccountPage()));
              },icon:Icon(Icons.person))
            ],
          ),
        ),
      ),
    );
  }
}












