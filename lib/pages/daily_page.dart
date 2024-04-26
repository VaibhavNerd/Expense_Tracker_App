import 'package:budget_tracker_ui/json/daily_json.dart';
import 'package:budget_tracker_ui/json/day_month.dart';
import 'package:budget_tracker_ui/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_font_icons/flutter_font_icons.dart';


class DailyPage extends StatefulWidget {
  @override
  _DailyPageState createState() => _DailyPageState();
}

class _DailyPageState extends State<DailyPage> {
  int activeDay = 3;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: grey.withOpacity(0.05),
      body: getBody(),
    );

  }

  Widget getBody() {
    var size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(color: white, boxShadow: [
              BoxShadow(
                color: grey.withOpacity(0.01),
                spreadRadius: 10,
                blurRadius: 3,
                // changes position of shadow
              ),
            ]),
            child: Padding(
              padding: const EdgeInsets.only(
                  top: 60, right: 20, left: 20, bottom: 25),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Daily Transaction",
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: black),
                      ),
                      Icon(AntDesign.search1)
                    ],
                  ),
                  SizedBox(
                    height: 25,
                  ),
                  Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: List.generate(days.length, (index) {
                        return GestureDetector(
                          onTap: () {
                            setState(() {
                              activeDay = index;
                            });
                          },
                          child: Container(
                            width: (MediaQuery.of(context).size.width - 40) / 7,
                            child: Column(
                              children: [
                                Text(
                                  days[index]['label'],
                                  style: TextStyle(fontSize: 10),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Container(
                                  width: 30,
                                  height: 30,
                                  decoration: BoxDecoration(
                                      color: activeDay == index
                                          ? primary
                                          : Colors.transparent,
                                      shape: BoxShape.circle,
                                      border: Border.all(
                                          color: activeDay == index
                                              ? primary
                                              : black.withOpacity(0.1))),
                                  child: Center(
                                    child: Text(
                                      days[index]['day'],
                                      style: TextStyle(
                                          fontSize: 10,
                                          fontWeight: FontWeight.w600,
                                          color: activeDay == index
                                              ? white
                                              : black),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        );
                      }))
                ],
              ),
            ),
          ),

          Padding(
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: Column(
            children: <Widget>[
              Container(
                  padding: EdgeInsets.only(right: 15.0),
                  width: MediaQuery.of(context).size.width - 30.0,
                  height: MediaQuery.of(context).size.height - 50.0,
                  child: GridView.count(shrinkWrap: true,scrollDirection: Axis.vertical,
                    crossAxisCount: 2,
                    primary: false,
                    crossAxisSpacing: 10.0,
                    mainAxisSpacing: 15.0,
                    childAspectRatio: 0.8,
                    children: <Widget>[
                      _buildCard('Automobile', '\Rs.300.99', 'assets/images/auto.png',
                          false, false, context),
                      _buildCard('Bank', '\Rs.500', 'assets/images/bank.png',
                          false, true, context),
                      _buildCard('Eating', '\Rs.199',
                          'assets/images/eating.png', false, false, context),
                      _buildCard('Gift', '\$200', 'assets/images/gift.png',
                          false, false, context),
                      _buildCard('Charity', '\Rs.2,000',
                          'assets/images/charity.png', false, true, context),
                      _buildCard('Gift', '\$200', 'assets/images/gift.png',
                          false, false, context)
                    ],
                  )),
              SizedBox(height: 30.0)
            ],
          ),



          // //   child: Column(
          // //       children: List.generate(daily.length, (index) {
          // //     return Column(
          // //       children: [
          // //         Row(
          // //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
          // //           children: [
          // //             Container(
          // //               width: (size.width - 40) * 0.7,
          // //               child: Row(
          // //                 children: [
          // //                   Container(
          // //                     width: 50,
          // //                     height: 50,
          // //                     decoration: BoxDecoration(
          // //                       shape: BoxShape.circle,
          // //                       color: grey.withOpacity(0.1),
          // //                     ),
          // //                     child: Center(
          // //                       child: Image.asset(
          // //                         daily[index]['icon'],
          // //                         width: 30,
          // //                         height: 30,
          // //                       ),
          // //                     ),
          // //                   ),
          // //                   SizedBox(width: 15),
          // //                   Container(
          // //                     width: (size.width - 90) * 0.5,
          // //                     child: Column(
          // //                       mainAxisAlignment: MainAxisAlignment.center,
          // //                       crossAxisAlignment: CrossAxisAlignment.start,
          // //                       children: [
          // //                         Text(
          // //                           daily[index]['name'],
          // //                           style: TextStyle(
          // //                               fontSize: 15,
          // //                               color: black,
          // //                               fontWeight: FontWeight.w500),
          // //                           overflow: TextOverflow.ellipsis,
          // //                         ),
          // //                         SizedBox(height: 5),
          // //                         Text(
          // //                           daily[index]['date'],
          // //                           style: TextStyle(
          // //                               fontSize: 12,
          // //                               color: black.withOpacity(0.5),
          // //                               fontWeight: FontWeight.w400),
          // //                           overflow: TextOverflow.ellipsis,
          // //                         ),
          // //                       ],
          // //                     ),
          // //                   )
          // //                 ],
          // //               ),
          // //             ),
          // //             Container(
          // //               width: (size.width - 40) * 0.3,
          // //               child: Row(
          // //                 mainAxisAlignment: MainAxisAlignment.end,
          // //                 children: [
          // //                   Text(
          // //                     daily[index]['price'],
          // //                     style: TextStyle(
          // //                         fontWeight: FontWeight.w600,
          // //                         fontSize: 15,
          // //                         color: Colors.green),
          // //                   ),
          // //                 ],
          // //               ),
          // //             )
          // //           ],
          // //         ),
          // //         Padding(
          // //           padding: const EdgeInsets.only(left: 65, top: 8),
          // //           child: Divider(
          // //             thickness: 0.8,
          // //           ),
          // //         )
          // //       ],
          // //     );
          // //   })),
          // // ),
          // // SizedBox(
          // //   height: 15,
          // // ),
          // // Padding(
          // //   padding: const EdgeInsets.only(left: 20, right: 20),
          // //   child: Row(
          // //     children: [
          // //       Spacer(),
          // //       Padding(
          // //         padding: const EdgeInsets.only(right: 80),
          // //         child: Text(
          // //           "Total",
          // //           style: TextStyle(
          // //               fontSize: 16,
          // //               color: black.withOpacity(0.4),
          // //               fontWeight: FontWeight.w600),
          // //           overflow: TextOverflow.ellipsis,
          // //         ),
          // //       ),
          // //       Spacer(),
          // //       Padding(
          // //         padding: const EdgeInsets.only(top: 5),
          // //         child: Text(
          // //           "\$1780.00",
          // //           style: TextStyle(
          // //               fontSize: 20,
          // //               color: black,
          // //               fontWeight: FontWeight.bold),
          // //           overflow: TextOverflow.ellipsis,
          // //         ),
          // //       ),
          // //     ],
          // //   ),
          )
        ],
      ),
    );
  }
  Widget _buildCard(String name, String price, String imgPath, bool added,
      bool isFavorite, context) {
    return Padding(
        padding: EdgeInsets.only(top: 5.0, bottom: 5.0, left: 5.0, right: 5.0),
        child: InkWell(
            onTap: () {

            },
            child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15.0),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.grey.withOpacity(0.2),
                          spreadRadius: 3.0,
                          blurRadius: 5.0)
                    ],
                    color: Colors.white),
                child: Column(children: [
                  Padding(
                      padding: EdgeInsets.all(5.0),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            isFavorite
                                ? Icon(Icons.favorite, color: Color(0xFFEF7532))
                                : Icon(Icons.favorite_border,
                                color: Color(0xFFEF7532))
                          ])),
                  Hero(
                      tag: imgPath,
                      child: Container(
                          height: 75.0,
                          width: 75.0,
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage(imgPath),
                                  fit: BoxFit.contain)))),
                  SizedBox(height: 7.0),
                  Text(price,
                      style: TextStyle(
                          color: Color(0xFFCC8053),
                          fontFamily: 'Varela',
                          fontSize: 14.0)),
                  Text(name,
                      style: TextStyle(
                          color: Color(0xFF575E67),
                          fontFamily: 'Varela',
                          fontSize: 14.0)),
                  Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Container(color: Color(0xFFEBEBEB), height: 1.0)),
                  Padding(
                      padding: EdgeInsets.only(left: 5.0, right: 5.0),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            if (!added) ...[
                              Icon(Icons.shopping_basket,
                                  color: Color(0xFFD17E50), size: 12.0),
                              Text('Details',
                                  style: TextStyle(
                                      fontFamily: 'Varela',
                                      color: Color(0xFFD17E50),
                                      fontSize: 12.0))
                            ],
                            if (added) ...[
                              Icon(Icons.remove_circle_outline,
                                  color: Color(0xFFD17E50), size: 12.0),
                              Text('3',
                                  style: TextStyle(
                                      fontFamily: 'Varela',
                                      color: Color(0xFFD17E50),
                                      fontWeight: FontWeight.bold,
                                      fontSize: 12.0)),
                              Icon(Icons.add_circle_outline,
                                  color: Color(0xFFD17E50), size: 12.0),
                            ]
                          ]))
                ]))));
  }
}
