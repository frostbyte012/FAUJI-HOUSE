//static pages import
import 'package:flutter/material.dart';
import 'package:fauji_house_app_new/Pages/homepage.dart';

//Model class import
import 'package:fauji_house_app_new/model/user_model.dart';

//services packages
import 'package:fluttertoast/fluttertoast.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';


//Classes for the main page
class RegistrationScreenPage extends StatefulWidget {
  const RegistrationScreenPage({Key key}) : super(key: key);

  @override
  _RegistrationScreenPageState createState() => _RegistrationScreenPageState();
}

class _RegistrationScreenPageState extends State<RegistrationScreenPage> {

  final _auth=FirebaseAuth.instance;

  final _formKey=GlobalKey<FormState>();

  final _firstNameController=new TextEditingController();
  final _secondNameController=new TextEditingController();
  final _emailController=new TextEditingController();
  final _passwordController=new TextEditingController();
  final _confirmPasswordController=new TextEditingController();
  final _userNameController=new TextEditingController();
  final _dateOfBirthController=new TextEditingController();
  final _phoneNumberController=new TextEditingController();
  final _addressController=new TextEditingController();
  final _workingStatusController=new TextEditingController();
  final _currentStateController=new  TextEditingController();
  final _homeStateController=new TextEditingController();
  final _familyMembersController=new TextEditingController();
  final _accountTypeController=new TextEditingController();




  bool _seePassword=true;
  bool _seePassword2=true;

  @override
  Widget build(BuildContext context) {


    final emailField=TextFormField(
      controller: _emailController,
      autofocus: false,
      textInputAction: TextInputAction.next,
      keyboardType:TextInputType.emailAddress,
      //validator: (){},
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
        _emailController.text=value;
      },

      decoration:InputDecoration(
        prefixIcon:Icon(Icons.email),
        hintText:"Email",
        contentPadding:EdgeInsets.fromLTRB(20,15,20,15),
        border:OutlineInputBorder(
          borderRadius:BorderRadius.circular(10),
        ),
      ),
    );

    final firstNameField=TextFormField(
      controller: _firstNameController,
      autofocus: false,
      textInputAction: TextInputAction.next,
      keyboardType:TextInputType.name,
      //validator: (){},
      validator: (value) {
        RegExp regex = new RegExp(r'^.{1,}$');
        if (value.isEmpty) {
          return ("First name cannot be empty");
        }
        if (!regex.hasMatch(value)) {
          return ("Enter Valid First Name");
        }
      },
      onSaved: (value){
        _firstNameController.text=value;
      },

      decoration:InputDecoration(
        prefixIcon:Icon(Icons.person),
        hintText:"First Name",
        contentPadding:EdgeInsets.fromLTRB(20,15,20,15),
        border:OutlineInputBorder(
          borderRadius:BorderRadius.circular(10),
        ),
      ),
    );

    final secondNameField=TextFormField(
      controller: _secondNameController,
      autofocus: false,
      textInputAction: TextInputAction.next,
      keyboardType:TextInputType.emailAddress,
      //validator: (){},
      validator: (value) {
        RegExp regex = new RegExp(r'^.{1,}$');
        if (value.isEmpty) {
          return ("Second Name cannot be empty");
        }
        if (!regex.hasMatch(value)) {
          return ("Second Name Valid First Name");
        }
      },
      onSaved: (value){
        _secondNameController.text=value;
      },

      decoration:InputDecoration(
        prefixIcon:Icon(Icons.person),
        hintText:"Second Name",
        contentPadding:EdgeInsets.fromLTRB(20,15,20,15),
        border:OutlineInputBorder(
          borderRadius:BorderRadius.circular(10),
        ),
      ),
    );

    final passwordField=TextFormField(
      controller: _passwordController,
      autofocus: false,
      textInputAction: TextInputAction.next,
      // validator: (){},
      validator: (value) {
        RegExp regex = new RegExp(r'^.{6,}$');
        if (value.isEmpty) {
          return ("Password is required for login");
        }
        if (!regex.hasMatch(value)) {
          return ("Enter Valid Password(Min. 6 Character)");
        }
      },
      onSaved: (value){
        _passwordController.text=value;
      },
      decoration:InputDecoration(
        prefixIcon: Icon(Icons.vpn_key),
        suffixIcon:IconButton(
          icon:Icon(Icons.visibility,),
          onPressed: (){

            setState(() {
              _seePassword=!_seePassword;
            }
            );

          },
        ),
        hintText: "Password",
        contentPadding: EdgeInsets.fromLTRB(20,15,20,20),
        border: OutlineInputBorder(
          borderRadius:BorderRadius.circular(10),
        ),
      ),
      obscureText: _seePassword,
    );

