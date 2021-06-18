import 'package:flutter/material.dart';

import '../../../../../data/model/poke_api.dart';

class GridPokeHome extends StatelessWidget {
  final List<PokeApi> state;

  const GridPokeHome({Key key, @required this.state}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: state.length,
      itemBuilder: (context, index) {
        final PokeApi poke = state[index];
        return ListTile(
          title: Text(poke.name),
          subtitle: Text(poke.candy),
        );
      },
    );
  }
}
