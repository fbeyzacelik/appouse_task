import 'package:appouse/Login/LoginForm.dart';
import 'package:appouse/product_operations/productUpdateDeletePage.dart';
import 'package:appouse/product_view_model/product_view_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  ProductViewModel laptopStore;
  ProductViewModel telephoneStore;

  @override
  void initState() {
    laptopStore = ProductViewModel();
    laptopStore.init();
    laptopStore.getLaptopData();
    telephoneStore = ProductViewModel();
    telephoneStore.init();
    telephoneStore.getTelephoneData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            title: Text("Ürünler"),
            leading: IconButton(
                icon: Icon(Icons.arrow_back, color: Colors.white),
                onPressed: () => Navigator.of(context).push(
                      CupertinoPageRoute(
                        settings: RouteSettings(name: "/LoginPage"),
                        builder: (context) => LoginForm(),
                      ),
                    )),
            actions: [
              IconButton(
                  onPressed: () => Navigator.of(context).push(CupertinoPageRoute(
            settings: RouteSettings(name: "/ProductUpdateDeletePage"),
                      builder: (context) => UpdateForm())),
                  icon: Icon(Icons.add_circle_outline))
            ],
            backgroundColor: Color(0xFF08C198),
            centerTitle: true,
            bottom: TabBar(
                indicatorWeight: 25.0,
                isScrollable: true,
                indicatorColor: Colors.transparent,
                indicatorSize: TabBarIndicatorSize.label,
                tabs: [
                  Container(
                      padding: EdgeInsets.all(10.0),
                      width: 170.0,
                      height: 50.0,
                      child: Tab(text: "Laptop"),
                      decoration: BoxDecoration(
                          color: Colors.green.shade600,
                          borderRadius: BorderRadius.circular(12.0))),
                  Container(
                      width: 170.0,
                      height: 50.0,
                      child: Tab(text: "Telefon"),
                      decoration: BoxDecoration(
                          color: Colors.grey.shade500,
                          borderRadius: BorderRadius.circular(12.0))),
                ]),
          ),
          body: TabBarView(
            children: [
              // ListView(
              //   shrinkWrap: true,
              //   scrollDirection: Axis.vertical,
              //children: [
              laptopDataList(),
              telephoneDataList()
            ],
          ),
          //],
        )
        //),

        );
  }

  Widget laptopDataList() {
    return Observer(builder: (context) {
      if (laptopStore.loading) {
        return Center(
          child: CircularProgressIndicator(),
        );
      } else {
        return Container(
          padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 8.0),
          child: ListView.builder(
              scrollDirection: Axis.vertical,
              itemCount: laptopStore.laptopList.length,
              itemBuilder: (context, index) {
                final laptopData = laptopStore.laptopList[index];
                return Container(
                  child: Column(
                    children: [
                      Card(
                        color: Colors.grey.shade600,
                        child: Container(
                          width: MediaQuery.of(context).size.width / 1.15,
                          height: MediaQuery.of(context).size.height / 6,
                          child: Padding(
                            padding: const EdgeInsets.only(
                              top: 10,
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Ürün ID: " + laptopData.id.toString(),
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Text("Adı: " + laptopData.title.toString(),
                                        style: TextStyle(color: Colors.white)),
                                    Text(
                                        "Fiyat: " +
                                            laptopData.price.toString() +
                                            "₺",
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold)),
                                  ],
                                ),
                                Column(
                                  children: [
                                    Container(
                                      width:
                                          MediaQuery.of(context).size.width / 3,
                                      height:
                                          MediaQuery.of(context).size.height /
                                              7,
                                      decoration: BoxDecoration(
                                        image: DecorationImage(
                                          fit: BoxFit.fill,
                                          image: NetworkImage(
                                            laptopData.thumbnail.toString(),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                );
              }),
        );
      }
    });
  }

  Widget telephoneDataList() {
    return Observer(builder: (context) {
      if (telephoneStore.loading) {
        return Center(
          child: CircularProgressIndicator(),
        );
      } else {
        return Container(
          padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 8.0),
          height: MediaQuery.of(context).size.height * 0.20,
          width: MediaQuery.of(context).size.width * 0.40,
          child: ListView.builder(
              scrollDirection: Axis.vertical,
              itemCount: telephoneStore.telephoneList.length,
              itemBuilder: (context, index) {
                final telephoneData = telephoneStore.telephoneList[index];
                return Container(
                  child: Column(
                    children: [
                      Card(
                        color: Colors.grey.shade600,
                        child: Container(
                          width: MediaQuery.of(context).size.width / 1.15,
                          height: MediaQuery.of(context).size.height / 6,
                          child: Padding(
                            padding: const EdgeInsets.only(
                              top: 10,
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Ürün ID: " + telephoneData.id.toString(),
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Text(
                                        "Adı: " +
                                            telephoneData.title.toString(),
                                        style: TextStyle(color: Colors.white)),
                                    Text(
                                        "Fiyat: " +
                                            telephoneData.price.toString() +
                                            "₺",
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold)),
                                  ],
                                ),
                                Column(
                                  children: [
                                    Container(
                                      width:
                                          MediaQuery.of(context).size.width / 3,
                                      height:
                                          MediaQuery.of(context).size.height /
                                              7,
                                      decoration: BoxDecoration(
                                        image: DecorationImage(
                                          fit: BoxFit.fill,
                                          image: NetworkImage(
                                            telephoneData.thumbnail.toString(),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                );
              }),
        );
      }
    });
  }
}
