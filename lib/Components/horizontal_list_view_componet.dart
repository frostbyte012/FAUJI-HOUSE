import 'package:flutter/material.dart';

class HorizontalListView extends StatelessWidget {



  @override
  Widget build(BuildContext context) {
    return Container(
      width:100,
      height: 100,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          Component_items(
            // content_image_location:"lib/images/cats/accessories.png",
            content_image_location: Icon(Icons.home,size:80,color: Colors.green,),
            content_name:"Readymade",
          ),
          Component_items(
            // content_image_location:"lib/images/cats/dress.png",
            content_image_location: Icon(Icons.home_filled,size:80,color: Colors.green,),
            content_name:"Bunglows",
          ),
          Component_items(
            // content_image_location:"lib/images/cats/formal.png",
            content_image_location: Icon(Icons.home_max,size:80,color: Colors.green,),
            content_name:"Appartments",
          ),
          Component_items(
            // content_image_location:"lib/images/cats/informal.png",
            content_image_location: Icon(Icons.home_mini,size:80,color: Colors.green,),
            content_name:"Shared Homes",
          ),
          Component_items(
            // content_image_location:"lib/images/cats/jeans.png",
            content_image_location: Icon(Icons.home_filled,size:80,color: Colors.green,),
            content_name:"Rent",
          ),
          Component_items(
            // content_image_location:"lib/images/cats/shoe.png",
            content_image_location: Icon(Icons.home_max_sharp,size:80,color: Colors.green,),
            content_name:"Leased",
          ),
          Component_items(
            // content_image_location:"lib/images/cats/tshirt.png",
            content_image_location: Icon(Icons.home_outlined,size:80,color: Colors.green,),
            content_name:"Multi Storey Buildings",
          ),
        ],
      ),
    );
  }
}

class Component_items extends StatelessWidget {

    final String content_name;
    final Widget content_image_location;

    const Component_items({
        this.content_image_location,
        this.content_name,
      });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80.0,
      width: 100.0,
      child: Padding(
        padding:EdgeInsets.all(2.0),
        child:InkWell(
          onTap: (){},
          child: Container(
            height: 80,
            width:100,
            child: ListTile(
              // title:Image.asset(content_image_location,width:100.0,height:80.0,),
              title: content_image_location,
              subtitle:Container(
                alignment: Alignment.topCenter,
                child: Text(
                    content_name,
                    style:TextStyle(fontSize: 12.0),
                  ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

