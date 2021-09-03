part of 'image_uploader_cubit.dart';

abstract class ImageUploaderState {}

class ImageUploaderInitial extends ImageUploaderState {}

class ImageUploaderLoad extends ImageUploaderState {}

class ImageUploader1done extends ImageUploaderState {
  String img1url;
  ImageUploader1done({
    required this.img1url,
  });
}


