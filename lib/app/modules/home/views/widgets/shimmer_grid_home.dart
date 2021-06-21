import 'package:flutter/material.dart';

import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerGridHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AnimationLimiter(
      child: GridView.builder(
        physics: BouncingScrollPhysics(), //Efeito elástico ao puxar a lista
        padding: EdgeInsets.symmetric(horizontal: 17, vertical: 12),
        addAutomaticKeepAlives: false,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, childAspectRatio: 1.35),
        itemCount: 100,
        itemBuilder: (context, index) {
          return AnimationConfiguration.staggeredGrid(
              position: index,
              columnCount: 2,
              duration: Duration(milliseconds: 375),
              child: ScaleAnimation(
                child: Shimmer.fromColors(
                  direction: ShimmerDirection.btt,
                  enabled: true,
                  child: Card(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(15))),
                  ),
                  baseColor: Colors.grey[300],
                  highlightColor: Colors.grey[100],
                ),
              ));
        },
      ),
    );
  }
}
