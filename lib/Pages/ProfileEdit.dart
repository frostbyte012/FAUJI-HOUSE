import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ProfileEditingPage extends StatefulWidget {
  final String uid;
  const ProfileEditingPage({
    this.uid,
});

  @override
  _ProfileEditingPageState createState() => _ProfileEditingPageState();
}

enum WorkingStatus {Active, Inactive}

class _ProfileEditingPageState extends State<ProfileEditingPage> {

  File _image;
  final imagePicker= ImagePicker();
  String downPictureURl;

  TextEditingController _inputvalueUserName = new TextEditingController();
  TextEditingController _inputvalueEmail = new TextEditingController();
  TextEditingController _inputvalueDOB = new TextEditingController();
  TextEditingController _inputvalueContactNumber = new TextEditingController();
  TextEditingController _inputvalueAddress = new TextEditingController();
  TextEditingController _inputvalueCurrentState = new TextEditingController();
  TextEditingController _inputvalueHomeState = new TextEditingController();
  TextEditingController _inputvalueFamilyMembers = new TextEditingController();


  WorkingStatus _character = WorkingStatus.Active;

  Future imagePickerMethod () async {

    final pic= await imagePicker.pickImage(source: ImageSource.gallery);

    setState(() {

      if (pic!=null){

        _image=File(pic.path);
      }

      else{
        //displaying a snakbar
         snakBar("No File Selected",Duration(milliseconds: 400));
      }

    });
  }

  snakBar(String snakBarText, Duration d){

    final snakBar=SnackBar(content:Text("${snakBarText}"), duration: d);
    ScaffoldMessenger.of(context).showSnackBar(snakBar);

  }

  Future uploadImage() async {

    FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
    Reference ref= FirebaseStorage.instance.ref().child("${widget.uid}/images").child("profile_picture_${DateTime.now().microsecondsSinceEpoch.toString()}");
    try {
      await ref.putFile(_image);
      downPictureURl= await ref.getDownloadURL();
      // print(downPictureURl);
      await firebaseFirestore.collection("users").doc("${widget.uid}").collection("details").doc("detailsofuser").update({"profilePicURl":'${downPictureURl}'},);
    } on FirebaseException catch (e) {
      print(e);
    }



  }


  Future updatingTheUserDetails(String key,String value) async{
    FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
    await firebaseFirestore.collection("users").doc("${widget.uid}").collection("details").doc("detailsofuser").update({"${key}":"${value}",},);
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.1,
        backgroundColor:Colors.green,
        title:Text('Profile Edit'),
      ),

