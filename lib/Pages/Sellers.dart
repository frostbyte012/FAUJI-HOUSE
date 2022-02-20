import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fauji_house_app_new/model/sale_model.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';

class SellersPage extends StatefulWidget {



  final String uid;
  const SellersPage(
      {
        this.uid,
      }
    );

  @override
  _SellersPageState createState() => _SellersPageState();
}

enum PropertyType { Sell, Rent }

enum PropertyFinishType { Furnished, Semi, Unfurnished }

class _SellersPageState extends State<SellersPage> {


  File _image;
  String DownloadURL;

  ImagePicker imagePicker=ImagePicker();
  FirebaseFirestore firebaseFirestore=FirebaseFirestore.instance;
  final uniquePostID=UniqueKey().toString();


  TextEditingController _inputvaluePropertyName = new TextEditingController();
  TextEditingController _inputvalueOwnername = new TextEditingController();
  TextEditingController _inputvaluePropertyAddress = new TextEditingController();
  TextEditingController _inputvaluePropertyDescription = new TextEditingController();
  TextEditingController _inputvaluePropertyPrice = new TextEditingController();
  TextEditingController _inputvaluePropertyLocation = new TextEditingController();
  TextEditingController _inputvalueParkingSpace = new TextEditingController();
  TextEditingController _inputvaluelandMarks = new TextEditingController();
  TextEditingController _inputvaluePropertyFinishType = new TextEditingController();
  TextEditingController _inputvalueGatesForEntry = new TextEditingController();
  TextEditingController _inputvalueGarage = new TextEditingController();
  TextEditingController _inputvaluePropertyFacing = new TextEditingController();
  TextEditingController _inputvalueEntrances = new TextEditingController();
  TextEditingController _inputvalueBoundaryWall = new TextEditingController();
  TextEditingController _inputvaluePropertyBalcony = new TextEditingController();
  TextEditingController _inputvalueAreaInSquareFits = new TextEditingController();
  TextEditingController _inputvalueWashrooms = new TextEditingController();
  TextEditingController _inputvalueKitchens = new TextEditingController();



  Future imagePickerMethod() async{

    ///SECOND METHOD TO POST AND TRIGGER

    final pic= await imagePicker.pickImage(source: ImageSource.gallery);

    setState(() {

      if(pic!=null){
        _image=File(pic.path);
      }
      else{
          snackbarMessage("No Image Selected", Duration(milliseconds: 500));
        }
      }
    );


  }


  snackbarMessage(String message,Duration d){

    final snackbar_Message=SnackBar(content: Text(message),duration: d);
    ScaffoldMessenger.of(context).showSnackBar(snackbar_Message);
  }


  Future uploadingSellerPropertyPicture() async {

    ///THIRD METHOD TO POST AND TRIGGER

    Reference ref= FirebaseStorage.instance.ref().child("${widget.uid}").child("sell").child("${uniquePostID}").child("${DateTime.now().microsecondsSinceEpoch.toString()}");

    try{
       await ref.putFile(_image);
       DownloadURL=await ref.getDownloadURL();
       //updating the common post database
       await firebaseFirestore.collection("products").doc("sell").collection("${widget.uid}").doc(uniquePostID).update({"propertyPic":'${DownloadURL}'}).whenComplete(() => snackbarMessage("Posted New Post", Duration(milliseconds: 500)));
       //updating the user post database
       await firebaseFirestore.collection("users").doc("${widget.uid}").collection("details").doc("posts").collection("sell").doc(uniquePostID).update({"propertyPic":'${DownloadURL}'}).whenComplete(() => snackbarMessage("Posted Images", Duration(milliseconds: 500)));

    }on FirebaseException catch (e){
      print(e);
    }

  }



