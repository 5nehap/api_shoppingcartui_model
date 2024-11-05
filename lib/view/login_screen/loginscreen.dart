import 'package:api_shoppingcartui_model/view/home_screen/homescreen.dart';
import 'package:flutter/material.dart';


class loginscreen extends StatelessWidget {
  const loginscreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(200, 197, 197, 1),
      body: SafeArea(
          child: Container(
        height: double.infinity,
        width: 400,
        child: Stack(
          children: [
            Text(
              "Define Yourself in your unique way!.",
              style: TextStyle(
                  fontSize: 60,
                  fontWeight: FontWeight.bold,
                  height: 1,
                  shadows: [
                    Shadow(
                      blurRadius: 3,
                      color: Colors.grey,
                      offset: Offset(3, 3),
                    )
                  ]),
            ),
            Positioned(
                bottom: 0,
              
              
                child: Image.asset("asset/images/Supreme-Model.jpg",fit: BoxFit.fitHeight,),
                
                
                 
              
                )
          ],
        ),
      )),
      bottomNavigationBar: BottomAppBar(
        color: Color.fromRGBO(200, 197, 197, 1),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(backgroundColor: Colors.black),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => HomeScreen()),
            );
          },
          child: Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Get Started",
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                      fontSize: 20),
                ),
                Icon(
                  Icons.arrow_forward,
                  color: Colors.white,
                  size: 20,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}