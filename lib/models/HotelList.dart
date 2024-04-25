class Hotel {
  String title;
  String descriptions;
  String imageurl;

  Hotel(
      {required this.title,
      required this.descriptions,
      required this.imageurl});
}

List<Hotel> HotelList = [
  Hotel(
      title: 'Triangle House Batur',
      descriptions: 'Hotel',
      imageurl:
          'https://liburanyuk.co.id/wp-content/uploads/2021/06/traingle-booking-1024x682.jpg'),
  Hotel(
      title: 'Volcano Terrace Bali',
      descriptions: 'Villa',
      imageurl:
          'https://liburanyuk.co.id/wp-content/uploads/2021/06/chambers-hotes-fr-1.jpg')
];
