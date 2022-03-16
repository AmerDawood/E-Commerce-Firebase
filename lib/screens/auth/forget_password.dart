import 'dart:ui';

import 'package:e_commerce_firebase/controller/fb_controllers/fb_auth_controllers.dart';
import 'package:flutter/material.dart';
class ForgetPassword extends StatefulWidget {
  const ForgetPassword({Key? key}) : super(key: key);

  @override
  State<ForgetPassword> createState() => _ForgetPasswordState();
}

class _ForgetPasswordState extends State<ForgetPassword> {
  late TextEditingController _emailEditingController;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _emailEditingController =TextEditingController();
  }
  @override
  void dispose() {
    _emailEditingController.dispose();
    // TODO: implement dispose
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          onPressed: ()=>Navigator.pushReplacementNamed(context, '/login_screen'),
          icon: Icon(
            Icons.arrow_back,
            color: Colors.black,
            size: 27,
          ),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsetsDirectional.only(top: 20,start: 20,end: 20),
        child: ListView(
          children: [

            Text(
              'Enter Your Email ',
              style: TextStyle(
                fontSize: 27,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            SizedBox(height: 20,),
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
            SizedBox(height: 20,),
            ElevatedButton(
              // important
              onPressed: () async => await performReset(),
              style: ElevatedButton.styleFrom(
                minimumSize: Size(double.infinity, 50),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              child: Text(
                'Reset Password',
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }


  Future<void> performReset() async {
    if (checkData()) {
      await resetPassword();
    }
  }

  bool checkData() {
    if (_emailEditingController.text.isNotEmpty &&
        _emailEditingController.text.isNotEmpty) {
      return true;
    }
    return false;
  }

  Future<void> resetPassword() async {
    bool states = await FbAuthController().resetPassword(
        context: context,
        email: _emailEditingController.text,
        );
    if (states) {
      Navigator.pushReplacementNamed(context, '/login_screen');
    }
  }
}