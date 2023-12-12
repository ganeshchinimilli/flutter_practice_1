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
      home:MyHomePage(
        title:'Product State demo home page',
      ),
    );
  }
}

class MyHomePage extends StatelessWidget{
  MyHomePage({Key? key,required this.title}):super(key:key);

  final String title;
  final items = Product.getProducts(); 

  @override
  Widget build(BuildContext context){
    return Scaffold(
     appBar: AppBar(title: Text("Product Navigation")), 
         body: ListView.builder( 
            itemCount: items.length, 
            itemBuilder: (context, index) { 
               return GestureDetector( 
                  child: ProductBox(item: items[index]), 
                  onTap: () { 
                     Navigator.push( 
                        context, 
                        MaterialPageRoute( 
                           builder: (context) => ProductPage(item: items[index]), 
                        ), 
                     ); 
                  }, 
               ); 
            }, 
         )

      // body:Center(
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
        // child: ListView(
        //   scrollDirection:Axis.vertical,
        //   shrinkWrap: true,
        //   children: <Widget>[
            // ProductBox(
            //    name: "iPhone", 
            //     description: "iPhone is the stylist phone ever", 
            //     price: 1000, 
            //     image: 'https://picsum.photos/250?image=9',
            //     onPressed:(title){
            //        print(title);
            //       _showDialog(context,title);
            //     }
            // ),
            //  ProductBox( 
            //   name: "Pixel",    
            //   description: "Pixel is the most featureful phone ever", 
            //   price: 800, 
            //   image: "https://picsum.photos/250?image=10",
            //   onPressed:(title){
            //       _showDialog(context,title);
            //     }
            // ), 
            // ProductBox( 
            //   name: "Laptop", 
            //   description: "Laptop is most productive development tool", 
            //   price: 2000, 
            //   image: "https://picsum.photos/250?image=11",
            //   onPressed:(title){
            //       _showDialog(context,title);
            //     }
            // ), 
            // ProductBox( 
            //   name: "Tablet", 
            //   description: "Tablet is the most useful device ever for meeting", 
            //   price: 1500, 
            //   image: "https://picsum.photos/250?image=12",
            //   onPressed:(title){
            //       _showDialog(context,title);
            //     }
            // ), 
            // ProductBox( 
            //   name: "Pendrive", 
            //   description: "Pendrive is useful storage medium", 
            //   price: 100, 
            //   image: "https://picsum.photos/250?image=13",
            //   onPressed:(title){
            //       _showDialog(context,title);
            //     }
            // ), 
            // ProductBox(
            //   name: "Floppy Drive", 
            //   description: "Floppy drive is useful rescue storage medium", 
            //   price: 20, 
            //   image: "https://picsum.photos/250?image=14",
            //    onPressed:(title){
            //       print(title);
            //       _showDialog(context,title);
            //     }
            // ), 
        //   ]
        // )
      // ),
    );
  }
  //  void _showDialog(BuildContext context,String title){
  //   showDialog(
  //     context:context,
  //     builder: (BuildContext context){
  //       return AlertDialog(
  //         // make comment as title was added to cart
  //         title:Text('Added to cart $title'),
  //         // get the title as content from the product box
  //         content:const Text('Congrats on adding the cart with title'),
  //         actions: <Widget>[
  //           TextButton( 
  //             child:const Text('OK'),
  //             onPressed: (){
  //               Navigator.of(context).pop();
  //             }
  //           )
  //         ]
  //       );
  //     }
  //   );
  // }
}
class ProductBox extends StatelessWidget{
  const ProductBox({Key? key,required this.item}):super(key:key);

