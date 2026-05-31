import 'package:nullsampler/src/core/query_result.dart';
import 'package:nullsampler/src/features/sampler/model/grid_model.dart';
import 'package:nullsampler/src/features/sampler/model/sample_model.dart';

abstract interface class ISamplerService
{
    Future<QueryResult<int>> saveSample(SampleModel sample); // retorna o ID da sample recém-criada
    Future<QueryResult<SampleModel>> loadSample(int id);
    Future<QueryResult<List<SampleModel>>> listSamples();
    Future<QueryResult<String>> deleteSample(int id);

    Future<QueryResult<String>> saveGrid(Grid grid);
    Future<QueryResult<GridModel>> loadGrid(int id);
    Future<QueryResult<List<GridModel>>> listGrids();
    Future<QueryResult<String>> deleteGrid();
}

/**
 * Sample:
 *  id
 *  filename
 *  bytes
 * 
 * Grid:
 *  { tile: sample }
 * 
 * Tile:
 *  id
 *  posicao
 */