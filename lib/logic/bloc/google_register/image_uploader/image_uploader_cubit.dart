import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:bloc_custom_firebase/services/fb_storage.dart';
import 'package:google_ml_kit/google_ml_kit.dart';
part 'image_uploader_state.dart';

class ImageUploaderCubit extends Cubit<ImageUploaderState> {
  ImageUploaderCubit() : super(ImageUploaderInitial());

  final faceDetector = GoogleMlKit.vision.faceDetector();
  void uploadimage(File? image, String username) async {
    if (image != null) {
      emit(ImageVerifiyLoad());
      int n = await doml(image);
      if (n == 1) {
        emit(ImageVerifyPass());
        FB_Storage().uploadFile(image, username).then((url) {
          emit(ImageUploader1done(img1url: url, enable: true));
          print("Uploaded");
        });
      } else if (n > 1) {
        emit(ImageVerifyMultiplefaces());
      } else if (n == 0) {
        emit(ImageVErifyFail());
      }
    }
  }

  @override
  void dispose() {
    faceDetector.close();
  }

  Future<int> doml(File file) async {
    final inputImage = InputImage.fromFile(file);
    final List<Face> faces = await faceDetector.processImage(inputImage);
    return faces.length;
  }

  void reset() {
    emit(ImageUploaderInitial());
  }
}
