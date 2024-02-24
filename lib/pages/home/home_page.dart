import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:stock_track/common/components/utils.dart';
import 'package:stock_track/pages/home/animation/clickDateAnimation.dart';
import 'package:stock_track/pages/home/animation/clickTodayAnimation.dart';
import 'package:stock_track/pages/home/controller/controller_claendar.dart';
import 'package:stock_track/pages/home/home_calendar.dart';
import 'package:intl/intl.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:stock_track/pages/home/home_detail.dart';
import 'package:stock_track/pages/home/home_summary.dart';

class HomeView extends StatelessWidget {
  DateTime datePickTime = DateTime.now();
  var calendarCtrl = Get.put(CalendarLogic());
  CarouselController carouselController = Get.put(CarouselController());
  var clickTodayCtrl = Get.put(ClickTodayAnimation());
  var clickDateCtrl = Get.put(ClickDateAnimation());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: GetBuilder<CalendarLogic>(
          builder: (_) => Container(
                child: GetBuilder<ClickTodayAnimation>(builder: (_click) {
                  return Stack(
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Expanded(
                            flex: 4,
                            child: Container(
                              margin: const EdgeInsets.only(
                                  left: 30, top: 65, right: 0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Flexible(
                                    flex: 5,
                                    child: GestureDetector(
                                      behavior: HitTestBehavior.opaque,
                                      onTap: () {},
                                      onTapDown: (d) {
                                        clickTodayCtrl.tapDown();
                                        calendarCtrl.getShack();
                                        var nowTimeStamp = DateTime.now();
                                        var nowTime = DateFormat('yyyy-MM-dd')
                                            .format(nowTimeStamp);
                                        if (nowTime ==
                                            calendarCtrl
                                                .currentTimeMap['full_date']) {
                                          return;
                                        }
                                        carouselController.animateToPage(
                                            _.timeList.length ~/ 14);
                                        _.setDate(nowTimeStamp);
                                        _.setTimeListDate(nowTimeStamp);
                                        _.setCalendarIndex(
                                            _.timeList.length ~/ 14);
                                        _.update();
                                      },
                                      onTapUp: (d) {
                                        clickTodayCtrl.prepareToIdle();
                                      },
                                      onTapCancel: () =>
                                          clickTodayCtrl.prepareToIdle(),
                                      child: Text(
                                        'Today',
                                        style: GoogleFonts.limelight(
                                          fontSize: isToday(
                                                  _.currentTimeMap['full_date'])
                                              ? getMinNum(
                                                      clickTodayCtrl.periodInt,
                                                      0.95) *
                                                  30
                                              : 30,
                                          fontWeight: FontWeight.w700,
                                          color: isTodayFont(
                                                  _.currentTimeMap['full_date'],
                                                  context)
                                              .withOpacity(isToday(
                                                      _.currentTimeMap[
                                                          'full_date'])
                                                  ? getMinNum(
                                                      clickTodayCtrl.periodInt,
                                                      0.8)
                                                  : 1),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Flexible(
                                    flex: 5,
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        Flexible(
                                          flex: 3,
                                          child: IconButton(
                                            highlightColor: Colors.transparent,
                                            hoverColor: Colors.transparent,
                                            splashColor: Colors.transparent,
                                            onPressed: () {},
                                            icon:
                                                FaIcon(FontAwesomeIcons.search),
                                            iconSize: 18,
                                            color: Theme.of(context)
                                                .primaryColorDark,
                                          ),
                                        ),
                                        Flexible(
                                          flex: 3,
                                          child: IconButton(
                                            highlightColor: Colors.transparent,
                                            hoverColor: Colors.transparent,
                                            splashColor: Colors.transparent,
                                            onPressed: () {
                                              datePickTime =
                                                  _.currentTimeMap['dateTime'];
                                              Utils.showSheet(context,
                                                  child: buildDatePicker(),
                                                  onClicked: () {
                                                _.setDate(datePickTime);
                                                _.setTimeListDate(datePickTime);
                                                _.setCalendarIndex(
                                                    _.timeList.length ~/ 14);
                                                carouselController.jumpToPage(
                                                    _.timeList.length ~/ 14);
                                                _.update();
                                                Navigator.pop(context);
                                              });
                                            },
                                            icon: const FaIcon(
                                                FontAwesomeIcons.calendarAlt),
                                            iconSize: 18,
                                            color: Theme.of(context)
                                                .primaryColorDark,
                                          ),
                                        ),
                                        // const Spacer(
                                        //   flex: 1,
                                        // ),
                                        Expanded(
                                            flex: 10,
                                            child:
                                                GetBuilder<ClickDateAnimation>(
                                                    builder: (_clickDate) {
                                              return GestureDetector(
                                                behavior:
                                                    HitTestBehavior.opaque,
                                                onTap: () {},
                                                onTapDown: (d) {
                                                  clickDateCtrl.tapDown();
                                                },
                                                onTapUp: (d) {
                                                  clickDateCtrl.prepareToIdle();
                                                  datePickTime =
                                                      _.currentTimeMap[
                                                          'dateTime'];
                                                  Utils.showSheet(context,
                                                      child: buildDatePicker(),
                                                      onClicked: () {
                                                    print(
                                                        'datePickTime:>>>>${datePickTime}');
                                                    _.setDate(datePickTime);
                                                    _.setTimeListDate(
                                                        datePickTime);
                                                    _.setCalendarIndex(
                                                        _.timeList.length ~/
                                                            14);
                                                    carouselController
                                                        .jumpToPage(
                                                            _.timeList.length ~/
                                                                14);
                                                    _.update();
                                                    Navigator.pop(context);
                                                  });
                                                },
                                                onTapCancel: () => clickDateCtrl
                                                    .prepareToIdle(),
                                                child: Text(
                                                  ' ${_.currentTimeMap['month']} ${_.currentTimeMap['year']}',
                                                  style: GoogleFonts.amaranth(
                                                    fontSize: getMinNum(
                                                            clickDateCtrl
                                                                .periodInt,
                                                            0.95) *
                                                        20,
                                                    fontWeight: FontWeight.w500,
                                                    fontStyle: FontStyle.normal,
                                                    color: isNotTodayFont(
                                                            _.currentTimeMap[
                                                                'full_date'],
                                                            context)
                                                        .withOpacity(!isToday(
                                                                _.currentTimeMap[
                                                                    'full_date'])
                                                            ? getMinNum(
                                                                clickDateCtrl
                                                                    .periodInt,
                                                                0.8)
                                                            : 1),
                                                  ),
                                                ),
                                              );
                                            }))
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 3,
                            child: Calendar(),
                          ),
                          Expanded(
                            flex: 3,
                            child: Summary(),
                          ),
                          Expanded(
                            flex: 18,
                            child: Detail(),
                          ),
                        ],
                      ),
                      Align(
                        alignment: Alignment.bottomCenter,
                        child: Container(
                          height: 150,
                          decoration: const BoxDecoration(
                            gradient: LinearGradient(
                              colors: [
                                Color.fromRGBO(229, 229, 229, 0),
                                Color.fromRGBO(255, 255, 255, 1)
                              ],
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                            ),
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment.bottomCenter,
                        child: Container(
                          margin: const EdgeInsets.only(
                              left: 100, right: 100, bottom: 50),
                          height: 50,
                          decoration: BoxDecoration(
                            color: Theme.of(context).scaffoldBackgroundColor,
                            borderRadius: const BorderRadius.all(
                              Radius.circular(24.0),
                            ),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Flexible(
                                flex: 2,
                                child: IconButton(
                                  padding: EdgeInsets.only(bottom: 0.0),
                                  highlightColor: Colors.transparent,
                                  hoverColor: Colors.transparent,
                                  splashColor: Colors.transparent,
                                  onPressed: () {},
                                  icon: FaIcon(FontAwesomeIcons.chartArea),
                                  iconSize: 20,
                                  color: Theme.of(context).primaryColorLight,
                                ),
                              ),
                              VerticalDivider(
                                width: 0,
                                thickness: 1,
                                indent: 15,
                                endIndent: 15,
                                color: Theme.of(context).primaryColorLight,
                              ),
                              Flexible(
                                flex: 2,
                                child: IconButton(
                                  padding: EdgeInsets.only(bottom: 0.0),
                                  highlightColor: Colors.transparent,
                                  hoverColor: Colors.transparent,
                                  splashColor: Colors.transparent,
                                  onPressed: () {},
                                  icon: FaIcon(FontAwesomeIcons.plus),
                                  iconSize: 22,
                                  color: Theme.of(context).primaryColor,
                                ),
                              ),
                              VerticalDivider(
                                width: 0,
                                thickness: 1,
                                indent: 15,
                                endIndent: 15,
                                color: Theme.of(context).primaryColorLight,
                              ),
                              Flexible(
                                flex: 2,
                                child: IconButton(
                                  padding: EdgeInsets.only(bottom: 0.0),
                                  highlightColor: Colors.transparent,
                                  hoverColor: Colors.transparent,
                                  splashColor: Colors.transparent,
                                  onPressed: () {},
                                  icon: FaIcon(FontAwesomeIcons.userAlt),
                                  iconSize: 20,
                                  color: Theme.of(context).primaryColorLight,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  );
                }),
              )),
    );
  }

  //時間
  Widget buildDatePicker() => SizedBox(
        height: 180,
        child: GetBuilder<CalendarLogic>(
            builder: (_) => CupertinoTheme(
                  data: const CupertinoThemeData(
                    textTheme: CupertinoTextThemeData(
                      dateTimePickerTextStyle: TextStyle(
                        fontSize: 20,
                      ),
                    ),
                  ),
                  child: CupertinoDatePicker(
                      key: UniqueKey(),
                      // minimumYear: 2015,
                      maximumYear: DateTime.now().year,
                      initialDateTime: _.currentTimeMap['dateTime'],
                      mode: CupertinoDatePickerMode.date,
                      onDateTimeChanged: (dateTime) {
                        datePickTime = dateTime;
                      }
                      // _.setDate(_.timeList[7 * index + item]['dateTime']);
                      // setState(() => this.dateTime = dateTime),
                      ),
                )),
      );
}

bool isToday(date) {
  return date == DateFormat('yyyy-MM-dd').format(DateTime.now());
}

Color isTodayFont(data, context) {
  return isToday(data)
      ? Theme.of(context).primaryColorLight
      : Theme.of(context).primaryColorDark;
}

Color isNotTodayFont(data, context) {
  return isToday(data)
      ? Theme.of(context).primaryColorDark
      : Theme.of(context).primaryColorLight;
}
