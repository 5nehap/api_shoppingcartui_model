import 'package:api_shoppingcartui_model/controller/addtocartcontroller.dart';
import 'package:api_shoppingcartui_model/controller/homescreencontroller.dart.dart';
import 'package:api_shoppingcartui_model/controller/product_detail.dart';

import 'package:api_shoppingcartui_model/view/login_screen/loginscreen.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main(){
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(
      create: (context) => HomeScreenController(),
    ),
    ChangeNotifierProvider(create: (context) => ProductDetailController()),
    ChangeNotifierProvider(
      create: (context) => Addtocartcontroller(),
    )
  ], child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: loginscreen(),
    );
  }
}
