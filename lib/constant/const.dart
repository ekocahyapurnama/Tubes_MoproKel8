class Item {
  final String title;
  final String imgUrl;
  final String desc;
  final String author;
  final String id;

  Item({this.title, this.imgUrl, this.desc, this.author, this.id});

  factory Item.fromJson(Map<String, dynamic> json) {
    return Item(
        title: json['title'],
        imgUrl: json['imgUrl'],
        desc: json['desc'],
        author: json['author'],
        id: json['id']);
  }

  Map<String, dynamic> toJson() => {
        'title': title,
        'imgUrl': imgUrl,
        'desc': desc,
        'author': author,
        'id': id
      };
}

class Items {
  final String title;
  final String imgUrl;
  final String desc;
  final String author;
  final String id;

  Items({this.title, this.imgUrl, this.desc, this.author, this.id});

  factory Items.fromJson(Map<String, dynamic> json) {
    return Items(
        title: json['title'],
        imgUrl: json['imgUrl'],
        desc: json['desc'],
        author: json['author'],
        id: json['id']);
  }

  Map<String, dynamic> toJson() => {
        'title': title,
        'imgUrl': imgUrl,
        'desc': desc,
        'author': author,
        'id': id
      };
}
