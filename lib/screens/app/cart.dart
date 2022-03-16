import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerce_firebase/utils/helpers.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../controller/fb_controllers/fb_firestore_controller.dart';
import '../../provider/cart.dart';
import '../../widgets/cart_item.dart';
class NotificationScreen extends StatefulWidget {
  final String productID;

  const NotificationScreen({required this.productID});
  @override
  State<NotificationScreen> createState() => _NotfecationScreenState();
}



class _NotfecationScreenState extends State<NotificationScreen>with Helpers{
  String id ='';
  String productId='';
  double price = 0;
  int quantity =0;
  String name='';
  String imageUrl ='';
  bool _isLoading =true;

  void getCategoryInCart() async {
    try {
      _isLoading = true;
      final DocumentSnapshot ProDoc = //widget.userId
      await FirebaseFirestore.instance
          .collection('products')
          .doc(widget.productID)
          .get();
      if (ProDoc == null) {
        return;
      }
      else {
        setState(() {
          name = ProDoc.get('name');
          price= ProDoc.get('price');
          imageUrl= ProDoc.get('imageUrl');
          id= ProDoc.get('productID');
        });
      }
    } catch (e) {
      showSnackBar(context: context, message: 'No Data',error: true);
    }finally{
      _isLoading=false;
    }
  }

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<Cart>(context);
    return Scaffold(
     backgroundColor: Colors.white,
    appBar: AppBar(
      backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        title: Text(
          'My Cart',
          style: TextStyle(
              fontSize: 25,
              color:Colors.black,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: StreamBuilder<QuerySnapshot>(
            stream: FbFireStoreController().getProducts(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else if (snapshot.hasData){
                return ListView.builder(
                    itemCount:cart.items.length,
                    itemBuilder: (BuildContext ctx, index)=> CartPdt(
                  text:snapshot.data!.docs[index]['name'],
                  price: snapshot.data!.docs[index]['price'],
                  imageUrl:snapshot.data!.docs[index]['imageUrl'],
                  id:snapshot.data!.docs[index]['productID'],
                ),
                );
              } else {
                return Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.warning,
                        size: 80,
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        'No Category',
                        style: TextStyle(
                          fontSize: 30,
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                );
              }
            }),

      ),
    );
  }
}

// Expanded(
//
//   child: ListView.builder(
//     itemCount: cart.items.length,
//     itemBuilder: (ctx, i) => CartPdt(
//       text: '$name',
//       price: '$price',
//     ),
//   ),
// ),