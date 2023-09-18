// ignore_for_file: prefer_const_constructors, must_be_immutable

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:petshop_app/util/Suggestions_card.dart';
import 'package:petshop_app/util/recommendation_card.dart';
import 'package:petshop_app/util/item_details.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:path/path.dart';

import 'package:petshop_app/util/input_field.dart';

class MobileLayout extends StatefulWidget {
  final bool hasNewNotification;
  final TextEditingController controller;
  final List items;
  final List exploreItems;
  final PageController pageController;
  final Function handleNotification;

  const MobileLayout(
      {super.key,
      required this.hasNewNotification,
      required this.controller,
      required this.items,
      required this.exploreItems,
      required this.handleNotification,
      required this.pageController});

  @override
  State<MobileLayout> createState() => _MobileLayoutState();
}

class _MobileLayoutState extends State<MobileLayout> {
  final String hintext = "Search in app";

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(17.0),
      child: Column(children: [
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
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                  )
                ],
              ),
            ),
            GestureDetector(
              onTap: () => widget.handleNotification(),
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
                  if (widget.hasNewNotification)
                    Positioned(
                        top: 0,
                        right: 0,
                        child: Container(
                          width: 8,
                          height: 8,
                          decoration: BoxDecoration(
                              shape: BoxShape.circle, color: Colors.green[200]),
                        ))
                ]),
              ),
            )
          ],
        ),
        Flexible(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      InputField(
                        controller: widget.controller,
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
                  padding: EdgeInsets.all(8.0),
                  child: SizedBox(
                    height: 250,
                    width: 400,
                    child: PageView.builder(
                      controller: widget.pageController,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) => SizedBox(
                        height: 150,
                        width: 350,
                        child: SuggestionCard(
                          image: widget.exploreItems[
                              index % widget.exploreItems.length][0],
                          displaytext: widget.exploreItems[
                              index % widget.exploreItems.length][1],
                          background_color: widget.exploreItems[
                              index % widget.exploreItems.length][2],
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 30,
                  width: 30,
                ),
                Center(
                    child: SmoothPageIndicator(
                        controller: widget.pageController,
                        count: widget.exploreItems.length)),
                SizedBox(
                  height: 20,
                  width: 20,
                ),
                TabsScroll(),
                SizedBox(
                  height: 20,
                  width: 20,
                ),
                SizedBox(
                  height: 250,
                  child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: widget.items.length,
                      itemBuilder: ((context, index) {
                        return GestureDetector(
                          onTap: () {
                            return context.go(
                                '/home/item_details/${widget.items[index][1]}/${basename(widget.items[index][0])}');
                          },
                          child: Recommend_Card(
                              width: 200,
                              height: 250,
                              image: widget.items[index][0],
                              text: widget.items[index][1]),
                        );
                      })),
                ),
              ],
            ),
          ),
        ),
      ]),
    );
  }
}

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
              margin: EdgeInsets.all(8.0),
              width: 120,
              decoration: BoxDecoration(
                color: index == selectedIndex
                    ? Colors.green[100]
                    : Color.fromARGB(255, 239, 238, 224),
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
