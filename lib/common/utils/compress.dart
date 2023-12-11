import 'dart:io';
import 'dart:typed_data';
import 'package:flutter_image_compress/flutter_image_compress.dart';

class Compress {
  static Future<File> compressAndGetFile(File file, int quality) async {
    final String filePath = file.absolute.path;
    final Uint8List? result = await FlutterImageCompress.compressWithFile(
      filePath,
      quality: quality,
    );
    if (result != null) {
      return File.fromRawPath(result);
    } else {
      return file;
    }
  }
}
