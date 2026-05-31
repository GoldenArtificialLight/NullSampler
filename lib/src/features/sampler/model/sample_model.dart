import 'dart:typed_data';

class SampleModel {
  int? id;
  String filename;
  Uint8List? bytes; // bytes brutos do arquivo

  SampleModel({this.id, required this.filename, this.bytes});

  Map<String, dynamic> toMap() {
    return {"filename": filename, "bytes": bytes};
  }
}
