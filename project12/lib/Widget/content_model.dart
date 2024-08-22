// class ContentModel {
//   String image;
//   String title;
//   String discription;

//   ContentModel(
//       {required this.discription, required this.image, required this.title});
// }

// List<ContentModel> contents = [
//   ContentModel(
//       discription: "Pick your food our menu\n    More than 35 times",
//       image: "assets/screen1.png",
//       title: "Select fror Our\n    Best Menu"),
//   ContentModel(
//       discription:
//           'You can pay cash on delivery and\n Card pyment is available',
//       image: "assets/screen2.pnng",
//       title: "Easy and online Payment"),
//   ContentModel(
//       discription: 'Deliver your food at your\n     Doorstep food your at your',
//       image: "assets/screen3.pnng",
//       title: "Quick delivery at your Door"),
// ];
class ContentModel {
  String image;
  String title;
  String discription;

  ContentModel({
    required this.discription,
    required this.image,
    required this.title,
  });
}

List<ContentModel> contents = [
  ContentModel(
    discription: "Pick your food from our menu\nMore than 35 items",
    image: "assets/screen1.png",
    title: "Select from Our\nBest Menu",
  ),
  ContentModel(
    discription: "You can pay cash on delivery or use card payment",
    image: "assets/screen2.png", // Fixed image extension typo
    title: "Easy and Online Payment",
  ),
  ContentModel(
    discription: "Deliver your food right to your doorstep",
    image: "assets/screen3.png", // Fixed image extension typo
    title: "Quick Delivery to Your Door",
  ),
];
