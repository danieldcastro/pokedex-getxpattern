import 'package:flutter/material.dart';

import '../../../../global/widgets/global_padding.dart';

class AppBarHome extends StatelessWidget {
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
                    onPressed: () {},
                    icon: Icon(
                      Icons.menu_rounded,
                      size: 28,
                      color: Colors.transparent,
                    ),
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
