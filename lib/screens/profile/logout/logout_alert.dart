import 'dart:ui';

import 'package:chat_talkr/core/components/component_index.dart';
import 'package:chat_talkr/screens/profile/logout/alert_buttons.dart';
import 'package:flutter/material.dart';

class LogoutAlert extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size s = MediaQuery.of(context).size;
    final double alertWidth = s.width * 0.85;
    final double alertHeight = s.width * 0.85 * 3 / 4;
    return ClipRRect(
      child: BackdropFilter(
        filter: ImageFilter.blur(
          sigmaX: 15,
          sigmaY: 15,
        ),
        child: Container(
          width: s.width,
          height: s.height,
          color: Clr.grayBg.withOpacity(0.5),
          child: Align(
            alignment: Alignment.center,
            child: Container(
              width: alertWidth,
              height: alertHeight,
              padding: EdgeInsets.all(ww(context, 16)),
              child: Column(
                children: [
                  Expanded(
                    child: Container(
                      child: Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Are you trying to get out?",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Clr.text,
                                fontWeight: FontWeight.w700,
                                fontSize: hh(context, 18),
                                height: 2,
                              ),
                            ),
                            Text(
                              "🤨",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Clr.text,
                                fontWeight: FontWeight.w700,
                                fontSize: hh(context, 36),
                                height: 2,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  AlertButtons(
                    alertWidth: alertWidth,
                    alertHeight: alertHeight,
                  ),
                ],
              ),
              decoration: BoxDecoration(
                color: Clr.white,
                borderRadius: BorderRadius.circular(ww(context, 12)),
                boxShadow: [
                  BoxShadow(
                    color: Clr.textLight.withOpacity(0.5),
                    offset: Offset(0, hh(context, 12)),
                    blurRadius: hh(context, 24),
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
