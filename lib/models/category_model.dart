
import 'package:cloud_firestore/cloud_firestore.dart';

class Category{

  String _amount;
  String _category;

  Category(this._amount,this._category);

  String get amount => this._amount;
  String get category => this._category;

  set amount(String amount)=> this._amount = amount;
  set category(String category) => this._category = category;

  factory Category.fromFirebase(DocumentSnapshot doc){
    var data = doc.data;
    return Category(
      data['amount'],
      data['category']
    );
    
  }

  Category.fromMap(Map<String,dynamic>map){
    this._amount = map['amount'];
    this._category = map['category'];
  }

  Map<String,dynamic>toJson(){
    Map<String,dynamic>map = new Map<String,dynamic>();
    map['amount'] = this._amount;                       //add validation logic here (MAYBE)
    map['category'] = this._category;
    return map;
  }

}