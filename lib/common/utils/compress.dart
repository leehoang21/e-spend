import 'dart:io';
import 'package:flutter_image_compress/flutter_image_compress.dart';

class Compress {
  static Future<File> compressAndGetFile(File file, int quality) async {
    final String filePath = file.absolute.path;
    final String fileExtension = filePath.split('.').last;
    final targetPath = '${filePath.substring(
      0,
      filePath.length - fileExtension.length - 1,
    )}-compressed.$fileExtension';

    try {
      final result = await FlutterImageCompress.compressAndGetFile(
        filePath,
        targetPath,
        quality: quality,
      );
      if (result == null) return file;
      return File(
        result.path,
      );
    } catch (e) {
      return file;
    }
  }
}
