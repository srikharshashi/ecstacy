part of 'image_uploader_cubit.dart';

abstract class ImageUploaderState {
  bool enable;
  ImageUploaderState({
    required this.enable,
  });
}

class ImageUploaderInitial extends ImageUploaderState {
  bool enable;

  ImageUploaderInitial({required this.enable}) : super(enable: enable);
}

class ImageUploaderLoad extends ImageUploaderState {
  bool enable;
  ImageUploaderLoad({required this.enable}) : super(enable: enable);
}

class ImageUploader1done extends ImageUploaderState {
  String img1url;
  bool enable;
  ImageUploader1done({required this.img1url, required this.enable})
      : super(enable: enable);
}
