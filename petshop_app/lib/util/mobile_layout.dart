import 'package:flutter/material.dart';
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
                  style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold))),
          Container(
            height: 250,
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: items.length,
                itemBuilder: ((context, index) {
                  return Recommend_Card(
                      background_color: Colors.green[100] ?? Colors.grey,
                      image: items[index][0],
                      text: items[index][1]);
                })),
          )
        ],
      ),
    );
  }
}