  // final String name;
  // final String description;
  // final int price;
  // final String image;
  // final Function(String) onPressed;
  final Product item;
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
        shape: const RoundedRectangleBorder(
          borderRadius:BorderRadius.all(Radius.circular(50)),
        ),
        child: Row(
          mainAxisAlignment:MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            const SizedBox(width:10),
            // make some styling to the image
            Image.network(item.image,width:80),
            Expanded(
              child:Column(
                mainAxisAlignment:MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Text(item.name,style:const TextStyle(fontWeight:FontWeight.bold)),
                  Padding(
                    padding:const EdgeInsets.only(left:8.0),
                    child:Text(item.description,style:const TextStyle(color:Color.fromARGB(137, 239, 236, 236))),
                  ),
                  Text('Price :${item.price}'),
                  const RatingBox(),
                ]
              )
            ),
            // IconButton(onPressed: (){
            //   onPressed(name);}
            // , icon:const Icon(Icons.add_shopping_cart),color:const Color.fromARGB(255, 180, 200, 216),)
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

class ProductPage extends StatelessWidget{
  const ProductPage({Key?key,required this.item}):super(key:key);
  final Product item;
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title:Text(item.name),
      ),
      // make a body with the background image which was coming from item and palce the title and description top of the backgroudnimage
      body: Container(
        decoration:BoxDecoration(
          image:DecorationImage(
            image:NetworkImage(item.image),
            fit:BoxFit.cover,
          ),
        ),
        child:Center(
          child:Container(
            padding:const EdgeInsets.all(10),
            child:Column(
              mainAxisAlignment:MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: <Widget>[ 
              Container( 
                padding:const  EdgeInsets.all(5),
                color:Colors.white,
                child:Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly, 
                children: <Widget>[ 
                    Text(item.name, style: const TextStyle(fontWeight: FontWeight.bold)), 
                    Text(item.description), 
                    Text("Price: ${item.price}"), 
                    Center(child: RatingBox(),),
                ], 
              ))
              ]
            )
          )
        )
      )
    );







    //   body:Center(
    //     child:Container(
    //       padding:const EdgeInsets.all(0),
    //       child:Column(
    //         mainAxisAlignment:MainAxisAlignment.start,
    //         crossAxisAlignment: CrossAxisAlignment.start,
    //         children: <Widget>[ 
    //               FittedBox(
    //                 fit: BoxFit.fill,
    //                 child: Image.network(item.image),
    //                 ),
    //               Expanded( 
    //                 child: Container( 
    //                     padding:const  EdgeInsets.all(5), 
    //                     child: Column( 
    //                       mainAxisAlignment: MainAxisAlignment.spaceEvenly, 
    //                       children: <Widget>[ 
    //                           Text(item.name, style: const TextStyle(fontWeight: FontWeight.bold)), 
    //                           Text(item.description), 
    //                           Text("Price: ${item.price}"), 
    //                           const RatingBox(), 
    //                       ], 
    //                     )
    //                 )
    //               ) 
    //           ]
    //       )

    //     )
    //   )
    // );
  }
}

class Product{
  final String name;
  final String description;
  final int price;
  final String image;

  Product(this.name, this.description,this.price,this.image);
  
  static List<Product> getProducts(){
    List<Product> items = <Product>[];

    items.add(
      Product('iPhone', 'iPhone is the stylist phone ever',1000,'https://picsum.photos/250?image=9')
    );

    items.add(
      Product('Pixel','Pixel is the most featureful phone ever',800,'https://picsum.photos/250?image=10')
    );

    items.add(
      Product('Laptop','Laptop is most productive development tool',2000,'https://picsum.photos/250?image=11')
    );

    items.add(
      Product('Tablet','Tablet is most productive development tool',1000,'https://picsum.photos/250?image=12')
    );

    items.add(
      Product('Pendrive','Pendrive is useful storage medium',100,'https://picsum.photos/250?image=13')
    );

    items.add(
      Product('Floppy Drive','Floppy drive is useful rescue storage medium',20,'https://picsum.photos/250?image=14')
    );
    return items;
  }
}
class RatingBox extends StatefulWidget{
  const RatingBox({Key?key}):super(key:key);

  @override
  _RatingBoxState  createState() => _RatingBoxState();
}

class _RatingBoxState extends State<RatingBox>{

  int _rating=0;
  void _setRatingAsOne() {
      setState(() {
         _rating = 1; 
      }); 
   }
   void _setRatingAsTwo() {
      setState(() {
         _rating = 2; 
      }); 
   } 
   void _setRatingAsThree() { 
      setState(() {
         _rating = 3; 
      }); 
   }

  Widget build(BuildContext context){
     double size = 20; 
     print(_rating); 
    return Row(
      mainAxisAlignment: MainAxisAlignment.end, 
         crossAxisAlignment: CrossAxisAlignment.end, 
         mainAxisSize: MainAxisSize.max, 
         children: <Widget>[
            Container(
               padding: const EdgeInsets.all(0), 
               child: IconButton(
                  icon: (
                     _rating >= 1 ? Icon( 
                        Icons.star, 
                        size: size, 
                     ) 
                     : Icon( 
                        Icons.star_border, 
                        size: size, 
                     )
                  ), 
                  color: Colors.red[500], 
                  onPressed: _setRatingAsOne, 
                  iconSize: size, 
               ), 
            ), 
            Container(
               padding: const EdgeInsets.all(0), 
               child: IconButton( 
                  icon: ( _rating >= 2 ? Icon( Icons.star, size: size ) : Icon(  Icons.star_border, size: size)), 
                  color: Colors.red[500], 
                  onPressed: _setRatingAsTwo, 
                  iconSize: size, 
               ), 
            ), 
            Container(
               padding: const EdgeInsets.all(0), 
               child: IconButton(
                  icon: (
                     _rating >= 3 ? 
                     Icon( 
                        Icons.star, 
                        size: size, 
                     )
                     : Icon( 
                        Icons.star_border, 
                        size: size, 
                     )
                  ), 
                  color: Colors.red[500], 
                  onPressed: _setRatingAsThree, 
                  iconSize: size, 
               ), 
            ),
         ],
        );
   }
}
