import 'package:api_shoppingcartui_model/controller/addtocartcontroller.dart';
import 'package:api_shoppingcartui_model/controller/homescreencontroller.dart.dart';
import 'package:api_shoppingcartui_model/view/shopscreen/shopscreen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback(
      (timeStamp) async {
        await context.read<Addtocartcontroller>().initDb();

        // ignore: use_build_context_synchronously
        await context.read<HomeScreenController>().getcategory();
        
        await context.read<HomeScreenController>().getShop();
      },
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
 
        appBar: AppBar(
          title: Text(
            "Discover",
            style: TextStyle(
                fontWeight: FontWeight.bold, color: Colors.black, fontSize: 25),
          ),
          actions: [
            Stack(
              children: [
                Icon(
                  Icons.notifications_outlined,
                  color: Colors.black,
                  size: 35,
                ),
                Positioned(
                  right: 0,
                  top: 2,
                  child: CircleAvatar(
                    radius: 10,
                    backgroundColor: Colors.black,
                    child: Text(
                      "1",
                      style: TextStyle(color: Colors.white, fontSize: 8),
                    ),
                  ),
                )
              ],
            ),
            SizedBox(width: 20)
          ],
        ),
        body: Consumer<HomeScreenController>(
          builder: (context, providerObj, child) => Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Container(
                          height: 55,
                          decoration: BoxDecoration(
                              color: Color.fromARGB(255, 230, 228, 228),
                              borderRadius: BorderRadius.circular(10)),
                          child: Row(
                            children: [
                              SizedBox(width: 15),
                              Icon(
                                Icons.search_outlined,
                                color: Colors.black,
                                size: 35,
                              ),
                              SizedBox(width: 5),
                              Text(
                                "Search Anything",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: const Color.fromARGB(
                                        255, 129, 129, 129),
                                    fontSize: 16),
                              )
                            ],
                          ),
                        ),
                      ),
                      SizedBox(width: 10),
                      Container(
                        height: 55,
                        width: 55,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.black,
                        ),
                        child: Icon(
                          Icons.filter_list,
                          color: Colors.white,
                          size: 35,
                        ),
                      )
                    ],
                  ),
                  SizedBox(height: 15),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: List.generate(
                        providerObj.categoryList.length,
                        (index) => Padding(
                          padding:
                              EdgeInsets.symmetric(horizontal: 10, vertical: 8),
                          child: InkWell(
                            onTap: () {
                              context
                                  .read<HomeScreenController>()
                                  .onCategorySelection(providerObj
                                      .selectedIndexCategory = index);
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color:
                                    providerObj.selectedIndexCategory == index
                                        ? Colors.black
                                        : Colors.white,
                              ),
                              height: 50,
                              child: Center(
                                child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 10),
                                    child: Text(
                                      providerObj.categoryList[index],
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color:
                                            providerObj.selectedIndexCategory ==
                                                    index
                                                ? Colors.white
                                                : Colors.black,
                                      ),
                                    )),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  GridView.builder(
                    itemCount: providerObj.shopobj?.length ?? 0,
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        mainAxisSpacing: 10,
                        mainAxisExtent: 250,
                        crossAxisSpacing: 10),
                    itemBuilder: (context, index) => Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Stack(
                          children: [
                            GestureDetector(
                              onTap: () => Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => ProductScreen(
                                      id: providerObj.shopobj![index].id!,
                                    ),
                                  )),
                              child: Container(
                                height: 180,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(12),
                                    image: DecorationImage(
                                        fit: BoxFit.cover,
                                        image: NetworkImage(providerObj
                                                .shopobj?[index].image
                                                .toString() ??
                                            "nodata"))),
                              ),
                            ),
                            Positioned(
                              right: 10,
                              top: 10,
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  color: Colors.white,
                                ),
                                height: 35,
                                width: 35,
                                child: Icon(
                                  Icons.favorite_outline,
                                  size: 25,
                                  color: Colors.black,
                                ),
                              ),
                            )
                          ],
                        ),
                        Text(
                          providerObj.shopobj?[index].title.toString() ?? "",
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        Text(
                            textAlign: TextAlign.left,
                            providerObj.shopobj?[index].price.toString() ?? ""),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ));
  }
}
