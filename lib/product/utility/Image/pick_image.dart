import 'dart:typed_data';

import 'package:image_picker/image_picker.dart';

class PickImage {
  Future<Uint8List?> pickImageFromGallery() async {
    final picker = ImagePicker();
    // Pick an image.
    final image = await picker.pickImage(source: ImageSource.gallery);
    if (image == null) return null;
    return await image.readAsBytes();
  }
}
