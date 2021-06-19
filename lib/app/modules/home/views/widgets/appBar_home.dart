import 'package:flutter/material.dart';

import '../../../../global/widgets/global_padding.dart';

class AppBarHome extends StatelessWidget {
  final Function menuTap;

  const AppBarHome({Key key, @required this.menuTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(top: 13, right: 5),
                  child: IconButton(
                    icon: Icon(
                      Icons.menu_rounded,
                      size: 28,
                    ),
                    onPressed: menuTap,
                  ),
                )
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              GlobalPadding(
                child: Text(
                  'Pokédex',
                  style: TextStyle(
                      color: Color.fromARGB(255, 48, 57, 67),
                      fontFamily: 'Google',
                      fontWeight: FontWeight.w900,
                      letterSpacing: 1,
                      fontSize: 32),
                ),
              ),
            ],
          ),
          SizedBox()
        ],
      ),
      height: 140,
    );
  }
}
