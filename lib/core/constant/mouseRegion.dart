import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../resource/assets_manager.dart';
class Mouse extends StatefulWidget {
  Widget widget;
   Mouse({required this.widget}) ;

  @override
  State<Mouse> createState() => _MouseState();
}

class _MouseState extends State<Mouse> {
  Offset pointer = Offset(300, 300);
  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.none,
      onHover: (eve) {
        setState(() {
          pointer = eve.position;
        });
        if (kDebugMode) {
        }
        if (kDebugMode) {

        }
      },
      child: AnimatedContainer(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        duration: Duration(milliseconds: 100),
        child: Stack(
          children: [
            widget.widget,
            AnimatedPositioned(
              // Custom dot in Cursor
                duration: const Duration(milliseconds: 100),
                left: pointer.dx,
                top: pointer.dy +10,
                child: Container(
                  width: 50,
                  color: Colors.transparent,
                  child: Image.asset(ImageAssets.cursor),
                )),
          ],
        ),
      ),
    );
  }
}


// MouseRegion buildMouseRegion(BuildContext context, Widget widget) {
//
//
//   return
// }
