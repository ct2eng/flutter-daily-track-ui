import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:flutter_vibrate/flutter_vibrate.dart';

class CalendarLogic extends GetxController {
  DateTime nowDate = DateTime.now();
  List timeList = [].obs; // 輪播時間map
  Map currentTimeMap = {}.obs; //選中時間map
  bool _canVibrate = true;

  // 前後80天(10 + 7*10(前後10天＋往後7的倍數))
  var calendarWeekLen = 80;

  // 當前頁面
  var currentCalendarIndex = 0;

  // 設定選中時間
  setDate(chooseDate) {
    getShack();
    print('chooseDate>>> ${chooseDate}');
    currentTimeMap = setSelectMap(chooseDate);
  }

  // 設定選中時間
  setTimeListDate(chooseDate) {
    print('chooseDate>2>> ${chooseDate}');
    timeList = getDayList(chooseDate);
  }

  // 設定選中時間
  setCalendarIndex(index) {
    currentCalendarIndex = index;
  }

  void getShack() {
    if (_canVibrate) Vibrate.feedback(FeedbackType.light);
  }

  @override
  void onInit() async {
    super.onInit();
    // nowDate = DateTime.now();
    setTimeListDate(nowDate);
    // setDate(nowDate);
    currentTimeMap = setSelectMap(nowDate);
    currentCalendarIndex = timeList.length ~/ 14;

    print("currentTimeMap>>> ${currentTimeMap}");
    print("onInit");

    bool canVibrate = await Vibrate.canVibrate;
    _canVibrate = canVibrate;
  }

  Map setSelectMap(date) {
    var rtnMap = {
      'dateTime': date,
      'date': DateFormat('dd').format(date),
      'day': dayData[date.weekday],
      'month': monthData[date.month],
      'year': DateFormat('yyyy').format(date),
      'full_date': DateFormat('yyyy-MM-dd').format(date)
    };

    return rtnMap;
  }

  List getDayList(chooseDate) {
    List<Map> _dates = [];

    var date = chooseDate;
    var weekDay = date.weekday % 7;
    print('date.weekday time>>> ${date.weekday % 7}');
    var dayOfWeek = date.subtract(Duration(days: weekDay - 3));

    // 塞入最中間值
    var nowDateMap = {
      'dateTime': dayOfWeek.subtract(Duration(days: 0)),
      'date': DateFormat('dd').format(dayOfWeek),
      'day': dayData[dayOfWeek.weekday],
      'month': monthData[dayOfWeek.month],
      'full_date': DateFormat('yyyy-MM-dd').format(dayOfWeek)
    };

    print('mid time>>> ${nowDateMap}');
    _dates.add(nowDateMap);
    //10 + 7*10(前後10天＋往後7的倍數)
    for (int i = 1; i <= calendarWeekLen; i++) {
      var subDate = dayOfWeek.subtract(Duration(days: i));
      var addDate = dayOfWeek.add(Duration(days: i));
      _dates.add({
        'dateTime': subDate.subtract(Duration(days: 0)),
        'date': DateFormat('dd').format(subDate),
        'day': dayData[subDate.weekday],
        'month': monthData[subDate.month],
        'full_date': DateFormat('yyyy-MM-dd').format(subDate)
      });
      _dates.add({
        'dateTime': addDate.subtract(Duration(days: 0)),
        'date': DateFormat('dd').format(addDate),
        'day': dayData[addDate.weekday],
        'month': monthData[addDate.month],
        'full_date': DateFormat('yyyy-MM-dd').format(addDate)
      });
    }

    _dates.sort((a, b) => (a['dateTime']).compareTo(b['dateTime']));
    // print('_dates>>>>>${_dates}');
    return _dates;
  }
}

var dayData = {
  1: "Mon",
  2: "Tue",
  3: "Wed",
  4: "Thur",
  5: "Fri",
  6: "Sat",
  7: "Sun"
};

var monthData = {
  1: "Jan",
  2: "Feb",
  3: "Mar",
  4: "Apr",
  5: "May",
  6: "Jun",
  7: "Jul",
  8: "Aug",
  9: "Sep",
  10: "Oct",
  11: "Nov",
  12: "Dec"
};