  Future creatingANewSellPost() async {

    ///FIRST METHOD TO POST AND TRIGGER



    SaleModel saleModel= SaleModel();

    saleModel.uniqueID=widget.uid;
    saleModel.NoOfKitchens=_inputvalueKitchens.text;
    saleModel.NoWashRooms=_inputvalueWashrooms.text;
    saleModel.propertyName=_inputvaluePropertyName.text;
    saleModel.ownerName=_inputvalueOwnername.text;
    saleModel.propertyAddress=_inputvaluePropertyAddress.text;
    saleModel.propertyDescription=_inputvaluePropertyDescription.text;
    saleModel.propertyPrice=_inputvaluePropertyPrice.text;
    saleModel.propertyLocation=_inputvaluePropertyLocation.text;
    saleModel.parkingSpace=_inputvalueParkingSpace.text;
    saleModel.landMarks=_inputvaluelandMarks.text;
    saleModel.propertyFinishType=_inputvaluePropertyFinishType.text;
    saleModel.gatesForEntry=_inputvalueGatesForEntry.text;
    saleModel.garage=_inputvalueGarage.text;
    saleModel.facing=_inputvaluePropertyFacing.text;
    saleModel.entrances=_inputvalueEntrances.text;
    saleModel.boundaryWall=_inputvalueBoundaryWall.text;
    saleModel.balcony=_inputvaluePropertyBalcony.text;
    saleModel.areaInSquareFits=_inputvalueAreaInSquareFits.text;
    saleModel.NoWashRooms=_inputvalueWashrooms.text;
    saleModel.NoOfKitchens=_inputvalueKitchens.text;
    saleModel.uniquePostID=uniquePostID;

    ////adding details to sell database
    await firebaseFirestore.collection("sell").doc(uniquePostID).set(saleModel.toMap());
    ////adding details to user database
    await firebaseFirestore.collection("users").doc("${widget.uid}").collection("details").doc("posts").collection("sell").doc(uniquePostID).set(saleModel.toMap());

    Fluttertoast.showToast(msg: "Posted Details");

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.1,
        backgroundColor:Colors.green,
        title:Text('Selling'),
      ),

