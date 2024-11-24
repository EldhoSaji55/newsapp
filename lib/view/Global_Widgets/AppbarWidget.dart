import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:newsapp/utils/constants/color_constants.dart';

class AppbarWidget extends StatelessWidget {
  AppbarWidget(
      {super.key,
      required this.title,
      this.subtitle = "",
      this.actions,
      this.leadingWidget});
  String title;
  String subtitle;
  Widget? leadingWidget;
  List<Widget>? actions = [];
  @override
  Widget build(BuildContext context) {
    return AppBar(
      toolbarHeight: 90,
      leading: leadingWidget,
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: GoogleFonts.roboto(
                textStyle:
                    TextStyle(fontSize: 26, fontWeight: FontWeight.w600)),
          ),
          SizedBox(
            height: 5,
          ),
          Text(
            maxLines: 2,
            subtitle,
            style: GoogleFonts.sourceSans3(
                color: ColorConstants.Maingrey, fontSize: 16),
          )
        ],
      ),
      actions: actions,
    );
  }
}
