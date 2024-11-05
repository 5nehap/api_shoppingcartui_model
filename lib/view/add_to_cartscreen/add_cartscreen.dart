import 'package:flutter/material.dart';

class AddCartscreen extends StatelessWidget {
  const AddCartscreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("MY cart"),
      ),
      body: Column(
        children: List.generate(
          2,
          (index) => Padding(
            padding: const EdgeInsets.all(10),
            child: Container(
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.grey,
              ),
              height: 150,
              width: double.infinity,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        height: 80,
                        width: 80,
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Column(
                        children: [Text("title"), Text("desc")],
                      ),
                      Spacer(),
                      Column(
                        children: [
                          ElevatedButton(onPressed: () {}, child: Text("+")),
                          Text("qt"),
                          ElevatedButton(onPressed: () {}, child: Text("-"))
                        ],
                      )
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                          onPressed: () {}, child: Text("Remove")))
                ],
              ),
            ),
          ),
        ),
     ),
);
  }
}
