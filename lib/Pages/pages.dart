import 'package:flutter/material.dart';
import 'package:fauji_house_app_new/Pages/homepage.dart';

class ProductDetails extends StatefulWidget {

  final String product_name;
  final String image_product;
  final int old_price;
  final int new_price;

  const ProductDetails({
    this.product_name,
    this.image_product,
    this.old_price,
    this.new_price,
   });

  @override
  _ProductDetailsState createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  bool value=false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
        elevation: 0.1,
        backgroundColor:Colors.green,
        actions: [
          IconButton(onPressed:(){}, icon:Icon(Icons.search,color: Colors.white,)),

        ],
        title:InkWell(child: Text("FaujiHouse"),
          onTap:()=>
           Navigator.of(context).push(MaterialPageRoute(builder: (context)=>HomePage(),),

          ),
        ),
      ),
      body: ListView(
        children: [
          Container(
            height: 300,
            child: GridTile(
              child: Container(
                child: Image.asset(widget.image_product,fit: BoxFit.cover,),
              ),
              footer: Container(
                color: Colors.white70,
                child: ListTile(
                  leading:Text(widget.product_name,style:TextStyle(fontWeight: FontWeight.bold,fontSize:16.0),),
                  title:Row(
                    children: [
                      Expanded(
                          child:
                          Row(
                              children: [
                                Text("Old Price:",style:TextStyle(fontWeight: FontWeight.bold,color: Colors.grey),),
                                Text("\$${widget.old_price}",style:TextStyle(fontWeight: FontWeight.bold,decoration: TextDecoration.lineThrough,color: Colors.grey),),
                              ],
                          ),
                      ),
                      Expanded(child: Text("New Price: \$${widget.new_price}",style:TextStyle(fontWeight: FontWeight.bold,color: Colors.green),),),
                    ],
                  ),
                ),
              ),
            ),
          ),
          Row(
            children: [

              //================= First Button =================
              Expanded(
                  child:MaterialButton(
                    onPressed: (){
                      showDialog(
                        context:context,
                        builder:(context){
                          return AlertDialog(
                           title: Text("Services"),
                            content: Text("Choose the Services"),
                            actions: [

                              SizedBox(
                                height: 20,
                                child: Row(
                                  children: [
                                    SizedBox(width: 20,
                                    ),
                                    Text("Generator"),
                                    Checkbox(value: this.value, onChanged:(bool value){
                                      setState(() {
                                        this.value=value;
                                      });

                                    })
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: 20,
                                child: Row(
                                  children: [
                                    SizedBox(width: 20,
                                    ),
                                    Text("Wifi"),
                                    Checkbox(value: this.value, onChanged:(bool value){
                                      setState(() {
                                        this.value=value;
                                      });

                                    })
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: 20,
                                child: Row(
                                  children: [
                                    SizedBox(width: 20,
                                    ),
                                    Text("Interior Decoration"),
                                    Checkbox(value: this.value, onChanged:(bool value){
                                      setState(() {
                                        this.value=value;
                                      });

                                    })
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: 20,
                                child: Row(
                                  children: [
                                    SizedBox(width: 20,
                                    ),
                                    Text("News-Paper"),
                                    Checkbox(value: this.value, onChanged:(bool value){
                                      setState(() {
                                        this.value=value;
                                      });

                                    })
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: 20,
                                child: Row(
                                  children: [
                                    SizedBox(width: 20,
                                    ),
                                    Text("Cleaning"),
                                    Checkbox(value: this.value, onChanged:(bool value){
                                      setState(() {
                                        this.value=value;
                                      });

                                    }
                                    ),
                                  ],
                                ),
                              ),

                              SizedBox(
                                height: 20,
                                child: Row(
                                  children: [
                                    SizedBox(width: 20,
                                    ),
                                    Text("Gardening"),
                                    Checkbox(value: this.value, onChanged:(bool value){
                                      setState(() {
                                        this.value=value;
                                      });

                                    },
                                    ),
                                  ],
                                ),
                              ),

                              SizedBox(
                                height: 20,
                                child: Row(
                                  children: [
                                    SizedBox(width: 20,
                                    ),
                                    Text("Janitor"),
                                    Checkbox(value: this.value, onChanged:(bool value){
                                      setState(() {
                                        this.value=value;
                                      });

                                    },
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: 20,
                                child: Row(
                                  children: [
                                    SizedBox(width: 20,
                                    ),
                                    Text("Watch-Guard"),
                                    Checkbox(value: this.value, onChanged:(bool value){
                                      setState(() {
                                        this.value=value;
                                      });

                                    },
                                    ),
                                  ],
                                ),
                              ),

                              MaterialButton(onPressed: (){
                                Navigator.of(context).pop(context);
                              },
                                child:Text("close",style:TextStyle(color:Colors.green),),
                              ),

                            ],
                          );
                        }
                      );
                    },
                    color:Colors.white70,
                    textColor:Colors.grey,
                    elevation: 0.1,
                    child:Row(
                      children: [
                        Expanded(child:Text("Services",style:TextStyle(fontSize:12),),),
                        Expanded(child:Icon(Icons.arrow_drop_down,color: Colors.green,)),
                      ],
                    ),
                  ),
                ),
              //================= Button =====
              Expanded(
                child:MaterialButton(
                  onPressed: (){
                    showDialog(context: context, builder:(context){

                      return AlertDialog(
                        title:Text("Add Ons"),
                        content: Text("Choose Add Ons"),
                        actions: [
                          SizedBox(
                            height: 20,
                            child: Row(
                              children: [
                                SizedBox(width: 20,
                                ),
                                Text("Electronics and Gadgets"),
                                Checkbox(value: this.value, onChanged:(bool value){
                                  setState(() {
                                    this.value=value;
                                  });

                                })
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 20,
                            child: Row(
                              children: [
                                SizedBox(width: 20,
                                ),
                                Text("Home Appliances"),
                                Checkbox(value: this.value, onChanged:(bool value){
                                  setState(() {
                                    this.value=value;
                                  });

                                })
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 20,
                            child: Row(
                              children: [
                                SizedBox(width: 20,
                                ),
                                Text("Interior Decoration"),
                                Checkbox(value: this.value, onChanged:(bool value){
                                  setState(() {
                                    this.value=value;
                                  });

                                })
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 20,
                            child: Row(
                              children: [
                                SizedBox(width: 20,
                                ),
                                Text("Non-Furnished"),
                                Checkbox(value: this.value, onChanged:(bool value){
                                  setState(() {
                                    this.value=value;
                                  });

                                })
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 20,
                            child: Row(
                              children: [
                                SizedBox(width: 20,
                                ),
                                Text("Semi-Furnished"),
                                Checkbox(value: this.value, onChanged:(bool value){
                                  setState(() {
                                    this.value=value;
                                  });

                                 }
                                ),
                              ],
                            ),
                          ),

                          SizedBox(
                            height: 20,
                            child: Row(
                              children: [
                                SizedBox(width: 20,
                                ),
                                Text("Fully-Furnished"),
                                Checkbox(value: this.value, onChanged:(bool value){
                                  setState(() {
                                    this.value=value;
                                  });

                                  },
                                ),
                              ],
                            ),
                          ),

                          MaterialButton(onPressed: (){
                            Navigator.of(context).pop(context);
                           },
                            child:Text("close",style:TextStyle(color:Colors.green),),
                          ),
                        ],
                       );

                      },

                    );
                  },
                  color:Colors.white70,
                  textColor:Colors.grey,
                  elevation: 0.1,
                  child:Row(
                    children: [
                      Expanded(child:Text("Add Ons",style:TextStyle(fontSize:12),),),
                      Expanded(child:Icon(Icons.arrow_drop_down,color: Colors.green,)),
                    ],
                  ),
                ),
              ),

              //================= Second Button =================

              Expanded(
                child:Row(
                  children: [

                    Expanded(child: IconButton(onPressed: (){}, icon:Icon(Icons.shopping_cart,color: Colors.green,),)),
                    IconButton(onPressed: (){}, icon:Icon(Icons.favorite_border,color: Colors.green,),),
                    

                  ],
                ),
              ),
            ],
          ),

          //=============Third Button===============
          Row(
            children: [
              Expanded(
                child:MaterialButton(
                  onPressed: (){},
                  color:Colors.green,
                  elevation:0.1,
                  textColor:Colors.white,
                  child:Text("Buy Now"),
                ),
              ),

            ],
          ),

          Divider(),

          ListTile(
            title:Text("Property Details",style:TextStyle(color:Colors.black),),
            subtitle: Text("Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum."),
          ),

          Divider(),

          Row(
            children: [
              Padding(padding:EdgeInsets.fromLTRB(15.0, 5.0, 5.0, 5.0),
                      child: Text("Property Name:",style:TextStyle(color:Colors.grey),),
              ),
              Padding(padding:EdgeInsets.all(5.0),
                child: Text("${widget.product_name}",style:TextStyle(fontWeight:FontWeight.bold),),
              ),
            ],
          ),

          Divider(),

           //Remener to create seller name
          Row(
            children: [
              Padding(padding:EdgeInsets.fromLTRB(15.0, 5.0, 5.0, 5.0),
                child: Text("Seller Name:",style:TextStyle(color:Colors.grey),),
              ),
              Padding(padding:EdgeInsets.all(5.0),
                child: Text("XXXXXXXXXXX",style:TextStyle(fontWeight:FontWeight.bold),),
              ),
            ],
          ),

          Divider(),

          //Remener to create property
          Row(
            children: [
              Padding(padding:EdgeInsets.fromLTRB(15.0, 5.0, 5.0, 5.0),
                child: Text("Location:",style:TextStyle(color:Colors.grey),),
              ),
              Padding(padding:EdgeInsets.all(5.0),
                child: Text("LocationXYZ",style:TextStyle(fontWeight:FontWeight.bold),),
              ),
            ],
          ),

          Divider(),

          Container(
            height: 15,
            child:Padding(
                   padding:EdgeInsets.fromLTRB(15,0,0,0),
                   child: Text("Similar Products")),

          ),

          Divider(),

          Container(
            height: 360,
            child: Similar_Products(),
          )

        ],
      ),
    );
  }
}

class Similar_Products extends StatefulWidget {
  const Similar_Products({Key key}) : super(key: key);

  @override
  _Similar_ProductsState createState() => _Similar_ProductsState();
}

class _Similar_ProductsState extends State<Similar_Products> {
  var product=[
    {
      "name":"New House",
      "picture":"lib/images/home_adds/pexels-mark-mccammon-1080721.jpg",
      "old_price":100,
      "price":85,
    },
    {
      "name":"New Ready Home",
      "picture":"lib/images/home_adds/pexels-pixabay-259588.jpg",
      "old_price":100,
      "price":85,
    },

    {
      "name":"Appartment",
      "picture":"lib/images/home_adds/pexels-mark-mccammon-1080721.jpg",
      "old_price":100,
      "price":85,
    },
    {
      "name":"Flats",
      "picture":"lib/images/home_adds/pexels-scott-webb-1029599.jpg",
      "old_price":100,
      "price":85,
    },


  ];

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: product.length,
      gridDelegate:new SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
      itemBuilder:(BuildContext context,int index){
        return SimilarProducts(
          prod_name:product[index]['name'],
          prod_old_price:product[index]["old_price"],
          prod_picture:product[index]["picture"],
          prod_price:product[index]["price"],
        );
      },
    );
  }
}
class SimilarProducts extends StatelessWidget {
  final prod_name;
  final prod_picture;
  final prod_old_price;
  final prod_price;

  const SimilarProducts({
    this.prod_name,
    this.prod_old_price,
    this.prod_picture,
    this.prod_price,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Hero(
        tag:prod_name,
        child:Material(
          child:InkWell(
            onTap: ()=> Navigator.of(context).push(MaterialPageRoute(builder: (context)=>ProductDetails(

              image_product:prod_picture,
              product_name: prod_name,
              new_price:prod_price,
              old_price: prod_old_price,

            ),
            ),
            ),
            child: GridTile(
              child: Image.asset(prod_picture,fit:BoxFit.cover,),
              footer:Container(
                color: Colors.white70,
                child: ListTile(
                  leading: Text(prod_name,style: TextStyle(fontWeight: FontWeight.bold),),
                  title: Text("\$$prod_price",style:TextStyle(color:Colors.green,fontWeight: FontWeight.w800),),
                  subtitle:Text("\$$prod_old_price",style:TextStyle(color:Colors.black54,fontWeight: FontWeight.w800,
                    decoration: TextDecoration.lineThrough,
                  ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
