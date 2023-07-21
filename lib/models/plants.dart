import 'package:plant_shop_ui/models/plant_model.dart';
import 'package:plant_shop_ui/utilities/path.dart';

final List<PlantModel> plants = [
  PlantModel(
      name: "Aloe Vera",
      type: "Outdoor",
      price: 25,
      size: "Small",
      description:
          "Aloe Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.",
      image: AppImage.image0,
      detail: "Plan height: 35-45cm\nNursery pot width: 12cm"),
  PlantModel(
      name: "Cool Plant",
      type: "Indoor",
      price: 25,
      size: "Medium",
      description:
          "Plant Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.",
      image: AppImage.image1,
      detail: "Plan height: 35-45cm\nNursery pot width: 12cm"),
  PlantModel(
      name: "Really Cool Plant",
      type: "New Arrival",
      price: 25,
      size: "Small",
      description:
          "Cool plants Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.",
      image: AppImage.image2,
      detail: "Plan height: 35-45cm\nNursery pot width: 12cm"),
];
