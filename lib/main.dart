import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget{
  const MyApp({Key? key}):super(key:key);

  @override
  Widget build(BuildContext context){
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch:Colors.blue
      ),
      home:const MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget{
  const MyHomePage({Key? key}):super(key:key);

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title:Text('Flutter Demo',style:TextStyle(color:Colors.white)),
      ),
      body:Center(
        // child:const Text.rich( 
        //   TextSpan( 
        //       children: <TextSpan>[ 
        //         TextSpan(text: "Hello ", style:  
        //         TextStyle(fontStyle: FontStyle.italic)),  
        //         TextSpan(text: "World", style: 
        //         TextStyle(fontWeight: FontWeight.bold)),  
        //       ], 
        //   ), 
        // ),
        // child:Icon(Icons.email,size:50,color:Colors.blue),//Icon(Icons.email,size:50,color:Colors.blue}),
        child: ListView(
          scrollDirection:Axis.vertical,
          shrinkWrap: true,
          children:const  <Widget>[
            ProductBox(
               name: "iPhone", 
                description: "iPhone is the stylist phone ever", 
                price: 1000, 
                image: 'https://picsum.photos/250?image=9'
            ),
             ProductBox( 
              name: "Pixel",    
              description: "Pixel is the most featureful phone ever", 
              price: 800, 
              image: "https://picsum.photos/250?image=10"
            ), 
            ProductBox( 
              name: "Laptop", 
              description: "Laptop is most productive development tool", 
              price: 2000, 
              image: "https://picsum.photos/250?image=11"
            ), 
            ProductBox( 
              name: "Tablet", 
              description: "Tablet is the most useful device ever for meeting", 
              price: 1500, 
              image: "https://picsum.photos/250?image=12"
            ), 
            ProductBox( 
              name: "Pendrive", 
              description: "Pendrive is useful storage medium", 
              price: 100, 
              image: "https://picsum.photos/250?image=13"
            ), 
            ProductBox(
              name: "Floppy Drive", 
              description: "Floppy drive is useful rescue storage medium", 
              price: 20, 
              image: "https://picsum.photos/250?image=14"
            ), 
          ]
        )
      ),
    );
  }
}
class ProductBox extends StatelessWidget{
  const ProductBox({Key? key,required this.name,required this.description,required this.price,required this.image}):super(key:key);

  final String name;
  final String description;
  final int price;
  final String image;

  @override
  Widget build(BuildContext context){
    return Container(
      height:120,
      color:Colors.amber,
      margin:const EdgeInsets.all(10),
      padding: const EdgeInsets.only(left:10),
      child: Card(
        color:Colors.blueAccent,
        shadowColor:Colors.red,
        elevation: 10,
        shape:RoundedRectangleBorder(
          borderRadius:BorderRadius.all(Radius.circular(50)),
        ),
        child: Row(
          mainAxisAlignment:MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            SizedBox(width:10),
            Image.network(image,width:80),
            Expanded(
              child:Column(
                mainAxisAlignment:MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Text(name,style:TextStyle(fontWeight:FontWeight.bold)),
                  Text(description),
                  Text('Price : '+price.toString()),
                ]
              )
            ),
            IconButton(onPressed: (){}, icon:Icon(Icons.add_shopping_cart),color:Color.fromARGB(255, 180, 200, 216),)
          ]
        ),
      )

      

    );


    // return Container(
    //   padding:const EdgeInsets.all(2),
    //   height: 100,
    //   child:Card(
    //     child:Row(
    //       mainAxisAlignment:MainAxisAlignment.spaceEvenly,
    //       children: <Widget>[
    //         // load the image url here not from the local folder
    //         Image.network('https://picsum.photos/250?image=9',width:50),
    //         Expanded(
    //           child:Column(
    //             mainAxisAlignment:MainAxisAlignment.spaceEvenly,
    //             children: <Widget>[
    //               Text('Product Name',style:TextStyle(fontWeight:FontWeight.bold)),
    //               Text('Product Description'),
    //             ],
    //           ),
    //         ),
    //         IconButton(onPressed: (){}, icon:Icon(Icons.add_shopping_cart),color:Colors.blue,),
    //       ], 
    //     ),
    //   ),
    // );
  }
}