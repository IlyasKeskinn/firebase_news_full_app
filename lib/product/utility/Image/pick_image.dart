import 'package:image_picker/image_picker.dart';

class PickImage {
  Future<XFile?> pickImageFromGallery() async {
    final picker = ImagePicker();
    // Pick an image.
    final image = await picker.pickImage(source: ImageSource.gallery);
    if (image == null) return null;
    return image;
  }
}
