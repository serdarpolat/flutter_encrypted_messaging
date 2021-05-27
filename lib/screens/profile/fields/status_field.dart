import 'package:chat_talkr/core/components/component_index.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

Widget statusField(Size s, BuildContext context) => paddingHorizontal(
      context,
      child: Container(
        width: s.width,
        height: hh(context, 54),
        child: Row(
          children: [
            Expanded(
              child: Container(
                child: Row(
                  children: [
                    SizedBox(width: ww(context, 12)),
                    Container(
                      width: hh(context, 18),
                      height: hh(context, 18),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Clr.green,
                      ),
                    ),
                    SizedBox(width: ww(context, 12)),
                    Text(
                      "Available",
                      style: TextStyle(
                        color: Clr.text,
                        fontSize: hh(context, 14),
                        fontWeight: FontWeight.w500,
                        height: 1.21,
                      ),
                    )
                  ],
                ),
              ),
            ),
            Container(
              width: ww(context, 1),
              height: hh(context, 44),
              color: Clr.textLight,
            ),
            Container(
              width: hh(context, 54),
              height: hh(context, 54),
              child: Center(
                child: SvgPicture.asset(
                  "assets/icons/ChevronBottom.svg",
                ),
              ),
            ),
          ],
        ),
        decoration: BoxDecoration(
          color: Clr.white,
          borderRadius: BorderRadius.circular(ww(context, 8)),
          border: Border.all(
            color: Clr.textLight,
            width: hh(context, 1),
          ),
        ),
      ),
    );
