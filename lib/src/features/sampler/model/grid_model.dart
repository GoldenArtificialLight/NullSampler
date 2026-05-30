import 'package:nullsampler/src/features/sampler/model/sample_model.dart';
import 'package:nullsampler/src/core/enums.dart';

typedef Grid = Map<TilePosition, SampleModel?>;

class GridModel {
  Grid grid;

  GridModel({required this.grid});

  factory GridModel.fromMap(Map<String, dynamic> map) {
    Grid newGrid = {};
    for (var k in map.entries) {
      String value = k.value.toString();
      newGrid[TilePosition.values[int.parse(k.key)]] = SampleModel(
        filename: value,
      );
    }

    return GridModel(grid: newGrid);
  }

  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = {};
    for (var t in grid.entries) {
      map[t.key.toString()] = t.value?.id;
    }

    return map;
  }
}
