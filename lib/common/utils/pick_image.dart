import 'dart:io';
import 'package:flutter_e_spend/common/utils/app_utils.dart';
import 'package:flutter_e_spend/common/utils/compress.dart';
import 'package:image_picker/image_picker.dart';

class PickImage {
  final ImagePicker _imagePicker = ImagePicker();

  Future<File?> pickImage({required ImageSource source}) async {
    try {
      XFile? pickedFile = await _imagePicker.pickImage(
        source: source,
      );

      return Compress.compressAndGetFile(
        File(pickedFile!.path),
        90,
      );
    } catch (e) {
      logger("pick image file$e");
    }
    return null;
  }

  Future<List<File>> multiImage() async {
    try {
      final List<XFile> files = await _imagePicker.pickMultiImage();
      final List<File> images = [];
      for (final file in files) {
        final image = await Compress.compressAndGetFile(File(file.path), 900);
        images.add(image);
      }
      return images;
    } catch (e) {
      logger("pick image file$e");
      return [];
    }
  }
}
