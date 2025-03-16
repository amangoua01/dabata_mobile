import 'package:dabata_mobile/models/item.dart';

class Article {
  int? id;
  int? qte;
  Item? item;

  Article({
    this.id,
    this.qte,
    this.item,
  });

  Article.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    qte = json['qte'];
    item = json['item'] != null ? Item.fromJson(json['item']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['id'] = id;
    data['qte'] = qte;
    if (item != null) {
      data['item'] = item!.toJson();
    }
    return data;
  }
}
