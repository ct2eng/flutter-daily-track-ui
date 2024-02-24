import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Summary extends StatelessWidget {
  const Summary({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 30, right: 0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const Spacer(
            flex: 1,
          ),
          Flexible(
            flex: 3,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Flexible(
                  flex: 10,
                  child: Text(
                    'Todal Account Value',
                    style: GoogleFonts.amaranth(
                      fontSize: 14,
                      fontWeight: FontWeight.w200,
                      fontStyle: FontStyle.normal,
                      color: Theme.of(context).primaryColorDark,
                    ),
                  ),
                ),
                Flexible(
                  flex: 4,
                  child: Row(
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
                          iconSize: 14,
                          color: Theme.of(context).primaryColor,
                        ),
                      ),
                      Flexible(
                        flex: 4,
                        child: Text(
                          'Chart',
                          style: GoogleFonts.amaranth(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            fontStyle: FontStyle.normal,
                            color: Theme.of(context).primaryColor,
                          ),
                        ),
                      ),
                      Flexible(
                        flex: 2,
                        child: IconButton(
                          padding: EdgeInsets.only(bottom: 0.0),
                          highlightColor: Colors.transparent,
                          hoverColor: Colors.transparent,
                          splashColor: Colors.transparent,
                          onPressed: () {},
                          icon: FaIcon(FontAwesomeIcons.chevronRight),
                          iconSize: 13,
                          color: Theme.of(context).primaryColor,
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
          Flexible(
            flex: 9,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Flexible(
                  flex: 10,
                  child: Text(
                    'NTD 999,999',
                    style: GoogleFonts.amaranth(
                      fontSize: 26,
                      fontWeight: FontWeight.w200,
                      fontStyle: FontStyle.normal,
                      color: Theme.of(context).primaryColorLight,
                    ),
                  ),
                ),
                Flexible(
                  flex: 10,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Flexible(
                        flex: 2,
                        child: Text(
                          'Total Gain ',
                          style: GoogleFonts.amaranth(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            fontStyle: FontStyle.normal,
                            color: Theme.of(context).primaryColorDark,
                          ),
                        ),
                      ),
                      Flexible(
                        flex: 3,
                        child: Text(
                          '+ 1450 (12%)',
                          style: GoogleFonts.amaranth(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            fontStyle: FontStyle.normal,
                            color: Theme.of(context).errorColor,
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
