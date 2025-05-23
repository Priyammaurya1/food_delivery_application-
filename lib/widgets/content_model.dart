class UnboardingContent {
  String image;
  String title;
  String description;

  UnboardingContent({
    required this.description,
    required this.image,
    required this.title,
  });
}

List<UnboardingContent> contents = [
  UnboardingContent( 
    description: 'Pick Your Food From Our App\nMore than 35 times',
    image: 'images/screen1.png',
    title: 'Select from Our\n     Best Menu',
  ),
  UnboardingContent(
    description:
        'You can pay cash on delivery and\nCard payment is avalable',
    image: 'images/screen2.png',
    title: "Easy and Online Payment",
  ),
  UnboardingContent(
    description: 'Deliver your Food At your\nDoorsteps',
    image: 'images/screen3.png',
    title: 'Quick Delivery at your Doorstep',
  ),
];
