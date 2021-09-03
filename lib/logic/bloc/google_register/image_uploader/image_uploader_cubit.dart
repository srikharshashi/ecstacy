import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:bloc_custom_firebase/services/fb_auth_service.dart';
import 'package:bloc_custom_firebase/services/fb_storage.dart';
import 'package:equatable/equatable.dart';

part 'image_uploader_state.dart';

class ImageUploaderCubit extends Cubit<ImageUploaderState> {
  ImageUploaderCubit() : super(ImageUploaderInitial());

  void uploadimage(File? image, String username) {
    emit(ImageUploaderLoad());
    if (image != null) {
      FB_Storage().uploadFile(image, username).then((url) {
        emit(ImageUploader1done(img1url: url));
        print("Uploaded");
      });
    }
  }
}
