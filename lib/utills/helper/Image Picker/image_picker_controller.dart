import 'package:admin_fix_my_ride/utills/Errors/Error%20handler/error_handler.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class ImagePickerController extends GetxController {
  var selectedImagePath = ''.obs;
  var selectedImagesPaths = <String>[].obs;

  Future<void> pickImage() async {
    final pickedFile = await ImagePicker()
        .pickImage(source: ImageSource.gallery, imageQuality: 70);

    if (pickedFile != null) {
      selectedImagePath.value = pickedFile.path;
    } else {
      ErrorHandler.showErrorToast('No image selected');
    }
  }

  Future<void> pickMultipleImages() async {
    final pickedFiles = await ImagePicker().pickMultiImage(imageQuality: 70);

    if (pickedFiles.isNotEmpty) {
      selectedImagesPaths.value = pickedFiles.map((file) => file.path).toList();
    } else {
      ErrorHandler.showErrorToast('No images selected');
    }
  }

  Future<void> pickImageFromCamera() async {
    final pickedFile = await ImagePicker().pickImage(
      source: ImageSource.camera,
      imageQuality: 80,
    );

    if (pickedFile != null) {
      selectedImagePath.value = pickedFile.path;
    } else {
      ErrorHandler.showErrorToast('No image captured');
    }
  }
}
