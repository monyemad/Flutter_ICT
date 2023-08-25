class Smart {
  String title;
  String thumbnail;
  int price;

  Smart({
    required this.title,
    required this.thumbnail,
    required this.price,
  });

  factory Smart.fromJson(Map<String, dynamic> json) {
    return Smart(
      title: json['title'],
      thumbnail: json['thumbnail'],
      price: json['price'],
    );
  }
}