class Data{
  static List<Item> items = [];
}

class Item {
  final String url;

  Item({
    required this.url,
  });

 Item.fromJson(Map<String, dynamic> json) : url = json['url'];
 Map<String, dynamic> toJson() => {
   'url' : url
 };
 
}
