import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter_sticky_header/flutter_sticky_header.dart';
import 'package:stock_track/pages/home/controller/controller_detail.dart';

class Detail extends StatelessWidget {
  var detailHeaderList = [
    _StickyHeaderList(index: 1, header: 'Holdings'),
    _StickyHeaderList(index: 2, header: 'Buy'),
    _StickyHeaderList(index: 3, header: 'Sell')
  ];

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(35.0), topRight: Radius.circular(35.0)),
      child: DefaultStickyHeaderController(
        child: Scaffold(
          resizeToAvoidBottomInset: false,
          extendBody: true,
          backgroundColor: Theme.of(context).primaryColorLight,
          body: CustomScrollView(slivers: detailHeaderList),
        ),
      ),
    );
  }
}

// 列表header
class _StickyHeaderList extends StatelessWidget {
  _StickyHeaderList({
    Key? key,
    this.index,
    this.header,
  }) : super(key: key);

  final int? index;
  final String? header;

  @override
  Widget build(BuildContext context) {
    return SliverStickyHeader(
      header: ClipRect(
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 1.0, sigmaY: 1.0),
          child: Container(
            color: Color.fromRGBO(129, 129, 129, 0),
            height: 60,
            padding: EdgeInsets.only(left: 30, top: 15, right: 30),
            alignment: Alignment.centerLeft,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Flexible(
                  flex: 5,
                  child: Text(
                    '$header',
                    style: GoogleFonts.amaranth(
                      fontSize: 26,
                      fontWeight: FontWeight.w200,
                      fontStyle: FontStyle.normal,
                      color: Theme.of(context).scaffoldBackgroundColor,
                    ),
                  ),
                ),
                Flexible(
                  child: IconButton(
                    padding: EdgeInsets.only(bottom: 0.0),
                    highlightColor: Colors.transparent,
                    hoverColor: Colors.transparent,
                    splashColor: Colors.transparent,
                    onPressed: () {},
                    icon: FaIcon(FontAwesomeIcons.chevronDown),
                    iconSize: 16,
                    color: Theme.of(context).scaffoldBackgroundColor,
                  ),
                )
              ],
            ),
            // child: Text(
            //   '$header',
            //   style: const TextStyle(color: Colors.white),
            // ),
          ),
        ),
      ),
      sliver: SliverToBoxAdapter(
        child: _DetailTable(),
      ),
    );
  }
}

class _DetailTable extends StatelessWidget {
  var detailCtrl = Get.put(DetailLogic());

  @override
  Widget build(BuildContext context) {
    return MediaQuery.removePadding(
      removeTop: true,
      removeBottom: true,
      context: context,
      child: Card(
        color: Colors.white,
        shape: RoundedRectangleBorder(
          // side: BorderSide(color: Colors.white70, width: 1),
          borderRadius: BorderRadius.circular(15),
        ),
        elevation: 6,
        margin: EdgeInsets.only(left: 20, top: 10, right: 20),
        child: Container(
          height: (45.0 + 1) * detailCtrl.detailList.length + (45.0 + 5.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                height: 45,
                margin: const EdgeInsets.only(bottom: 5),
                // color: Colors.transparent,
                child: Container(
                  child: ListTile(
                    title: Row(
                      // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          flex: 1,
                          child: Text(
                            'Symbol',
                            textAlign: TextAlign.left,
                            style: GoogleFonts.amaranth(
                                color:
                                    Theme.of(context).scaffoldBackgroundColor,
                                fontWeight: FontWeight.w600,
                                fontSize: 15),
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: Text(
                            'Shares',
                            textAlign: TextAlign.center,
                            style: GoogleFonts.amaranth(
                                color:
                                    Theme.of(context).scaffoldBackgroundColor,
                                fontWeight: FontWeight.w600,
                                fontSize: 15),
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: Text(
                            'Avg Cost',
                            textAlign: TextAlign.right,
                            style: GoogleFonts.amaranth(
                                color:
                                    Theme.of(context).scaffoldBackgroundColor,
                                fontWeight: FontWeight.w600,
                                fontSize: 15),
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: Text(
                            'Price',
                            textAlign: TextAlign.right,
                            style: GoogleFonts.amaranth(
                                color:
                                    Theme.of(context).scaffoldBackgroundColor,
                                fontWeight: FontWeight.w600,
                                fontSize: 15),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: ListView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  primary: false,
                  itemCount: detailCtrl.detailList.length,
                  itemBuilder: (_, index) {
                    return _listItem(index, context);
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Item of the ListView
  Widget _listItem(index, BuildContext context) {
    Map detail = detailCtrl.detailList[index];
    return Column(
      children: [
        Divider(
          height: 1,
          thickness: 0.8,
          indent: 15,
          endIndent: 15,
          color: Theme.of(context).primaryColorLight,
        ),
        Container(
          // decoration: BoxDecoration(
          //   border: Border(
          //     top: BorderSide(
          //         width: 0.5, color: Theme.of(context).primaryColorLight),
          //   ),
          // ),
          // padding: const EdgeInsets.all(10),
          height: 45,
          child: ListTile(
            onTap: () {
              // if (_canVibrate) Vibrate.feedback(FeedbackType.light);
            },
            title: Row(
              // mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  flex: 1,
                  child: Column(
                    // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          detail['comp_nm'],
                          textAlign: TextAlign.left,
                          style: GoogleFonts.amaranth(
                              color: Theme.of(context).primaryColorDark,
                              fontSize: 14),
                        ),
                      ),
                      Container(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          '(' + detail['symbol'] + ')',
                          textAlign: TextAlign.left,
                          style: GoogleFonts.amaranth(
                              color: Theme.of(context).primaryColorDark,
                              fontSize: 12),
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                          alignment: Alignment.center,
                          child: Text(
                            detail['shares'],
                            style: GoogleFonts.amaranth(
                                color: Theme.of(context).primaryColorDark,
                                fontSize: 14),
                          )),
                    ],
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                          alignment: Alignment.center,
                          child: Text(
                            detail['shares'],
                            style: GoogleFonts.amaranth(
                                color: Theme.of(context).primaryColorDark,
                                fontSize: 14),
                          )),
                    ],
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        alignment: Alignment.centerRight,
                        child: Text(
                          '123',
                          style: GoogleFonts.amaranth(
                              color: Theme.of(context).primaryColorDark,
                              fontSize: 14),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
