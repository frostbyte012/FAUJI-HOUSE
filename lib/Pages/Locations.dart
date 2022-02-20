import 'package:flutter/material.dart';

class LocationPage extends StatefulWidget {
  const LocationPage({Key key}) : super(key: key);

  @override
  _LocationPageState createState() => _LocationPageState();
}

class _LocationPageState extends State<LocationPage> {
  TextEditingController _inputvalue = new TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:Colors.white,
      appBar: AppBar(
        elevation: 0.1,
        backgroundColor:Colors.green,
        actions: [
          IconButton(onPressed: (){}, icon:Icon(Icons.shopping_cart,color:Colors.white,)),
        ],
        title:Text("Locations"),
      ),
      body: ListView( //SingleChildScrollView can be used as well.
        children: [

          Row(children: [
            Expanded(
              child: Padding(
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
                    child: TextField(
                      decoration: InputDecoration(
                        labelText: "ex. Search Properties near you.",
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
                    // maxlength:
                      //maxLines:
                      controller: _inputvalue,
                    ),
                  ),
                ),
              ),
            ),

            IconButton(
                 onPressed:(){
                     setState(() {
                         print(_inputvalue.text);
                      }
                    );
                 },
                icon:Icon(Icons.search,color: Colors.green,)),
             ],
          ),

          Divider(),

          Padding(
            padding: EdgeInsets.all(10.0),
            child: Text("Top Locations Recommended"),
          ),

          Divider(),



          Container(
            height: 500,
            child:CityLocationGridViewer(),
          )




        ],
      ),
    );
  }
}



class CityLocationGridViewer extends StatefulWidget {
  const CityLocationGridViewer({Key key}) : super(key: key);

  @override
  _CityLocationGridViewerState createState() => _CityLocationGridViewerState();
}

class _CityLocationGridViewerState extends State<CityLocationGridViewer> {

  var cities=[
    {
      "name":"New Delhi",
      "picture":"lib/images/cities/newdelhi.jpg",
    },
    {
      "name":"Kolkata",
      "picture":"lib/images/cities/kolata.jpg",
    },
    {
      "name":"Mumbai",
      "picture":"lib/images/cities/mumbai.jpg",
    },
    {
      "name":"Kochin",
      "picture":"lib/images/cities/kerala.jpg",
    },
    {
      "name":"Shimla",
      "picture":"lib/images/cities/shimla.jpg",
    },
    {
      "name":"Srinagar",
      "picture":"lib/images/cities/srinagar.jpg",
    },
    {
      "name":"Jaipur",
      "picture":"lib/images/cities/jaipur.jpg",
    },
    {
      "name":"Chennai",
      "picture":"lib/images/cities/chennai.jpg",
    },
    {
      "name":"Bangalore",
      "picture":"lib/images/cities/bangalore.jpg",
    },
    {
      "name":"Ahmedabad",
      "picture":"lib/images/cities/ahmedabad.jpg",
    },


  ];

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: cities.length,
      gridDelegate:new SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
      itemBuilder:(BuildContext context,int index){
        return LocationCities(
          city_name:cities[index]['name'],
          city_picture:cities[index]["picture"],
        );
      },
    );
  }
}





class LocationCities extends StatelessWidget {


  final city_name;
  final city_picture;

  const LocationCities({
    this.city_name,
    this.city_picture,
});




  @override
  Widget build(BuildContext context) {
    return Card(
      child: Hero(
        tag:city_name,
        child:Material(
          child:InkWell(
            onTap: (){},
            child: GridTile(
              child: Image.asset(city_picture,fit:BoxFit.cover,),
              footer:Container(
                color: Colors.white70,
                child: ListTile(
                  leading: Text(city_name,style: TextStyle(fontWeight: FontWeight.bold),),
                ),
                ),
              ),
            ),
          ),
        ),
      );
  }
}
