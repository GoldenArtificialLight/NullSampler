import 'dart:typed_data';

import 'package:nullsampler/src/app/database/db_native.dart';
import 'package:nullsampler/src/core/query_result.dart';
import 'package:nullsampler/src/features/sampler/data/service/i_sampler_service.dart';
import 'package:nullsampler/src/features/sampler/model/grid_model.dart';
import 'package:nullsampler/src/features/sampler/model/sample_model.dart';

class SqliteSamplerService implements ISamplerService
{
  @override
  Future<QueryResult<int>> saveSample(SampleModel sample) async {
    final db = await getDatabase();
    try {
        int id = await db.insert(
            "Sample",
            sample.toMap()
        );

        return QueryResult(wasSuccesful: true, content: id);
    } catch(e) {
        return QueryResult(wasSuccesful: false, message: e.toString());
    } finally {
        db.close();
    }
  }

  @override
  Future<QueryResult<SampleModel>> loadSample(int id) async {
    final db = await getDatabase();
    try{
      var result = await db.query(
        "Sample",
        where: "idSample = ?",
        whereArgs: [id]
      );

      if(result.isEmpty)
      {
        return QueryResult(
          wasSuccesful: true,
          content: null,
          message: "Sample não encontrada"
        );
      }
      var sample = result.first;

      int idSample = int.parse(sample["id"].toString());
      String filename = sample["filename"].toString();

      // não sei se é a única forma de fazer isso, mas eu vejo depois
      String bytesString = sample["bytes"].toString();
      List<String> bytesStringList = [];
      for(int i=0; i<bytesString.length; i++)
      { bytesStringList.add(bytesString[i]); }
      List<int> bytesIntList = bytesStringList.cast<int>();

      return QueryResult(
        wasSuccesful: true,
        content: SampleModel(
          id: idSample,
          filename: filename,
          bytes: Uint8List.fromList(bytesIntList) // aquela bizarrice ali em cima é pra fazer isso
        )
      );
    } catch(e) {
      return QueryResult(
        wasSuccesful: false,
        message: e.toString()
      );
    } finally {
      db.close();
    }
  }

  @override
  Future<QueryResult<List<SampleModel>>> listSamples() async {
    final db = await getDatabase();
    try{
      var results = await db.query(
        "Sample",
        columns: ["idSample", "filename"] // melhor não carregar os bytes aqui
      );

      if(results.isEmpty)
      {
        return QueryResult(
          wasSuccesful: true,
          content: null,
          message: "Não há nenhuma sample"
        );
      }

      List<SampleModel> samples = [];
      
      for(var sample in results)
      {
        samples.add(
          SampleModel(
            id: int.parse(sample["id"].toString()),
            filename: sample["filename"].toString()
          )
        );
      }

      return QueryResult(
        wasSuccesful: true,
        content: samples
      );
    } catch(e) {
      return QueryResult(
        wasSuccesful: false,
        message: e.toString()
      );
    } finally {
      db.close();
    }
  }

  @override
  Future<QueryResult<String>> deleteSample(int id) async {
    final db = await getDatabase();
    try{
      var result = await db.delete(
        "Sample",
        where: "idSample = ?",
        whereArgs: [id]
      );
      
      if(result == 0)
      {
        return QueryResult(
          wasSuccesful: true,
          message: "Sample não encontrada"
        );
      }

      return QueryResult(
        wasSuccesful: true,
        message: "Sample excluída"
      );
    } catch(e) {
      return QueryResult(
        wasSuccesful: false,
        message: e.toString()
      );
    } finally {
      db.close();
    }
  }

  @override
  Future<QueryResult<String>> saveGrid(Grid grid) async {
    // TODO: implement saveGrid
    throw UnimplementedError();
  }

  @override
  Future<QueryResult<GridModel>> loadGrid(int id) async {
    // TODO: implement loadGrid
    throw UnimplementedError();
  }

  @override
  Future<QueryResult<List<GridModel>>> listGrids() async {
    // TODO: implement listGrids
    throw UnimplementedError();
  }

  @override
  Future<QueryResult<String>> deleteGrid() async {
    // TODO: implement deleteGrid
    throw UnimplementedError();
  }
}