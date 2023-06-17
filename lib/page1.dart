// ignore_for_file: non_constant_identifier

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutterassignmentkrityuk/global.dart';
import 'package:flutterassignmentkrityuk/provider.dart';
import 'package:provider/provider.dart';

import 'modelCardOne.dart';
import 'modelCardTwo.dart';
import 'widgets/MyWidget.dart';
import 'widgets/TileWidget1.dart';
import 'widgets/TileWidget2.dart';

class Page1 extends StatefulWidget {
  const Page1({super.key});

  @override
  State<Page1> createState() => _Page1State();
}

class _Page1State extends State<Page1> {
  //
  bool isLoaded1 = false;
  bool isLoaded2 = false;
  List<dynamic> jsonData1 = [];
  List<dynamic> jsonData2 = [];

  @override
  void initState() {
    super.initState();
    fetchApiData1('https://632017e19f82827dcf24a655.mockapi.io/api/programs');
    fetchApiData2('https://632017e19f82827dcf24a655.mockapi.io/api/lessons');
    // debugPrint('MyValue1 is ${jsonData1[0]['id']}');
    // debugPrint('MyValue2 is ${jsonData2[0]['id']}');
    //debugPrint is here just to check that api data came here or not
  }

  fetchApiData1(String url) async {
    try {
      final response = await Dio().get(url);
      final List<dynamic> jsonDataItems = response.data['items'];
      //
      debugPrint('jsonData is currently $jsonDataItems');
      for (var itemData in jsonDataItems) {
        final modelCardOne item = modelCardOne.fromJson(itemData);
        jsonData1.add(item);
      }
      // debugPrint('jsonData is currently $jsonDataItems');
      debugPrint('hello    jsonData is now     ${jsonData1[3].id}');
      //
      if (jsonData1[0].id != null) {
        setState(() {
          isLoaded1 = true;
        });
      }
      Global.res1 = jsonData1;

      // Print the value of jsonData['items'][0]['id']
      // debugPrint('Myvalue1 is ${jsonDataItems[0]['id']}');
      // debugPrint('Myvalue1 is ${jsonData1[0]['id']}');
      return jsonData1;
    } catch (error) {
      // Handle error
      debugPrint('error is ${error.toString()}');
    }
  }

  fetchApiData2(String url) async {
    try {
      final response = await Dio().get(url);
      final List<dynamic> jsonDataItems = response.data['items'];
      //
      // debugPrint('jsonData is ${jsonEncode(jsonData)}');
      for (var itemData in jsonDataItems) {
        final modelCardTwo item = modelCardTwo.fromJson(itemData);
        jsonData2.add(item);
      }
      if (jsonData2[0].id != null) {
        setState(() {
          isLoaded2 = true;
        });
        Global.res2 = jsonData2;
        debugPrint('hbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbb');
        debugPrint(jsonData2[0].duration);
      }

      // Print the value of jsonData['items'][0]['id']
      // debugPrint('Myvalue2 is ${jsonDataItems[0]['id']}');
      return jsonData2;
    } catch (error) {
      // Handle error
      debugPrint('error is ${error.toString()}');
    }
  }

