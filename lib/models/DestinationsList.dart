class Destination {
  String title;
  String location;
  String descriptions;
  String imageurl;

  Destination(
      {required this.title,
      required this.location,
      required this.descriptions,
      required this.imageurl});
}

List<Destination> DestinationList = [
  Destination(
      title: 'Ampupu Camp',
      location: 'Banjar ini',
      descriptions: 'Tempat camping dan emmancing paling cozy',
      imageurl:
          'https://www.dejava.net/debali/wp-content/uploads/2020/09/Ampupu-Kembar-1.jpg'),
  Destination(
      title: 'Toya Devasya',
      location: 'Banjar itu',
      descriptions:
          'Tempat pemandian air hangat sembari meinkmati pamandangan danau Batur',
      imageurl:
          'https://www.discovabali.com/wp-content/uploads/2020/11/Toya-Devasya-2-1024x614.jpg')
];
