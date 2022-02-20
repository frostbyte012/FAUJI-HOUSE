import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fauji_house_app_new/Pages/LoginPageNew.dart';
import 'package:fauji_house_app_new/model/user_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class MyAccountPage extends StatefulWidget {
  const MyAccountPage({Key key}) : super(key: key);

  @override
  _MyAccountPageState createState() => _MyAccountPageState();
}

class _MyAccountPageState extends State<MyAccountPage> {


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
      appBar: AppBar(
        elevation: 0.1,
        backgroundColor:Colors.green,
        title:Text("My Profile"),
      ),


      body:ListView(
        children: [
          Container(
            height: 230,
            color: Colors.green,
            child:Column(
              children: [

                Padding(
                  padding:EdgeInsets.fromLTRB(0,25,0,5),
                  child: Center(
                    child:loggedInUser.profilePicURl==null?CircleAvatar(
                      backgroundColor:Colors.grey,
                      child: Icon(Icons.person,color: Colors.white,
                      ),
                    ):CircleAvatar(
                      backgroundImage:NetworkImage("${loggedInUser.profilePicURl}",),
                      maxRadius:75.0,
                      backgroundColor:Colors.black,
                    ),
                  ),
                ),

                Padding(
                  padding:EdgeInsets.fromLTRB(0,10,0,0),
                  child:Text('${loggedInUser.firstName} ${loggedInUser.secondName}',style: TextStyle(color:Colors.white,fontSize:20),),),

              ],
            ),
          ),

          Card(
            child:ListTile(
              title:Text("User Name : ",style:TextStyle(fontWeight: FontWeight.bold),),
              subtitle: Text("${loggedInUser.userName}"),
            ),
            elevation: 0.1,
          ),

          Card(
            child:ListTile(
              title:Text("Email : ",style:TextStyle(fontWeight: FontWeight.bold),),
              subtitle: Text('${loggedInUser.email}'),
            ),
            elevation: 0.1,
          ),

          Padding(
            padding: EdgeInsets.fromLTRB(80,30,80,0),
            child: MaterialButton(
              elevation: 0.1,
               color: Colors.green,
               child: Text("Log Out",style: TextStyle(color: Colors.white),),
               onPressed: (){
                logout(context);
                }),
          )

        ],

      ),


    );

  }

  Future<void> logout (BuildContext context) async{
    await FirebaseAuth.instance.signOut();
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>LoginScreen()));

  }

}