  @override
  Widget build(BuildContext context) {
    var screenHeight = MediaQuery.of(context).size.height;
    var screenWidth = MediaQuery.of(context).size.width;
    final ProductsList = Provider.of<Products>(context).items;

    return SingleChildScrollView(
        child: Column(
      children: [
        Container(
          padding: const EdgeInsets.only(top: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                icon: const Icon(
                  Icons.menu,
                  color: Colors.grey,
                ),
                onPressed: () {
                  // onPressed for menu IconButton
                },
              ),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  IconButton(
                    icon: const Icon(
                      Icons.chat,
                      color: Colors.grey,
                    ),
                    onPressed: () {
                      // onPressed for chat IconButton
                    },
                  ),
                  IconButton(
                    icon: const Icon(
                      Icons.notifications_outlined,
                      color: Colors.grey,
                    ),
                    onPressed: () {
                      // onPressed for alarm IconButton
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
        Container(
          width: screenWidth,
          padding: const EdgeInsets.all(14),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Hello, Priya!',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  fontFamily: 'Times New Roman',
                ),
              ),
              const SizedBox(height: 5),
              const Text(
                'What do you wanna learn today?',
                style: TextStyle(color: Colors.grey),
              ),
              SizedBox(
                height: screenHeight * 0.05,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  MyWidget(Icons.book, 'Programs'),
                  MyWidget(Icons.help, 'Get help'),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  MyWidget(Icons.menu_book_outlined, 'Learn'),
                  MyWidget(Icons.check_box_outline_blank, 'DD Tracker'),
                ],
              ),
            ],
          ),
        ),
        Container(
          decoration: const BoxDecoration(color: Colors.white),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(14),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    Text(
                      'Programs for you',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        fontFamily: 'Times New Roman',
                      ),
                    ),
                    Text(
                      'View all ➔',
                      style: TextStyle(color: Colors.grey),
                    )
                  ],
                ),
              ),
              //************ */
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 14),
                height: screenHeight * 0.45,
                width: double.infinity,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: Global.res1.length,
                  itemBuilder: (context, index) {
                    return Container(
                      height: screenHeight * 0.45,
                      width: screenWidth * 0.7,
                      margin: const EdgeInsets.only(
                        top: 10,
                        right: 20,
                        bottom: 20,
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        border: Border.all(color: Colors.grey.withOpacity(0.2)),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.02),
                            spreadRadius: 2,
                            blurRadius: 5,
                            offset: const Offset(0, 2),
                            // Offset in the bottom-right direction
                          ),
                        ],
                      ),
                      child: (isLoaded1)
                          ? ProductTile1(
                              product1: ProductsList[0],
                              jsonData: jsonData1,
                              index: index,
                            )
                          : Container(
                              width: 30, // Set the desired width
                              height: 30, // Set the desired height
                              padding: const EdgeInsets.only(
                                  left: 60, top: 60, bottom: 130, right: 60),
                              child: const CircularProgressIndicator(
                                strokeWidth:
                                    3, // Set the thickness of the progress indicator
                                valueColor: AlwaysStoppedAnimation<Color>(Colors
                                    .blue), // Set the color of the progress indicator
                                // backgroundColor: Colors
                                //     .grey, // Set the background color of the progress indicator
                              ),
                            ),
                    );
                  },
                ),
              ),

              //********************************************* */
              Padding(
                padding: const EdgeInsets.all(14),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    Text(
                      'Events and experiences',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                    ),
                    Text(
                      'View all ➔',
                      style: TextStyle(color: Colors.grey),
                    )
                  ],
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 14),
                height: screenHeight * 0.45,
                width: double.infinity,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: Global.res2.length,
                  itemBuilder: (context, index) {
                    return Container(
                      height: screenHeight * 0.45,
                      width: screenWidth * 0.7,
                      margin: const EdgeInsets.only(
                        top: 10,
                        right: 20,
                        bottom: 20,
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(color: Colors.black),
                      ),
                      child: (isLoaded2)
                          ? ProductTile2(
                              product1: ProductsList[1],
                              jsonData: jsonData2,
                              index: index,
                            )
                          : const CircularProgressIndicator(),
                    );
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(14),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    Text(
                      'Lessons for you',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                    ),
                    Text('View all ➔')
                  ],
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 14),
                height: screenHeight * 0.45,
                width: double.infinity,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: Global.res2.length,
                  itemBuilder: (context, index) {
                    return Container(
                      height: screenHeight * 0.45,
                      width: screenWidth * 0.7,
                      margin: const EdgeInsets.only(
                        top: 10,
                        right: 20,
                        bottom: 20,
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(color: Colors.black),
                      ),
                      child: (isLoaded2)
                          ? ProductTile2(
                              product1: ProductsList[2],
                              jsonData: jsonData2,
                              index: index,
                            )
                          : const CircularProgressIndicator(),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ],
    ));
  }
}

class Page2 extends StatelessWidget {
  const Page2({super.key});
  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text('Page 2'),
    );
  }
}

class Page3 extends StatelessWidget {
  const Page3({super.key});
  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text('Page 3'),
    );
  }
}

class Page4 extends StatelessWidget {
  const Page4({super.key});
  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text('Page 4'),
    );
  }
}

class Page5 extends StatelessWidget {
  const Page5({super.key});
  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text('Page 5'),
    );
  }
}