      body:ListView(
        children: [
          Divider(),

          Padding(
            padding: EdgeInsets.fromLTRB(10,10,10,10),
            child:Text("User Name:"),),

          Padding(
            padding: EdgeInsets.fromLTRB(5,5,10,5),
            child: Container(
              decoration:BoxDecoration(
                color:Colors.black12,
                border:Border.all(color: Colors.green),
                borderRadius:BorderRadius.circular(10.0),
              ),
              height:60,
              width: 90,
              child:Padding(
                padding:EdgeInsets.fromLTRB(5,0,0,0),
                child: TextFormField(

                  decoration: InputDecoration(
                    labelText: "Enter User Name.",
                    labelStyle:TextStyle(color:Colors.green),
                    border:InputBorder.none,
                    //border:OutLineInputBorder or UnderLineInputBorder or InputBorder.none
                    // hintText: can be used
                    // hintStyle can be used for the styling of the hintText,
                    //filledColor:
                    //errorText:null, used for error message display
                    //filled:true
                    // prefixIcon: For Icons before text can hold any widget including the buttons as well,
                    // suffixIcon: For Icons after text can hold any widget including the buttons as well,
                  ),
                  // keyboardType: TextInputType.emailAddress can be used,
                  //obsecureText: true or false for password visibility
                  maxLength:10,
                  maxLines:1,
                  controller: _inputvalueUserName,
                  validator: (value) {
                    RegExp regex = new RegExp(r'^.{1,}$');
                    if (value.isEmpty) {
                      return ("User Name cannot be empty");
                    }
                    if (!regex.hasMatch(value)) {
                      return ("Enter Valid User Name");
                    }
                  },
                  onSaved: (value){
                    _inputvalueUserName.text=value;
                  },
                ),
              ),
            ),
          ),


          Divider(),

          Padding(
            padding: EdgeInsets.fromLTRB(10,10,10,10),
            child:Text("Email:"),),

          Padding(
            padding: EdgeInsets.fromLTRB(5,5,10,5),
            child: Container(
              decoration:BoxDecoration(
                color:Colors.black12,
                border:Border.all(color: Colors.green),
                borderRadius:BorderRadius.circular(10.0),
              ),
              height:60,
              width: 90,
              child:Padding(
                padding:EdgeInsets.fromLTRB(5,0,0,0),
                child: TextFormField(

                  decoration: InputDecoration(
                    labelText: "Enter Email.",
                    labelStyle:TextStyle(color:Colors.green),
                    border:InputBorder.none,
                    //border:OutLineInputBorder or UnderLineInputBorder or InputBorder.none
                    // hintText: can be used
                    // hintStyle can be used for the styling of the hintText,
                    //filledColor:
                    //errorText:null, used for error message display
                    //filled:true
                    // prefixIcon: For Icons before text can hold any widget including the buttons as well,
                    // suffixIcon: For Icons after text can hold any widget including the buttons as well,
                  ),
                  keyboardType: TextInputType.emailAddress,
                  //obsecureText: true or false for password visibility
                  maxLength:50,
                  maxLines:1,
                  controller: _inputvalueEmail,
                  validator: (value){
                    if(value.isEmpty){
                      return ("Please enter your email");
                    }
                    if(!RegExp("^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]")
                        .hasMatch(value)){
                      return ("Please Enter a valid email");
                    }

                    return null;
                  },
                  onSaved: (value){
                    _inputvalueEmail.text=value;
                  },
                ),
              ),
            ),
          ),

          Divider(),

          Padding(
            padding: EdgeInsets.fromLTRB(10,10,10,10),
            child:Text("Date of Birth:"),),

          Padding(
            padding: EdgeInsets.fromLTRB(5,5,10,5),
            child: Container(
              decoration:BoxDecoration(
                color:Colors.black12,
                border:Border.all(color: Colors.green),
                borderRadius:BorderRadius.circular(10.0),
              ),
              height:60,
              width: 90,
              child:Padding(
                padding:EdgeInsets.fromLTRB(5,0,0,0),
                child: TextFormField(

                  decoration: InputDecoration(
                    labelText: "Enter Date Of Birth.",
                    labelStyle:TextStyle(color:Colors.green),
                    border:InputBorder.none,
                    //border:OutLineInputBorder or UnderLineInputBorder or InputBorder.none
                    // hintText: can be used
                    // hintStyle can be used for the styling of the hintText,
                    //filledColor:
                    //errorText:null, used for error message display
                    //filled:true
                    // prefixIcon: For Icons before text can hold any widget including the buttons as well,
                    // suffixIcon: For Icons after text can hold any widget including the buttons as well,
                  ),
                  keyboardType: TextInputType.datetime,
                  //obsecureText: true or false for password visibility
                  maxLength:10,
                  maxLines:1,
                  controller: _inputvalueDOB,
                  validator: (value) {
                    RegExp regex = new RegExp(r'^.{1,}$');
                    if (value.isEmpty) {
                      return ("DOB cannot be empty");
                    }
                    if (!regex.hasMatch(value)) {
                      return ("Enter Valid DOB");
                    }
                  },
                  onSaved: (value){
                    _inputvalueDOB.text=value;
                  },
                ),
              ),
            ),
          ),


          Divider(),

          Padding(
            padding: EdgeInsets.fromLTRB(10,10,10,10),
            child:Text("Contact Number:"),),

          Padding(
            padding: EdgeInsets.fromLTRB(5,5,10,5),
            child: Container(
              decoration:BoxDecoration(
                color:Colors.black12,
                border:Border.all(color: Colors.green),
                borderRadius:BorderRadius.circular(10.0),
              ),
              height:60,
              width: 90,
              child:Padding(
                padding:EdgeInsets.fromLTRB(5,0,0,0),
                child: TextFormField(

                  decoration: InputDecoration(
                    labelText: "Enter Contact Number.",
                    labelStyle:TextStyle(color:Colors.green),
                    border:InputBorder.none,
                    //border:OutLineInputBorder or UnderLineInputBorder or InputBorder.none
                    // hintText: can be used
                    // hintStyle can be used for the styling of the hintText,
                    //filledColor:
                    //errorText:null, used for error message display
                    //filled:true
                    // prefixIcon: For Icons before text can hold any widget including the buttons as well,
                    // suffixIcon: For Icons after text can hold any widget including the buttons as well,
                  ),
                  keyboardType: TextInputType.number,
                  //obsecureText: true or false for password visibility
                  maxLength:10,
                  maxLines:1,
                  controller: _inputvalueContactNumber,
                  validator: (value) {
                    RegExp regex = new RegExp(r'^.{10,}$');
                    if (value.isEmpty) {
                      return ("Phone Number cannot be empty");
                    }
                    if (!regex.hasMatch(value)) {
                      return ("Enter Valid Phone Number");
                    }
                  },
                  onSaved: (value){
                    _inputvalueContactNumber.text=value;
                  },
                ),
              ),
            ),
          ),


          Divider(),

          Padding(
            padding: EdgeInsets.fromLTRB(10,10,10,10),
            child:Text("Enter Address:"),),

          Padding(
            padding: EdgeInsets.fromLTRB(5,5,10,5),
            child: Container(
              decoration:BoxDecoration(
                color:Colors.black12,
                border:Border.all(color: Colors.green),
                borderRadius:BorderRadius.circular(10.0),
              ),
              height:60,
              width: 90,
              child:Padding(
                padding:EdgeInsets.fromLTRB(5,0,0,0),
                child: TextFormField(

                  decoration: InputDecoration(
                    labelText: "Enter Address.",
                    labelStyle:TextStyle(color:Colors.green),
                    border:InputBorder.none,
                    //border:OutLineInputBorder or UnderLineInputBorder or InputBorder.none
                    // hintText: can be used
                    // hintStyle can be used for the styling of the hintText,
                    //filledColor:
                    //errorText:null, used for error message display
                    //filled:true
                    // prefixIcon: For Icons before text can hold any widget including the buttons as well,
                    // suffixIcon: For Icons after text can hold any widget including the buttons as well,
                  ),
                  // keyboardType: TextInputType.number
                  //obsecureText: true or false for password visibility
                  maxLength:250,
                  maxLines:1,
                  controller: _inputvalueAddress,
                  validator: (value) {
                    RegExp regex = new RegExp(r'^.{10,}$');
                    if (value.isEmpty) {
                      return ("Address cannot be empty");
                    }
                    if (!regex.hasMatch(value)) {
                      return ("Enter Proper Adrress");
                    }
                  },
                  onSaved: (value){
                    _inputvalueAddress.text=value;
                  },
                ),
              ),
            ),
          ),

          Divider(),

          Padding(
            padding: EdgeInsets.fromLTRB(10,10,10,10),
            child:Text("Enter Family Members:"),),

          Padding(
            padding: EdgeInsets.fromLTRB(5,5,10,5),
            child: Container(
              decoration:BoxDecoration(
                color:Colors.black12,
                border:Border.all(color: Colors.green),
                borderRadius:BorderRadius.circular(10.0),
              ),
              height:60,
              width: 90,
              child:Padding(
                padding:EdgeInsets.fromLTRB(5,0,0,0),
                child: TextFormField(

                  decoration: InputDecoration(
                    labelText: "Enter Family Members.",
                    labelStyle:TextStyle(color:Colors.green),
                    border:InputBorder.none,
                    //border:OutLineInputBorder or UnderLineInputBorder or InputBorder.none
                    // hintText: can be used
                    // hintStyle can be used for the styling of the hintText,
                    //filledColor:
                    //errorText:null, used for error message display
                    //filled:true
                    // prefixIcon: For Icons before text can hold any widget including the buttons as well,
                    // suffixIcon: For Icons after text can hold any widget including the buttons as well,
                  ),
                  keyboardType: TextInputType.number,
                  //obsecureText: true or false for password visibility
                  maxLength:3,
                  maxLines:1,
                  controller: _inputvalueFamilyMembers,
                  validator: (value) {
                    RegExp regex = new RegExp(r'^.{1,}$');
                    if (value.isEmpty) {
                      return ("family members cannot be empty");
                    }
                    if (!regex.hasMatch(value)) {
                      return ("family members cannot be empty");
                    }
                  },
                  onSaved: (value){
                    _inputvalueFamilyMembers.text=value;
                  },

                ),
              ),
            ),
          ),


          Divider(),

          Padding(
            padding: EdgeInsets.fromLTRB(10,10,10,10),
            child:Text("Working Status:"),),


          Padding(padding: EdgeInsets.fromLTRB(0,5,5,5),
            child: Column(
              children: <Widget>[
                ListTile(
                  title: const Text('Active'),
                  leading: Radio<WorkingStatus>(
                    value: WorkingStatus.Active,
                    groupValue: _character,
                    onChanged: (WorkingStatus value) {
                      setState(() {
                        _character = value;
                      });
                    },
                  ),
                ),
                ListTile(
                  title: const Text('Inactive'),
                  leading: Radio<WorkingStatus>(
                    value: WorkingStatus.Inactive,
                    groupValue: _character,
                    onChanged: (WorkingStatus value) {
                      setState(() {
                        _character = value;
                      });
                    },
                  ),
                ),
              ],
            ),
          ),


          Divider(),

          Padding(
            padding: EdgeInsets.fromLTRB(10,10,10,10),
            child:Text("Current State:"),),

          Padding(
            padding: EdgeInsets.fromLTRB(5,5,10,5),
            child: Container(
              decoration:BoxDecoration(
                color:Colors.black12,
                border:Border.all(color: Colors.green),
                borderRadius:BorderRadius.circular(10.0),
              ),
              height:60,
              width: 90,
              child:Padding(
                padding:EdgeInsets.fromLTRB(5,0,0,0),
                child: TextFormField(

                  decoration: InputDecoration(
                    labelText: "Enter Current State.",
                    labelStyle:TextStyle(color:Colors.green),
                    border:InputBorder.none,
                    //border:OutLineInputBorder or UnderLineInputBorder or InputBorder.none
                    // hintText: can be used
                    // hintStyle can be used for the styling of the hintText,
                    //filledColor:
                    //errorText:null, used for error message display
                    //filled:true
                    // prefixIcon: For Icons before text can hold any widget including the buttons as well,
                    // suffixIcon: For Icons after text can hold any widget including the buttons as well,
                  ),
                  // keyboardType: TextInputType.number
                  //obsecureText: true or false for password visibility
                  maxLength:60,
                  maxLines:1,
                  controller: _inputvalueCurrentState,
                  validator: (value) {
                    RegExp regex = new RegExp(r'^.{2,}$');
                    if (value.isEmpty) {
                      return ("Current State cannot be empty");
                    }
                    if (!regex.hasMatch(value)) {
                      return ("Current Valid home state");
                    }
                  },
                  onSaved: (value){
                    _inputvalueCurrentState.text=value;
                  },
                ),
              ),
            ),
          ),


          Divider(),

          Padding(
            padding: EdgeInsets.fromLTRB(10,10,10,10),
            child:Text("Home State:"),),

          Padding(
            padding: EdgeInsets.fromLTRB(5,5,10,5),
            child: Container(
              decoration:BoxDecoration(
                color:Colors.black12,
                border:Border.all(color: Colors.green),
                borderRadius:BorderRadius.circular(10.0),
              ),
              height:60,
              width: 90,
              child:Padding(
                padding:EdgeInsets.fromLTRB(5,0,0,0),
                child: TextFormField(

                  decoration: InputDecoration(
                    labelText: "Enter Home State.",
                    labelStyle:TextStyle(color:Colors.green),
                    border:InputBorder.none,
                    //border:OutLineInputBorder or UnderLineInputBorder or InputBorder.none
                    // hintText: can be used
                    // hintStyle can be used for the styling of the hintText,
                    //filledColor:
                    //errorText:null, used for error message display
                    //filled:true
                    // prefixIcon: For Icons before text can hold any widget including the buttons as well,
                    // suffixIcon: For Icons after text can hold any widget including the buttons as well,
                  ),
                  // keyboardType: TextInputType.number
                  //obsecureText: true or false for password visibility
                  maxLength:60,
                  maxLines:1,
                  controller: _inputvalueHomeState,
                  validator: (value) {
                    RegExp regex = new RegExp(r'^.{2,}$');
                    if (value.isEmpty) {
                      return ("Home State cannot be empty");
                    }
                    if (!regex.hasMatch(value)) {
                      return ("Enter Valid home state");
                    }
                  },
                  onSaved: (value){
                    _inputvalueHomeState.text=value;
                  },
                ),
              ),
            ),
          ),


          Divider(),

          Padding(
            padding: EdgeInsets.fromLTRB(10,10,10,10),
            child:Text("Profile Picture:"),),

          Padding(
            padding: EdgeInsets.fromLTRB(10,10,10,10),
            child:_image==null?Text("No Image Selected"):Text("Selected ${_image.path}")),

          Padding(
            padding: EdgeInsets.fromLTRB(10,30,100,0),
            child: MaterialButton(
                elevation: 0.1,
                color: Colors.green,
                child: Padding(
                  padding: EdgeInsets.fromLTRB(60,0,10,0),
                  child: Row(
                    children: const [
                      Text("Post Picture",style: TextStyle(color: Colors.white),),
                      SizedBox(width:10,),
                      Icon(Icons.camera_alt_outlined,color:Colors.white,),
                    ],
                  ),
                ),
                onPressed: (){
                  imagePickerMethod();
                }),
          ),


        ],
      ),

      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.green,
        child:Icon(Icons.save),
        onPressed: (){
          if(_image!=null){
            uploadImage().whenComplete(() => snakBar("Profile Picture uploaded successfully", Duration(milliseconds: 400)));
          }
          else{
            snakBar("No Image Selected", Duration(milliseconds: 500));
          }
          if(_inputvalueUserName.text!=null || _inputvalueEmail.text!=null || _inputvalueDOB.text!=null || _inputvalueContactNumber.text!=null || _inputvalueCurrentState.text!=null || _inputvalueHomeState.text!=null
            ||_inputvalueAddress.text!=null||_inputvalueFamilyMembers.text!=null){


            try{

              if(_inputvalueUserName.text!=""){updatingTheUserDetails("userName",_inputvalueUserName.text).whenComplete(() => snakBar("Username Updated",Duration(milliseconds: 500)));}
              if(_inputvalueEmail.text!=""){updatingTheUserDetails("email",_inputvalueEmail.text).whenComplete(() => snakBar("Email Updated",Duration(milliseconds: 500)));}
              if(_inputvalueContactNumber.text!=""){updatingTheUserDetails("phoneNumber",_inputvalueContactNumber.text).whenComplete(() => snakBar("Contact Number Updated",Duration(milliseconds: 500)));}
              if(_inputvalueFamilyMembers.text!=""){updatingTheUserDetails("familyMembers",_inputvalueFamilyMembers.text).whenComplete(() => snakBar("Family details Updated",Duration(milliseconds: 500)));}
              if(_inputvalueHomeState.text!=""){updatingTheUserDetails("homeState",_inputvalueHomeState.text).whenComplete(() => snakBar("Home State Updated",Duration(milliseconds: 500)));}
              if(_inputvalueCurrentState.text!=""){updatingTheUserDetails("currentState",_inputvalueCurrentState.text).whenComplete(() => snakBar("Current State Updated",Duration(milliseconds: 500)));}
              if(_inputvalueAddress.text!=""){updatingTheUserDetails("address",_inputvalueAddress.text).whenComplete(() => snakBar("Address Updated",Duration(milliseconds: 500)));}
              if(_inputvalueDOB.text!=""){updatingTheUserDetails("dateOfBirth",_inputvalueDOB.text).whenComplete(() => snakBar("Date of birth Updated",Duration(milliseconds: 500)));}
              //BUG HERE NEED TO IMPROVE THIS FUNCTION FOR ENUMS
              if(_character.toString()!=""){updatingTheUserDetails("workingStatus",_character.toString()).whenComplete(() => snakBar("Working Status Updated",Duration(milliseconds: 500)));}

            }on FirebaseException catch (e) {
              print(e);
            }


          }else{
            snakBar("No changes made", Duration(milliseconds: 500));
          }

          Navigator.pop(context);

        },
      ),
    );
   }
}

