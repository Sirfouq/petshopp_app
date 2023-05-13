// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:petshop_app/util/input_field.dart';
import 'package:petshop_app/util/recommendation_card.dart';

class DashBoard extends StatefulWidget {
 const DashBoard({super.key});

  @override
  State<DashBoard> createState() => _DashBoardState();
}

class _DashBoardState extends State<DashBoard> {
  bool hasNewNotification = true;
  final controller = TextEditingController();
  final hintext = 'Search in app .....';
  final List items = [
    ['lib/assets/dog_food.png',  'Naturea'],
    ['lib/assets/dog_toys.png',  'Doggies'],
    ['lib/assets/dog_food.png', 'Royal Canin']
  ];

  void handleNotification() {
    setState(() => hasNewNotification = false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 239, 238, 224),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(25.0),
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
                          backgroundImage:
                              AssetImage('lib/assets/dog_toys.png'),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          'Hello @User',
                          style: TextStyle(
                              fontFamily: GoogleFonts.inter().fontFamily,
                              fontWeight: FontWeight.bold,
                              fontSize: 16),
                        )
                      ],
                    ),
                  ),
                  GestureDetector(
                    onTap: () => handleNotification(),
                    child: Container(
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10)),
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
                  child: Text('For You',
                      textAlign: TextAlign.start,
                      style: TextStyle(
                          fontSize: 26,
                          fontFamily: GoogleFonts.montserrat().fontFamily,
                          fontWeight: FontWeight.bold))),
              Container(
                height: 250,
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: items.length,
                    itemBuilder: ((context, index) {
                      return Recommend_Card(
                          background_color: Colors.green[100]??Colors.grey,
                          image: items[index][0],
                          text: items[index][1]);
                    })),
              )
            ],
          ),
        ),
      ),
    );
  }
}
