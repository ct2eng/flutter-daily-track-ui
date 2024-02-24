import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'dart:ui';
import 'package:flutter/src/widgets/scroll_physics.dart';
import 'dart:math';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:stock_track/pages/home/animation/clickTodayAnimation.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:stock_track/pages/home/controller/controller_claendar.dart';

class Calendar extends StatelessWidget {
  var calendarCtrl = Get.put(CalendarLogic());
  var clickCtrl = Get.put(ClickTodayAnimation());

  CarouselController carouselController = Get.put(CarouselController());

  void jumpTo(index) {
    print('index>>>${index}');
    carouselController.jumpToPage(index);
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Container(
        width: screenWidth,
        // color: Colors.white,
        height: 100,
        child: GetBuilder<CalendarLogic>(
          // ListView.builder(
          builder: (_) => CarouselSlider.builder(
            carouselController: carouselController,
            options: CarouselOptions(
              autoPlay: false,
              reverse: false,
              enlargeCenterPage: false,
              viewportFraction: 1,
              initialPage: _.timeList.length ~/ 14,
              enableInfiniteScroll: false,
              onPageChanged: (index, reason) {
                print('reason.name: ${reason.name}');
                print('reason.name >>>>${reason.name == 'manual'}');
                if (reason.name == 'manual') {
                  print(_.currentCalendarIndex - index);
                  _.setDate(_.currentTimeMap['dateTime'].subtract(
                      Duration(days: (_.currentCalendarIndex - index) * 7)));

                  _.setCalendarIndex(index);
                  _.update();
                }
              },
            ),
            itemCount: _.timeList.length ~/ 7,
            // controller: _controller,
            // scrollDirection: Axis.horizontal,

            itemBuilder: (BuildContext context, int index, int pageViewIndex) =>
                // itemBuilder: (BuildContext context, int index) {
                Container(
              // alignment: Alignment.center,
              // width: screenWidth,
              // color: Colors.white,
              child: Row(
                children: [
                  const Spacer(
                    flex: 2,
                  ),
                  Expanded(
                    flex: 26,
                    child: Row(
                      children: <Widget>[
                        for (int item = 0; item < 7; item++)
                          // if (item >= index * 7 && item < (index + 1) * 7)
                          Expanded(
                            // width: screenWidth / 8,
                            flex: 1,
                            // alignment: Alignment.center,
                            child: Container(
                              height: 75,
                              decoration: BoxDecoration(
                                color: isTodayDay(_, 7 * index + item)
                                    ? Theme.of(context).primaryColor
                                    : Colors.transparent,
                                borderRadius: const BorderRadius.all(
                                  Radius.circular(10.0),
                                ),
                              ),
                              child: GestureDetector(
                                behavior: HitTestBehavior.opaque,
                                onTap: () {},
                                onTapDown: (d) {
                                  clickCtrl.tapDown();
                                  _.setDate(
                                      _.timeList[7 * index + item]['dateTime']);
                                  _.update();
                                },
                                onTapUp: (d) {
                                  clickCtrl.prepareToIdle();
                                },
                                onTapCancel: () => clickCtrl.prepareToIdle(),
                                child: GetBuilder<ClickTodayAnimation>(
                                  builder: (_click) {
                                    return Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          '${_.timeList[7 * index + item]['day']}',
                                          style: GoogleFonts.amaranth(
                                            fontSize: isTodayDay(
                                                    _, 7 * index + item)
                                                ? getMinNum(
                                                        _click.periodInt, 0.9) *
                                                    14
                                                : 14,
                                            fontWeight:
                                                isTodayDay(_, 7 * index + item)
                                                    ? FontWeight.w700
                                                    : FontWeight.w500,
                                            color: isFont(_, 7 * index + item,
                                                    context, Colors.grey)
                                                .withOpacity(isTodayDay(
                                                        _, 7 * index + item)
                                                    ? getMinNum(
                                                        _click.periodInt, 0.5)
                                                    : 1),
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 2,
                                        ),
                                        Text(
                                          '${_.timeList[7 * index + item]['date']}',
                                          style: GoogleFonts.amaranth(
                                            fontSize: isTodayDay(
                                                    _, 7 * index + item)
                                                ? getMinNum(
                                                        _click.periodInt, 0.9) *
                                                    16
                                                : 16,
                                            fontWeight:
                                                isTodayDay(_, 7 * index + item)
                                                    ? FontWeight.w700
                                                    : FontWeight.w500,
                                            color: isFont(_, 7 * index + item,
                                                    context, Colors.white)
                                                .withOpacity(isTodayDay(
                                                        _, 7 * index + item)
                                                    ? getMinNum(
                                                        _click.periodInt, 0.5)
                                                    : 1),
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        Container(
                                          width: 4.0,
                                          height: 4.0,
                                          decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            color: isFont(_, 7 * index + item,
                                                    context, Colors.white)
                                                .withOpacity(isTodayDay(
                                                        _, 7 * index + item)
                                                    ? getMinNum(
                                                        _click.periodInt, 0.5)
                                                    : 1),
                                          ),
                                        ),
                                        // Text(
                                        //   '*',
                                        //   style: TextStyle(
                                        //     fontSize: 14,
                                        //     fontWeight: FontWeight.w500,
                                        //     color: isFont(_, 7 * index + item,
                                        //             context, Colors.white)
                                        //         .withOpacity(
                                        //             isTodayDay(_, 7 * index + item)
                                        //                 ? _click.periodInt
                                        //                 : 1),
                                        //   ),
                                        // ),
                                      ],
                                    );
                                  },
                                ),
                              ),
                            ),
                          ),
                      ],
                    ),
                  ),
                  const Spacer(
                    flex: 2,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

bool isTodayDay(data, int index) {
  return data.timeList[index]['full_date'] == data.currentTimeMap['full_date'];
}

Color isFont(data, int index, context, ccolor) {
  return isTodayDay(data, index)
      ? Theme.of(context).scaffoldBackgroundColor
      : ccolor;
}

// 為了不要讓動畫掉到0，設一個最小值
double getMinNum(animationNum, min) {
  return animationNum < min ? min : animationNum;
}
