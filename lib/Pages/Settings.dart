import 'package:fauji_house_app_new/Pages/ProfileEdit.dart';
import 'package:flutter/material.dart';

class MySettingsPage extends StatefulWidget {
  const MySettingsPage({Key key}) : super(key: key);

  @override
  _MySettingsPageState createState() => _MySettingsPageState();
}

enum LanguageSupport {EnglishUSA}

class _MySettingsPageState extends State<MySettingsPage> {

  LanguageSupport _character = LanguageSupport.EnglishUSA;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.1,
        backgroundColor:Colors.green,
        title:Text("Settings"),
      ),


      body:ListView(
        children: [

          InkWell(
            onTap: (){
              Navigator.push(context,MaterialPageRoute(builder: (context)=>ProfileEditingPage()));
            },
            child: Card(
              child:ListTile(
                title:Text("Profile: ",style:TextStyle(fontWeight: FontWeight.bold),),
                subtitle: Text("Edit Profile"),
              ),
              elevation: 0.1,
            ),
          ),

          Card(
            child:Column(
              children: [
                ListTile(
                  title:Text("Language : ",style:TextStyle(fontWeight: FontWeight.bold),),
                  subtitle: Text("Change language"),
                ),

                Divider(),

                Column(
                  children: <Widget>[
                    ListTile(
                      title: const Text('English USA'),
                      leading: Radio<LanguageSupport>(
                        value: LanguageSupport.EnglishUSA,
                        groupValue: _character,
                        onChanged: (LanguageSupport value) {
                          setState(() {
                            _character = value;
                          });
                        },
                      ),
                    ),
                  ],
                ),

              ],
            ),
            elevation: 0.1,
          ),

          InkWell(
            onTap: (){},
            child: Card(
              child:ListTile(
                title:Text("Giftcards : ",style:TextStyle(fontWeight: FontWeight.bold),),
                subtitle: Text("Gift Card Settings"),
              ),
              elevation: 0.1,
            ),
          ),


        ],

      ),


    );

  }
}
