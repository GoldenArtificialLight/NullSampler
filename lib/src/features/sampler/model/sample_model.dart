import 'dart:typed_data';

class SampleModel {
  int? id;
  String filename;
  ByteData? bytes; // bytes brutos do arquivo

  SampleModel({this.id, required this.filename, this.bytes});

  void loadFile() {
    // TODO: precisa do service
  }
}
