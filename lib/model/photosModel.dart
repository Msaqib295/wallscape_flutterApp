class PhotosModel {
  String imgSrc;
  String photographerName;


  PhotosModel({required this.imgSrc, required this.photographerName});

  static PhotosModel FromAPI2App(Map<String , dynamic> photoMap) {
    return PhotosModel(
        imgSrc: (photoMap["src"])["portrait"],
        photographerName: photoMap["photographer"]
    );
  }
}