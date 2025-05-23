import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class ProfileController extends GetxController {
  // صورة الملف الشخصي (متغير Observable)
  Rx<XFile?> profileImage = Rx<XFile?>(null);

  // دالة لاختيار الصورة
  Future<void> pickImage(ImageSource source) async {
    final ImagePicker picker = ImagePicker();
    final XFile? pickedImage = await picker.pickImage(source: source);

    if (pickedImage != null) {
      profileImage.value = pickedImage;
    }
  }
}
