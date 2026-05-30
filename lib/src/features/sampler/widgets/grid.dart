import 'package:flutter/material.dart';
import 'package:nullsampler/src/features/sampler/widgets/tile.dart';

class Grid extends StatelessWidget {
  const Grid({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Tile(),
            Tile(),
            Tile(),
          ],
        ),
        Row(
          children: [
            Tile(),
            Tile(),
            Tile(),
          ],
        ),
        Row(
          children: [
            Tile(),
            Tile(),
            Tile(),
          ],
        ),
      ],
    );
  }
}
