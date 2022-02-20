import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fauji_house_app_new/Pages/ProfileEdit.dart';
import 'package:fauji_house_app_new/model/user_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';


class MyProfilePage extends StatefulWidget {
  const MyProfilePage({Key key}) : super(key: key);

  @override
  _MyProfilePageState createState() => _MyProfilePageState();
}

class _MyProfilePageState extends State<MyProfilePage> {

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
        title:Text("My Accout"),
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

          Card(
            child:ListTile(
              title:Text("Date Of Birth: ",style:TextStyle(fontWeight: FontWeight.bold),),
              subtitle: Text("${loggedInUser.dateOfBirth}"),
            ),
            elevation: 0.1,
          ),

          Card(
            child:ListTile(
              title:Text("Contact Number : ",style:TextStyle(fontWeight: FontWeight.bold),),
              subtitle: Text("${loggedInUser.phoneNumber}"),
            ),
            elevation: 0.1,
          ),

          Card(
            child:ListTile(
              title:Text("Address : ",style:TextStyle(fontWeight: FontWeight.bold),),
              subtitle: Text("${loggedInUser.address}"),
            ),
            elevation: 0.1,
          ),

          Card(
            child:ListTile(
              title:Text("Working Status: ",style:TextStyle(fontWeight: FontWeight.bold),),
              subtitle: Text("${loggedInUser.workingStatus}"),
            ),
            elevation: 0.1,
          ),

          Card(
            child:ListTile(
              title:Text("Family Members: ",style:TextStyle(fontWeight: FontWeight.bold),),
              subtitle: Text("${loggedInUser.familyMembers}"),
            ),
            elevation: 0.1,
          ),

          Card(
            child:ListTile(
              title:Text("Veteran Status: ",style:TextStyle(fontWeight: FontWeight.bold),),
              subtitle: Text(loggedInUser.workingStatus=="Yes"?"No":"Yes"),
            ),
            elevation: 0.1,
          ),

          Card(
            child:ListTile(
              title:Text("Current State: ",style:TextStyle(fontWeight: FontWeight.bold),),
              subtitle: Text("${loggedInUser.currentState}"),
            ),
            elevation: 0.1,
          ),

          Card(
            child:ListTile(
              title:Text("Home State: ",style:TextStyle(fontWeight: FontWeight.bold),),
              subtitle: Text("${loggedInUser.homeState}"),
            ),
            elevation: 0.1,
          ),
        ],
      ),

      floatingActionButton:FloatingActionButton(
       onPressed: (){
         Navigator.push(context,MaterialPageRoute(builder: (context)=>ProfileEditingPage(uid:loggedInUser.uid,)));
       },
        backgroundColor:Colors.green,
        child:Icon(Icons.edit),

       ),


      );

  }
}
