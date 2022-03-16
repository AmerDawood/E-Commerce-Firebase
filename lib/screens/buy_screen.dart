import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
class BuyScreen extends StatelessWidget {
  const BuyScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('Buy Screen',style: TextStyle(color: Colors.black,fontSize:25),),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation:0,
        leading: IconButton(
          onPressed: (){
            Navigator.pushReplacementNamed(context, '/main_screen');
          },
          icon: Icon(Icons.arrow_back,color: Colors.black,),
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 10,left: 5,right: 5),
            child: CarouselSlider(
              options: CarouselOptions(height: 200.0),
              items: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    child: Image.asset('images/visaa.jpg'),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                   child: Image.asset('images/payPal.jpg'),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    child: Image.asset('images/masterCard.png'),
                  ),
                ),
              ],
            ),
          ),
         Padding(
           padding: const EdgeInsets.only(top: 20,left: 20,right: 20),
           child: Container(
             width: double.infinity,
             height: 200,
             color: Colors.grey.shade100,
             child: Column(
               children: [
                 Padding(
                   padding: const EdgeInsets.all(8.0),
                   child: Row(
                     children: [
                       Text('Product Name :',
                       style: TextStyle(
                         fontSize: 25,
                         color: Colors.black,
                         fontWeight: FontWeight.bold,
                       ),
                       ),
                       Spacer(),
                       Text('kgfhhk',
                         style: TextStyle(
                         fontSize: 25,
                         color: Colors.black,
                         fontWeight: FontWeight.bold,
                       ),
                       ),

                     ],
                   ),
                 ),
                 SizedBox(height: 10,),
                 Padding(
                   padding: const EdgeInsets.all(8.0),
                   child: Row(
                     children: [
                       Text('Total Price : ',
                         style: TextStyle(
                           fontSize: 25,
                           color: Colors.black,
                           fontWeight: FontWeight.bold,
                         ),
                       ),
                       Spacer(),
                       Text('100 \$',
                         style: TextStyle(
                           fontSize: 25,
                           color: Colors.green,
                           fontWeight: FontWeight.bold,
                         ),
                       ),

                     ],
                   ),
                 ),
                 SizedBox(height: 10,),
                 Padding(
                   padding: const EdgeInsets.all(8.0),
                   child: Row(
                     children: [
                       Text('How to Buy : ',
                         style: TextStyle(
                           fontSize: 25,
                           color: Colors.black,
                           fontWeight: FontWeight.bold,
                         ),
                       ),
                       Spacer(),
                       Text('Visa',
                         style: TextStyle(
                           fontSize: 25,
                           color: Colors.red,
                           fontWeight: FontWeight.bold,
                         ),
                       ),

                     ],
                   ),
                 ),
               ],
             ),
           ),
         ),
          Padding(
            padding: const EdgeInsets.only(top: 30,bottom: 20),
            child: ElevatedButton(
              onPressed: (){
              },
              style: ElevatedButton.styleFrom(
                primary: Colors.blue.withOpacity(0.6),
                minimumSize: Size(30, 50),
                fixedSize: Size(300, 30),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
              child: Text(
                'Buy Now',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
