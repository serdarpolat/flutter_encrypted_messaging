import 'package:chat_talkr/core/components/component_index.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

Widget profileAppbar(BuildContext context, Size s,
        {required VoidCallback onPressed}) =>
    Container(
      width: s.width,
      height: hh(context, 100),
      color: Clr.white,
      padding: EdgeInsets.only(top: hh(context, 44), bottom: hh(context, 6)),
      child: paddingHorizontal(
        context,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            GestureDetector(
              onTap: () {
                Navigator.of(context).pop();
              },
              child: Container(
                width: ww(context, 74),
                child: Row(
                  children: [
                    Container(
                      width: ww(context, 30),
                      height: ww(context, 30),
                      padding: EdgeInsets.all(ww(context, 3)),
                      child: SvgPicture.asset(
                        "assets/icons/ArrowBack.svg",
                      ),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Clr.lightBlue,
                      ),
                    ),
                    Spacer(),
                    Text(
                      "Back",
                      style: TextStyle(
                        fontSize: hh(context, 16),
                        fontWeight: FontWeight.w700,
                        color: Clr.blue,
                        height: 1.18,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Text(
              "Profile",
              style: TextStyle(
                fontSize: hh(context, 19),
                fontWeight: FontWeight.w700,
                color: Clr.text,
                height: 1.18,
              ),
            ),
            Container(
              width: ww(context, 50),
              height: ww(context, 50),
              child: IconButton(
                icon: Icon(Icons.exit_to_app),
                onPressed: onPressed,
              ),
              margin: EdgeInsets.only(left: ww(context, 24)),
            ),
          ],
        ),
      ),
    );
