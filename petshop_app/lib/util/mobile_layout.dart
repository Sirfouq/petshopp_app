// ignore_for_file: prefer_const_constructors, must_be_immutable

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:petshop_app/util/recommendation_card.dart';

import 'input_field.dart';

class MobileLayout extends StatelessWidget {
  final bool hasNewNotification;
  final TextEditingController controller;
  final List items;
  final Function handleNotification;

  final String hintext = "Search in app";

  const MobileLayout(
      {super.key,
      required this.hasNewNotification,
      required this.controller,
      required this.items,
      required this.handleNotification});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(15.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                child: Row(
                  children: [
                    CircleAvatar(
                      radius: 20,
                      backgroundColor: Colors.purple[100],
                      backgroundImage: AssetImage('lib/assets/dog_toys.png'),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      'Hello @User',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                    )
                  ],
                ),
              ),
              GestureDetector(
                onTap: () => handleNotification(),
                child: Container(
                  width: 50,
                  height: 50,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20)),
                  child: Stack(children: [
                    Center(
                      child: Icon(
                        Icons.notifications,
                        color: Color.fromARGB(255, 118, 118, 110),
                      ),
                    ),
                    if (hasNewNotification)
                      Positioned(
                          top: 0,
                          right: 0,
                          child: Container(
                            width: 8,
                            height: 8,
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.green[200]),
                          ))
                  ]),
                ),
              )
            ],
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InputField(
                  controller: controller,
                  hintext: hintext,
                ),
                Container(
                  height: 50,
                  width: 50,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.green[100],
                  ),
                  child: Image.asset(
                    'lib/assets/searching.png',
                  ),
                )
              ],
            ),
          ),
          Padding(
              padding: EdgeInsets.all(10),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text('For You',
                        textAlign: TextAlign.start,
                        style: TextStyle(
                            fontSize: 26, fontWeight: FontWeight.bold))
                  ])),
          SizedBox(
            height: 250,
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: items.length,
                itemBuilder: ((context, index) {
                  return GestureDetector(
                    onTap: () {
                      return context.go('/dashboard/item_details/${items[index][1]}');
                    },
                    child: Recommend_Card(
                        background_color: Colors.green[100] ?? Colors.grey,
                        image: items[index][0],
                        text: items[index][1]),
                  );
                })),
          ),
          SizedBox(
            height: 20,
            width: 20,
          ),
          TabsScroll(),
        ],
      ),
    );
  }
}

// class TabsScroll extends StatelessWidget {
//   final List items = ["All", "Food", "Toys", "Accessories", "Containers"];

//   TabsScroll({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return ListView.builder(
//       scrollDirection: Axis.horizontal,
//       itemCount: items.length,
//       itemBuilder: (context, index) {
//         return Container();
//       },
//     );
//   }
// }

class TabsScroll extends StatefulWidget {
  const TabsScroll({Key? key});

  @override
  State<TabsScroll> createState() => _TabsScrollState();
}

class _TabsScrollState extends State<TabsScroll> {
  final List<String> items = [
    "All",
    "Food",
    "Toys",
    "Accessories",
    "Containers"
  ];
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: items.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              setState(() {
                selectedIndex = index;
              });
            },
            child: Container(
              width: 120,
              decoration: BoxDecoration(
                color: index == selectedIndex
                    ? Colors.green[100]
                    : Colors.red[250],
                borderRadius: BorderRadius.circular(20),
              ),
              child: Center(
                child: Text(
                  items[index],
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: index == selectedIndex
                        ? Colors.white
                        : Colors.black, // Set text color for unselected tabs
                    fontSize: 18,
                    fontFamily: GoogleFonts.openSans().fontFamily,
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
