part of 'image_uploader_cubit.dart';

abstract class ImageUploaderState {}

class ImageUploaderInitial extends ImageUploaderState {} //done

class ImageVerifiyLoad extends ImageUploaderState {}//done

class ImageVerifyMultiplefaces extends ImageUploaderState {} //done

class ImageVerifyPass extends ImageUploaderState {}//done

class ImageUploader1done extends ImageUploaderState { 
  String img1url;
  bool enable;
  ImageUploader1done({required this.img1url, required this.enable});
}
//error states

class ImageVErifyFail extends ImageUploaderState {}