      body:ListView(
        children: [
          Divider(),

          Padding(
            padding: EdgeInsets.fromLTRB(10,10,10,10),
            child:Text("Property Name:"),),

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
                    labelText: "Enter Property Name.",
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
                  maxLength:25,
                  maxLines:1,
                  controller: _inputvaluePropertyName,
                ),
              ),
            ),
          ),


          Divider(),

          Padding(
            padding: EdgeInsets.fromLTRB(10,10,10,10),
            child:Text("Owner Name:"),),

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
                    labelText: "Enter Owner Name.",
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
                  maxLength:25,
                  maxLines:1,
                  controller: _inputvalueOwnername,
                ),
              ),
            ),
          ),

          Divider(),

          Padding(
            padding: EdgeInsets.fromLTRB(10,10,10,10),
            child:Text("Property Address:"),),

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
                    labelText: "Enter Property Address.",
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
                  maxLength:100,
                  maxLines:1,
                  controller: _inputvaluePropertyAddress,
                ),
              ),
            ),
          ),


          Divider(),

          Padding(
            padding: EdgeInsets.fromLTRB(10,10,10,10),
            child:Text("Property Description:"),),

          Padding(
            padding: EdgeInsets.fromLTRB(5,5,10,5),
            child: Container(
              decoration:BoxDecoration(
                color:Colors.black12,
                border:Border.all(color: Colors.green),
                borderRadius:BorderRadius.circular(10.0),
              ),
              height:150,
              width: 90,
              child:Padding(
                padding:EdgeInsets.fromLTRB(5,0,0,0),
                child: TextFormField(

                  decoration: InputDecoration(
                    labelText: "Enter Property Description.",
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
                  maxLength:200,
                  maxLines:10,
                  controller: _inputvaluePropertyDescription,
                ),
              ),
            ),
          ),


          Divider(),

          Padding(
            padding: EdgeInsets.fromLTRB(10,10,10,10),
            child:Text("Property Price:"),),

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
                    labelText: "Enter Property Price in INR.",
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
                  controller: _inputvaluePropertyPrice,
                ),
              ),
            ),
          ),

          Divider(),


          Padding(
            padding: EdgeInsets.fromLTRB(10,10,10,10),
            child:Text("Property Location:"),),

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
                    labelText: "Enter Property Location.",
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
                  maxLength:25,
                  maxLines:1,
                  controller: _inputvaluePropertyLocation,
                ),
              ),
            ),
          ),


          Divider(),

          Padding(
            padding: EdgeInsets.fromLTRB(10,10,10,10),
            child:Text("Property Parking Space:"),),

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
                    labelText: "Enter Property Parking Space. [Yes/No]",
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
                  maxLength:25,
                  maxLines:1,
                  controller: _inputvalueParkingSpace,
                ),
              ),
            ),
          ),


          Divider(),



          Padding(
            padding: EdgeInsets.fromLTRB(10,10,10,10),
            child:Text("Property Land Mark:"),),

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
                    labelText: "Enter Property Land Mark. eg near Taj Mahal",
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
                  maxLength:25,
                  maxLines:1,
                  controller: _inputvaluelandMarks,
                ),
              ),
            ),
          ),

          Divider(),



          Padding(
            padding: EdgeInsets.fromLTRB(10,10,10,10),
            child:Text("No. Gates For Entry:"),),

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
                    labelText: "Enter No. of gates for entry.",
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
                  maxLength:25,
                  maxLines:1,
                  controller: _inputvalueGatesForEntry,
                ),
              ),
            ),
          ),



          Divider(),



          Padding(
            padding: EdgeInsets.fromLTRB(10,10,10,10),
            child:Text("Property Finish Type:"),),

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
                    labelText: "Furnished/Semi-Furnished/Un-Furnished",
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
                  maxLength:25,
                  maxLines:1,
                  controller: _inputvaluePropertyFinishType,
                ),
              ),
            ),
          ),


          Divider(),

          Padding(
            padding: EdgeInsets.fromLTRB(10,10,10,10),
            child:Text("Property Garage numbers:"),),

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
                    labelText: "Enter No, of Property Garage.",
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
                  maxLength:25,
                  maxLines:1,
                  controller: _inputvalueGarage,
                ),
              ),
            ),
          ),

          Divider(),

          Padding(
            padding: EdgeInsets.fromLTRB(10,10,10,10),
            child:Text("Property Entrances:"),),

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
                    labelText: "Enter No. of Property entrances.",
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
                  maxLength:25,
                  maxLines:1,
                  controller: _inputvalueEntrances,
                ),
              ),
            ),
          ),



          Divider(),



          Padding(
            padding: EdgeInsets.fromLTRB(10,10,10,10),
            child:Text("Property Facing Type:"),),

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
                    labelText: "North/South/East/West.",
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
                  maxLength:25,
                  maxLines:1,
                  controller: _inputvaluePropertyFacing,
                ),
              ),
            ),
          ),




          Divider(),



          Padding(
            padding: EdgeInsets.fromLTRB(10,10,10,10),
            child:Text("Property Boundary Wall:"),),

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
                    labelText: "Yes/No.",
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
                  maxLength:25,
                  maxLines:1,
                  controller: _inputvalueBoundaryWall,
                ),
              ),
            ),
          ),



          Divider(),



          Padding(
            padding: EdgeInsets.fromLTRB(10,10,10,10),
            child:Text("Property No. of Balcony:"),),

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
                    labelText: "Enter Property No of Baclony.",
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
                  maxLength:25,
                  maxLines:1,
                  controller: _inputvaluePropertyBalcony,
                ),
              ),
            ),
          ),

          Divider(),


          Padding(
            padding: EdgeInsets.fromLTRB(10,10,10,10),
            child:Text("Property Area in Square fits:"),),

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
                    labelText: "Enter Property Area in sq fts.",
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
                  maxLength:25,
                  maxLines:1,
                  controller: _inputvalueAreaInSquareFits,
                ),
              ),
            ),
          ),


          Divider(),

          Padding(
            padding: EdgeInsets.fromLTRB(10,10,10,10),
            child:Text("Washrooms:"),),

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
                    labelText: "Enter No. of Washrooms.",
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
                  maxLength:25,
                  maxLines:1,
                  controller: _inputvalueWashrooms,
                ),
              ),
            ),
          ),



          Divider(),



          Padding(
            padding: EdgeInsets.fromLTRB(10,10,10,10),
            child:Text("Kitchens:"),),

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
                    labelText: "Enter No. of kitchens.",
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
                  maxLength:25,
                  maxLines:1,
                  controller: _inputvalueKitchens,
                ),
              ),
            ),
          ),


          Divider(),

          Padding(
            padding: EdgeInsets.fromLTRB(10,10,10,10),
            child:Text("Property Pictures:"),),

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
        child:Icon(Icons.arrow_forward),
        onPressed: (){

          creatingANewSellPost();
          uploadingSellerPropertyPicture().whenComplete(() => Navigator.pop(context));


        },
      ),
    );
  }
}
