import 'package:chat_talkr/core/components/component_index.dart';
import 'package:flutter/material.dart';

class UserPhoto extends StatelessWidget {
  final String img;

  const UserPhoto({Key? key, required this.img}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      width: ww(context, 190),
      height: ww(context, 190),
      child: Stack(
        children: [
          Container(
            width: ww(context, 190),
            height: ww(context, 190),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(
                image: NetworkImage(img),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: Container(
              width: ww(context, 50),
              height: ww(context, 50),
              child: Center(
                child: Icon(
                  Icons.edit,
                  color: Clr.white,
                ),
              ),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Clr.blue,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
