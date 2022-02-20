import 'package:fauji_house_app_new/Pages/Register_New_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fauji_house_app_new/Pages/homepage.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter/material.dart';


class LoginScreen extends StatefulWidget {
  const LoginScreen({Key key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  final _formKey=GlobalKey<FormState>();
  bool _seePassword=true;
  final TextEditingController _emailController= new TextEditingController();
  final TextEditingController _passwordController=new TextEditingController();


  //firebase auth
  final _auth=FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {



    final emailField=TextFormField(
      controller: _emailController,
      autofocus: false,
      textInputAction: TextInputAction.next,
      keyboardType:TextInputType.emailAddress,
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

    final passwordField=TextFormField(
      controller: _passwordController,
      autofocus: false,
      textInputAction: TextInputAction.done,
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


    final loginButton=Material(
      borderRadius:BorderRadius.circular(10),
      color:Colors.green,
      elevation: 5,
      child: MaterialButton(
        onPressed: (){
          signIn(_emailController.text, _passwordController.text);
        },
        padding:EdgeInsets.fromLTRB(20,15,20,20),
        minWidth:MediaQuery.of(context).size.width,
        child:Text("Login",
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
                          SizedBox(height:25,),
                          emailField,
                          SizedBox(height:15,),
                          passwordField,
                          SizedBox(height:15,),
                          loginButton,
                          SizedBox(height:15,),
                          Row(
                            mainAxisAlignment:MainAxisAlignment.center,
                            children: [
                              Text("Dont Have an Account?"),
                              GestureDetector(
                                onTap: (){
                                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>RegistrationScreenPage()));
                                },
                                child: Text(" SignUp",
                                  style:TextStyle(
                                      color: Colors.green,
                                      fontWeight: FontWeight.w600,
                                      fontSize: 15),
                                ),
                              ),

                            ],
                          )
                        ],
                      ),
                    ),
                  ),
            ),
          ),
      ),
    );
  }

  void signIn(String email, String password) async {
    if (_formKey.currentState.validate()) {
      
        await _auth
            .signInWithEmailAndPassword(email: email, password: password)
            .then((uid) => {
          Fluttertoast.showToast(msg: "Login Successful"),
          Navigator.of(context).pushReplacement(
              MaterialPageRoute(builder: (context) => HomePage())),
        }).catchError((e){
          Fluttertoast.showToast(msg: e.message);
        });
      
    }
  }

}
