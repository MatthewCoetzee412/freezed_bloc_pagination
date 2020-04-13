
class Category{

  int _id;
  String _amount;
  String _category;

  int get id => this._id;
  String get amount => this._amount;
  String get category => this._category;

  set id(int id)=> this._id = id;
  set amount(String amount)=> this._amount = amount;
  set category(String category) => this._category = category;

  Category.fromMap(Map<String,dynamic>map){
    this._id = map['id'];
    this._amount = map['amount'];
    this._category = map['category'];
  }

  Map<String,dynamic>toJson(){
    Map<String,dynamic>map = new Map<String,dynamic>();
    map['id'] = this._id;
    map['amount'] = this._amount;
    map['category'] = this._category;
    return map;
  }

}