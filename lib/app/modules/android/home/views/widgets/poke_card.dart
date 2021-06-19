import 'package:flutter/material.dart';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:cached_network_image/cached_network_image.dart';

import '../../../../../global/consts/consts_app.dart';

class PokeCard extends StatelessWidget {
  final String name;
  final int index;
  final String id;
  final Color color;
  final String image;
  final List type;

  const PokeCard(
      {Key key,
      @required this.name,
      this.index,
      this.color,
      @required this.image,
      @required this.id,
      @required this.type})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, cons) {
      return Card(
          clipBehavior: Clip.antiAliasWithSaveLayer,
          color: color ?? Colors.green,
          elevation: 0,
          margin: EdgeInsets.all(8),
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(15))),
          child: Stack(
            clipBehavior: Clip.none,
            children: [
              Positioned(
                bottom: -15,
                right: -15,
                child: Opacity(
                  opacity: 0.3,
                  child: Image.asset(
                    ConstsApp.blackPoke,
                    color: Colors.white,
                    height: 95,
                    width: 95,
                  ),
                ),
              ),
              Positioned(
                bottom: 5,
                right: 5,
                child: CachedNetworkImage(
                  placeholder: (context, url) => new Container(
                    color: Colors.transparent,
                  ),
                  imageUrl: image,
                  height: 80,
                ),
              ),
              Padding(
                padding: EdgeInsets.all(8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          width: cons.maxWidth * .55,
                          child: AutoSizeText(
                            name,
                            maxLines: 2,
                            wrapWords: false,
                            maxFontSize: 22,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        SizedBox(
                          width: cons.maxWidth * .25,
                          child: Opacity(
                              opacity: 0.2,
                              child: Text('#$id',
                                  textDirection: TextDirection.rtl,
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.w900,
                                  ))),
                        )
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: chipTypes(),
                    )
                  ],
                ),
              )
            ],
          ));
    });
  }

  List<Widget> chipTypes() {
    List<Widget> chips = [];
    for (int i = 0; i < type.length; i++) {
      chips.add(
        Container(
          margin: EdgeInsets.only(top: 7),
          padding: EdgeInsets.symmetric(horizontal: 5, vertical: 1),
          child: Text(
            type[i],
            style: TextStyle(color: Colors.white, fontSize: 16),
          ),
          decoration: BoxDecoration(
              color: Color.fromARGB(100, 255, 255, 255),
              borderRadius: BorderRadius.circular(50)),
        ),
      );
    }
    return chips;
  }
}
