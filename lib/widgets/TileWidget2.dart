import 'package:flutter/material.dart';

import '../models/Product.dart';
import '../global.dart';

class ProductTile2 extends StatefulWidget {
  final Product product1;
  final int index;
  final List<dynamic>? jsonData;

  const ProductTile2({
    Key? key,
    required this.product1,
    required this.jsonData,
    required this.index,
  }) : super(key: key);

  @override
  State<ProductTile2> createState() => _ProductTileState2();
}

class _ProductTileState2 extends State<ProductTile2> {
  //
  @override
  Widget build(BuildContext context) {
    var screenHeight = MediaQuery.of(context).size.height;
    var screenWidth = MediaQuery.of(context).size.width;
    final Product myProduct = widget.product1;
    final int myIndex = widget.index;

    print('myIndex: $myIndex');
    print('jsonData: ${widget.jsonData}');
    print(Global.res2[0].id);
    print(Global.res2[1].id);
    print(Global.res2[2].id);
    print(Global.res2[3].id);
    print(Global.res2[4].id);

    return GestureDetector(
      onTap: () {
        // Navigator.push(
        //   context,
        //   MaterialPageRoute(
        //     builder: (context) => page2(product1: product1),//prdouct1 ki jgh myProduct likhayega kya
        //   ),
        // );
      },
      child: ClipRRect(
        // clipprect se wrap kr do to give rectangle circular shape to any container
        borderRadius: BorderRadius.circular(15),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: screenHeight * 0.20,
                width: screenWidth * 0.7,
                child: Image.asset(
                  myProduct.imageUrl,
                  fit: BoxFit.fill,
                  alignment: Alignment.topCenter,
                ),
              ),
              Container(
                // decoration: const BoxDecoration(color: Colors.blue),
                // height: screenHeight * 0.30,
                // width: screenWidth * 0.7,
                padding: const EdgeInsets.only(left: 15, right: 15, top: 15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          Global.res2[myIndex].category,
                          style:
                              const TextStyle(color: Colors.blue, fontSize: 14),
                        ),
                        Text(
                          Global.res2[myIndex].id,
                          style:
                              const TextStyle(color: Colors.red, fontSize: 14),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 7,
                    ),
                    Text(
                      Global.res2[myIndex].name,
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 17),
                    ),
                    const SizedBox(
                      height: 7,
                    ),
                    Text(
                      Global.res2[myIndex].createdAt,
                      style: const TextStyle(fontSize: 14),
                    ),
                    const SizedBox(
                      height: 9,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Duration: ${Global.res2[myIndex].duration}',
                          style: const TextStyle(fontSize: 10),
                        ),
                        Text(
                          'Locked: ${Global.res2[myIndex].locked}',
                          style: const TextStyle(fontSize: 10),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 55,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        if (myProduct.Y == 2)
                          ElevatedButton(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30),
                              ),
                              foregroundColor: Colors.blue,
                              backgroundColor: Colors.white,
                              side: const BorderSide(color: Colors.blue),
                            ),
                            child: const Text(' Book '),
                          ),
                        if (myProduct.Y == 3)
                          IconButton(
                              onPressed: () {},
                              icon: const Icon(Icons.lock_outlined))
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
