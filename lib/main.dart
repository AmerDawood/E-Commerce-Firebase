import 'package:e_commerce_firebase/prefs/app_preferences.dart';
import 'package:e_commerce_firebase/provider/cart.dart';
import 'package:e_commerce_firebase/provider/cart1.dart';
import 'package:e_commerce_firebase/provider/cart2.dart';
import 'package:e_commerce_firebase/provider/orders.dart';
import 'package:e_commerce_firebase/screens/app/app_screen.dart';
import 'package:e_commerce_firebase/screens/app/category_screen.dart';
import 'package:e_commerce_firebase/screens/app/details/category_details_screen.dart';
import 'package:e_commerce_firebase/screens/app/main_screen.dart';
import 'package:e_commerce_firebase/screens/app/new_product.dart';
import 'package:e_commerce_firebase/screens/auth/forget_password.dart';
import 'package:e_commerce_firebase/screens/auth/login_screen.dart';
import 'package:e_commerce_firebase/screens/auth/register_screen.dart';
import 'package:e_commerce_firebase/screens/buy_screen.dart';
import 'package:e_commerce_firebase/screens/launch_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await AppPreferences().initPreferences();

  runApp(const MyApp());
}
class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  _MyAppState createState() => _MyAppState();
}
class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers:[
        ChangeNotifierProvider<Cart>(create: (_) => Cart()),
        ChangeNotifierProvider<Cart1>(create: (_) => Cart1()),
        ChangeNotifierProvider<Cart2>(create: (_) => Cart2()),
        ChangeNotifierProvider<FavProducts>(create: (_) => FavProducts()),
      ],
      child:MainMatiralApp(),
    );
  }
}
class MainMatiralApp extends StatelessWidget {
  const MainMatiralApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/login_screen',
      routes: {
        '/main_screen': (context) => const MainScreen(),
        '/login_screen': (context) => const LoginScreen(),
        '/register_screen': (context) => const RegisterScreen(),
        '/launch_screen': (context) => LaunchScreen(),
        '/app_screen': (context) => AppScreen(),
        // '/category_screen': (context) => CategoryScreen(),
        // '/product_screen': (context) => ProductsScreen(),
        '/new': (context) => NewProducts(),
        // '/category_details_screen': (context) => DetailsScreen(),
        '/forget_password': (context) => ForgetPassword(),
        // '/notification_screen': (context) => NotificationScreen(),
        // '/cart_screen': (context) => CartScreen(),
        // '/buy_screen': (context) => BuyScreen(),

      },
    );
  }
}