    final confirmPasswordField=TextFormField(
      controller: _confirmPasswordController,
      autofocus: false,
      textInputAction: TextInputAction.next,
      // validator: (){},
      validator: (value){
        if(_confirmPasswordController.text!= _passwordController.text){

          return "password don't match";

        }
        else{
          return null;
        }
      },
      onSaved: (value){
        _confirmPasswordController.text=value;
      },
      decoration:InputDecoration(
        prefixIcon: Icon(Icons.vpn_key),
        suffixIcon:IconButton(
          icon:Icon(Icons.visibility,),
          onPressed: (){

            setState(() {
              _seePassword2=!_seePassword2;
            }
            );

          },
        ),
        hintText: "Confirm Password",
        contentPadding: EdgeInsets.fromLTRB(20,15,20,20),
        border: OutlineInputBorder(
          borderRadius:BorderRadius.circular(10),
        ),
      ),
      obscureText: _seePassword2,
    );




    final userNameField=TextFormField(
      controller: _userNameController,
      autofocus: false,
      textInputAction: TextInputAction.next,
      keyboardType:TextInputType.name,
      //validator: (){},
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
        _userNameController.text=value;
      },

      decoration:InputDecoration(
        prefixIcon:Icon(Icons.person),
        hintText:"Unique user name",
        contentPadding:EdgeInsets.fromLTRB(20,15,20,15),
        border:OutlineInputBorder(
          borderRadius:BorderRadius.circular(10),
        ),
      ),
    );




    final dateOfBirthField=TextFormField(
      controller: _dateOfBirthController,
      autofocus: false,
      textInputAction: TextInputAction.next,
      keyboardType:TextInputType.datetime,
      //validator: (){},
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
        _dateOfBirthController.text=value;
      },

      decoration:InputDecoration(
        prefixIcon:Icon(Icons.person),
        hintText:"Date of Birth",
        contentPadding:EdgeInsets.fromLTRB(20,15,20,15),
        border:OutlineInputBorder(
          borderRadius:BorderRadius.circular(10),
        ),
      ),
    );


    final phoneNumberField=TextFormField(
      controller: _phoneNumberController,
      autofocus: false,
      textInputAction: TextInputAction.next,
      keyboardType:TextInputType.phone,
      //validator: (){},
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
        _phoneNumberController.text=value;
      },

      decoration:InputDecoration(
        prefixIcon:Icon(Icons.person),
        hintText:"Phone Number",
        contentPadding:EdgeInsets.fromLTRB(20,15,20,15),
        border:OutlineInputBorder(
          borderRadius:BorderRadius.circular(10),
        ),
      ),
    );

    final addressField=TextFormField(
      controller: _addressController,
      autofocus: false,
      textInputAction: TextInputAction.next,
      keyboardType:TextInputType.streetAddress,
      //validator: (){},
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
        _phoneNumberController.text=value;
      },

      decoration:InputDecoration(
        prefixIcon:Icon(Icons.map),
        hintText:"Address",
        contentPadding:EdgeInsets.fromLTRB(20,15,20,15),
        border:OutlineInputBorder(
          borderRadius:BorderRadius.circular(10),
        ),
      ),
    );



    final workingStatusField=TextFormField(
      controller: _workingStatusController,
      autofocus: false,
      textInputAction: TextInputAction.next,
      keyboardType:TextInputType.text,
      //validator: (){},
      validator: (value) {
        RegExp regex = new RegExp(r'^.{1,}$');
        if (value.isEmpty) {
          return ("Field cannot be empty");
        }
        if (!regex.hasMatch(value)) {
          return ("Choose Correctly");
        }
      },
      onSaved: (value){
        _workingStatusController.text=value;
      },

      decoration:InputDecoration(
        prefixIcon:Icon(Icons.person),
        hintText:"Working Status: Yes/No",
        contentPadding:EdgeInsets.fromLTRB(20,15,20,15),
        border:OutlineInputBorder(
          borderRadius:BorderRadius.circular(10),
        ),
      ),
    );



    final currentStateField=TextFormField(
      controller: _currentStateController,
      autofocus: false,
      textInputAction: TextInputAction.next,
      keyboardType:TextInputType.text,
      //validator: (){},
      validator: (value) {
        RegExp regex = new RegExp(r'^.{1,}$');
        if (value.isEmpty) {
          return ("Current cannot be empty");
        }
        if (!regex.hasMatch(value)) {
          return ("Current State cannot be empty");
        }
      },
      onSaved: (value){
        _currentStateController.text=value;
      },

      decoration:InputDecoration(
        prefixIcon:Icon(Icons.map),
        hintText:"Enter Current State",
        contentPadding:EdgeInsets.fromLTRB(20,15,20,15),
        border:OutlineInputBorder(
          borderRadius:BorderRadius.circular(10),
        ),
      ),
    );

    final familyMembersField=TextFormField(
      controller: _familyMembersController,
      autofocus: false,
      textInputAction: TextInputAction.next,
      keyboardType:TextInputType.number,
      //validator: (){},
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
        _familyMembersController.text=value;
      },

      decoration:InputDecoration(
        prefixIcon:Icon(Icons.group),
        hintText:"Enter Family Members",
        contentPadding:EdgeInsets.fromLTRB(20,15,20,15),
        border:OutlineInputBorder(
          borderRadius:BorderRadius.circular(10),
        ),
      ),
    );

    final homeStateField=TextFormField(
      controller: _homeStateController,
      autofocus: false,
      textInputAction: TextInputAction.done,
      keyboardType:TextInputType.text,
      //validator: (){},
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
        _homeStateController.text=value;
      },

      decoration:InputDecoration(
        prefixIcon:Icon(Icons.person),
        hintText:"Home State",
        contentPadding:EdgeInsets.fromLTRB(20,15,20,15),
        border:OutlineInputBorder(
          borderRadius:BorderRadius.circular(10),
        ),
      ),
    );

    final accountTypeField=TextFormField(
      controller: _accountTypeController,
      autofocus: false,
      textInputAction: TextInputAction.done,
      keyboardType:TextInputType.text,
      //validator: (){},
      validator: (value) {
        RegExp regex = new RegExp(r'^.{4,}$');
        if (value.isEmpty) {
          return ("Account cannot be empty");
        }
        if (!regex.hasMatch(value)) {
          return ("Enter Proper Account Type");
        }
      },
      onSaved: (value){
        _accountTypeController.text=value;
      },

      decoration:InputDecoration(
        prefixIcon:Icon(Icons.map),
        hintText:"Buyer/Seller/Rent/BuyingAndRent/SellerAndRent/ServiceProvider",
        contentPadding:EdgeInsets.fromLTRB(20,15,20,15),
        border:OutlineInputBorder(
          borderRadius:BorderRadius.circular(10),
        ),
      ),
    );


    final SignUpButton=Material(
      borderRadius:BorderRadius.circular(10),
      color:Colors.green,
      elevation: 5,
      child: MaterialButton(
        onPressed: (){
          signUp(_emailController.text, _passwordController.text);
        },
        padding:EdgeInsets.fromLTRB(20,15,20,20),
        minWidth:MediaQuery.of(context).size.width,
        child:Text("SignUp",
          style:TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.white,
            fontSize:20,
          ),
          textAlign:TextAlign.center,
        ),
      ),
    );

    return Scaffold(
      backgroundColor: Colors.white,
      body:Center(
        child: Padding(
          padding:EdgeInsets.all(26),
          child: SingleChildScrollView(
            child:Container(
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children:<Widget>[
                    SizedBox(
                      height:300,
                      child:Column(
                        children:<Widget>[
                          Image.asset("lib/images/Logo/armyLogo.png",
                            height:200,
                            fit:BoxFit.cover,
                          ),
                          Text("FAUJI HOUSE",
                            style: TextStyle(
                              color:Colors.black,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height:15,),
                    firstNameField,
                    SizedBox(height:15,),
                    secondNameField,
                    SizedBox(height:15,),
                    emailField,
                    SizedBox(height:15,),
                    passwordField,
                    SizedBox(height:15,),
                    confirmPasswordField,
                    SizedBox(height:15,),
                    userNameField,
                    SizedBox(height:15,),
                    dateOfBirthField,
                    SizedBox(height:15,),
                    phoneNumberField,
                    SizedBox(height:15,),
                    addressField,
                    SizedBox(height:15,),
                    workingStatusField,
                    SizedBox(height:15,),
                    currentStateField,
                    SizedBox(height:15,),
                    homeStateField,
                    SizedBox(height: 15,),
                    familyMembersField,
                    SizedBox(height: 15,),
                    accountTypeField,
                    SizedBox(height:15,),
                    SignUpButton,

                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  void signUp(String email,String password) async{

    if(_formKey.currentState.validate()){

      await _auth.createUserWithEmailAndPassword(email: email, password: password)
          .then((value) => {
            postDetailsToFirestore()
      }).catchError((e){
        Fluttertoast.showToast(msg: e.message);
      });

    }
  }
  postDetailsToFirestore() async{
    //calling firestore and usermodel and sending value to cloud store

    FirebaseFirestore firebaseFirestore=FirebaseFirestore.instance;
    User user=_auth.currentUser;

    UserModel userModel=UserModel();

    //putting all the values

    userModel.uid=user.uid;
    userModel.email=user.email;
    userModel.firstName=_firstNameController.text;
    userModel.secondName=_secondNameController.text;
    userModel.userName=_userNameController.text;
    userModel.phoneNumber=_phoneNumberController.text;
    userModel.familyMembers=_familyMembersController.text;
    userModel.homeState=_homeStateController.text;
    userModel.accountType=_accountTypeController.text;
    userModel.address=_addressController.text;
    userModel.currentState=_currentStateController.text;
    userModel.dateOfBirth=_dateOfBirthController.text;
    userModel.workingStatus=_workingStatusController.text;

    await firebaseFirestore.collection("users").doc(user.uid).collection("details").doc("detailsofuser").set(userModel.toMap());
    
    Fluttertoast.showToast(msg: "Account created successfully");
    Navigator.pushAndRemoveUntil(context,MaterialPageRoute(builder: (context)=>HomePage()), (route) => false);
  }
}
