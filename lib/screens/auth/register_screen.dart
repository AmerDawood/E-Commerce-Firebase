import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerce_firebase/utils/helpers.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<RegisterScreen> with Helpers {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  late TextEditingController _emailEditingController;
  late TextEditingController _passwordEditingController;
  late TextEditingController _fullNameController;
  late TextEditingController _mobilePhoneController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _emailEditingController = TextEditingController();
    _passwordEditingController = TextEditingController();
    _fullNameController = TextEditingController();
    _mobilePhoneController = TextEditingController();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _emailEditingController.dispose();
    _passwordEditingController.dispose();
    _fullNameController.dispose();
    _mobilePhoneController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black),
        elevation: 0,
        backgroundColor: Colors.white,
        title: Text(
          'Register Screen',
          style: TextStyle(
            color: Colors.black,
            fontSize: 27,
          ),
        ),
        leading: IconButton(
          onPressed: (){
            Navigator.pushReplacementNamed(context, '/login_screen');
          },
          icon:Icon(
            Icons.arrow_back,
            color: Colors.black,
            size: 27,
          )
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
        child: ListView(
          children: [
            Text(
              'Create account',
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            Text(
              'Enter below data',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.grey,
              ),
            ),
            SizedBox(
              height: 20,
            ),

            SizedBox(
              height: 20,
            ),

            TextField(
              controller: _fullNameController,
              decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    width: 1,
                    color: Colors.grey,
                  ),
                  borderRadius: BorderRadius.circular(10),
                ),
                hintText: 'Full Name',
                prefixIcon: Icon(Icons.person),
                labelStyle: TextStyle(
                  fontSize: 20,
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    width: 1,
                    color: Colors.blue,
                  ),
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),

            SizedBox(
              height: 10,
            ),
            TextField(
              controller: _emailEditingController,
              decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    width: 1,
                    color: Colors.grey,
                  ),
                  borderRadius: BorderRadius.circular(10),
                ),
                hintText: 'Email',
                prefixIcon: Icon(Icons.email),
                labelStyle: TextStyle(
                  fontSize: 20,
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    width: 1,
                    color: Colors.blue,
                  ),
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            TextField(
              controller: _passwordEditingController,
              decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    width: 1,
                    color: Colors.grey,
                  ),
                  borderRadius: BorderRadius.circular(10),
                ),
                hintText: 'password',
                prefixIcon: Icon(Icons.lock),
                labelStyle: TextStyle(
                  fontSize: 20,
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    width: 1,
                    color: Colors.blue,
                  ),
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
            SizedBox(
              height: 12,
            ),

            SizedBox(
              height: 12,
            ),
            TextField(
              controller: _mobilePhoneController,
              // keyboardType:TextInputType.number,
              decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    width: 1,
                    color: Colors.grey,
                  ),
                  borderRadius: BorderRadius.circular(10),
                ),
                hintText: 'Mobile',
                prefixIcon: Icon(Icons.phone),
                labelStyle: TextStyle(
                  fontSize: 20,
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    width: 1,
                    color: Colors.blue,
                  ),
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
            SizedBox(
              height: 12,
            ),
            ElevatedButton(
              // important
              onPressed: () async => await performRegister(),
              style: ElevatedButton.styleFrom(
                minimumSize: Size(double.infinity, 50),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              child: Text(
                'Register',
                style: TextStyle(
                  fontSize:
                    25,

                ),
              ),
            ),
          ],
        ),
    ),
    );


  }
  // void _cropImage(filePath) async {
  //   File? cropImage = await ImageCropper().cropImage(
  //       sourcePath: filePath, maxHeight: 1080, maxWidth: 1080);
  //   if (cropImage != null) {
  //     setState(() {
  //       imageFile = cropImage;
  //     });
  //   }
  // }
  // void _pickImageWithCamera() async {
  //   try {
  //     PickedFile? pickedFile = await ImagePicker().getImage(
  //         source: ImageSource.camera, maxWidth: 1080, maxHeight: 1080);
  //     _cropImage(pickedFile!.path);
  //   } catch (error) {
  //     showSnackBar(context: context, message: '');
  //   }
  //
  //
  //   Navigator.pop(context);
  // }
  // void _pickImageWithGallery() async {
  //   try {
  //     PickedFile? pickedFile = await ImagePicker().getImage(
  //         source: ImageSource.gallery, maxWidth: 1080, maxHeight: 1080);
  //     _cropImage(pickedFile!.path);
  //   } catch (error) {
  //     showSnackBar(context: context, message: '');
  //   }
  //   Navigator.pop(context);
  // }
  // void _showImageDialog() {
  //   showDialog(
  //       context: context,
  //       builder: (context) {
  //         return AlertDialog(
  //           title: Text('Please choose an option'),
  //           content: Column(
  //             mainAxisSize: MainAxisSize.min,
  //             children: [
  //               InkWell(
  //                 onTap: _pickImageWithCamera,
  //                 child: Padding(
  //                   padding: const EdgeInsets.all(4.0),
  //                   child: Row(
  //                     children: [
  //                       Icon(
  //                         Icons.camera,
  //                         color: Colors.purple,
  //                       ),
  //                       SizedBox(
  //                         width: 7,
  //                       ),
  //                       Text(
  //                         'Camera',
  //                         style: TextStyle(color: Colors.purple),
  //                       ),
  //                     ],
  //                   ),
  //                 ),
  //               ),
  //               InkWell(
  //                 onTap: _pickImageWithGallery,
  //                 child: Padding(
  //                   padding: const EdgeInsets.all(4.0),
  //                   child: Row(
  //                     children: [
  //                       Icon(
  //                         Icons.image,
  //                         color: Colors.purple,
  //                       ),
  //                       SizedBox(
  //                         width: 7,
  //                       ),
  //                       Text(
  //                         'Gallery',
  //                         style: TextStyle(color: Colors.purple),
  //                       ),
  //                     ],
  //                   ),
  //                 ),
  //               ),
  //             ],
  //           ),
  //         );
  //       });
  // }
  //

  Future<void> performRegister() async {
    if (checkData()) {
      await createAccount(
        context: context,
        email: _emailEditingController.text,
        password: _passwordEditingController.text,
        fullName: _fullNameController.text,
        phoneNumber: _mobilePhoneController.text,
      );
    }
  }

  bool checkData() {
    if (_emailEditingController.text.isNotEmpty &&
         _passwordEditingController.text.isNotEmpty&&
         _fullNameController.text.isNotEmpty&&
         _mobilePhoneController.text.isNotEmpty

    ) {
      Navigator.pushReplacementNamed(context, '/login_screen');
      return true;
    }
    showSnackBar(context: context, message: 'Enter required data',error: true);
    return false;
  }

  Future<bool> createAccount(
      {required BuildContext context,
        required String email,
        required String password,
        required String fullName,
        required String phoneNumber,
      }) async {

      try {
      UserCredential userCredential = await _firebaseAuth
          .createUserWithEmailAndPassword(email: email, password: password);
      final User? user =  _firebaseAuth.currentUser;
      final uid= user!.uid;

      // final ref = FirebaseStorage.instance
      //     .ref()
      //     .child('userImages')
      //     .child(uid + '.jpg');
      // await ref.putFile(imageFile!);
      // url = await ref.getDownloadURL();

        FirebaseFirestore.instance.collection('users').doc(uid).set(
        {
        'id':uid,
        'email':_emailEditingController.text,
        'createAt':Timestamp.now(),
        'fullName':_fullNameController.text,
        'phoneNumber':_mobilePhoneController.text,
        },
        );


      userCredential.user?.sendEmailVerification();
      return true;
    } on FirebaseAuthException catch (e) {
      _controlException(context, e);
    } catch (e) {
      //
    }
    return false;
  }
  void _controlException(
      BuildContext context, FirebaseAuthException exception) {
    showSnackBar(
        context: context,
        message: exception.message ?? 'ERROR !!',
        error: true);
    switch (exception.code) {
      case 'invalid-email':
        break;
      case 'user-disabled':
        break;
      case 'user-not-found':
        break;
      case 'wrong-password':
        break;
    }
  }
}
