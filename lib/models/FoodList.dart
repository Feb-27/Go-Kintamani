class Food {
  String title;
  String descriptions;
  String imageurl;

  Food(
      {required this.title,
      required this.descriptions,
      required this.imageurl});
}

List<Food> FoodList = [
  Food(
      title: 'Mujair Nyat-Nyat',
      descriptions: 'Mujair enak khas kintamani',
      imageurl:
          'https://1.bp.blogspot.com/-UQLOZjTaH80/XDZRg1g-mVI/AAAAAAABe4w/hMoIQ_FZ_oEtaKcuZDfDhIHxVnw24YgigCLcBGAs/s640/PLATARAN%2BCANGGU7.jpg'),
  Food(
      title: 'Sate Lilit',
      descriptions: 'Sate Lilit khas kintamani',
      imageurl:
          'https://4.bp.blogspot.com/-oX01LM6ybEw/Vs1hXHkqKTI/AAAAAAAAAUA/PdyfdW_O_nk/s1600/sate-lilit-ayam-khas-bali.jpg')
];
