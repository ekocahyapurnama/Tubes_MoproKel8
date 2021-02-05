class SliderModel {
  String imageAssetPath;
  String title;
  String desc;

  SliderModel({this.imageAssetPath, this.title, this.desc});

  void setImageAssetPath(String getImageAssetPath) {
    imageAssetPath = getImageAssetPath;
  }

  void setTitle(String getTitle) {
    title = getTitle;
  }

  void setDesc(String getDesc) {
    desc = getDesc;
  }

  String getImageAssetPath() {
    return imageAssetPath;
  }

  String getTitle() {
    return title;
  }

  String getDesc() {
    return desc;
  }
}

List<SliderModel> getSlides() {
  List<SliderModel> slides = new List<SliderModel>();
  SliderModel sliderModel = new SliderModel();

  //1
  sliderModel.setDesc("Ayo Kita Berkeliling!");
  sliderModel.setTitle("Travel");
  sliderModel.setImageAssetPath("assets/sepeda.png");
  slides.add(sliderModel);

  sliderModel = new SliderModel();

  //2
  sliderModel.setDesc("Sudah Tentukan Tujuan Anda?");
  sliderModel.setTitle("Search");
  sliderModel.setImageAssetPath("assets/cowo.png");
  slides.add(sliderModel);

  sliderModel = new SliderModel();

  //3
  sliderModel.setDesc("Bila Sudah, Ayo Kita Berkeliling Bersama!!");
  sliderModel.setTitle("Bersenang-senang");
  sliderModel.setImageAssetPath("assets/couple.png");
  slides.add(sliderModel);

  sliderModel = new SliderModel();

  return slides;
}
