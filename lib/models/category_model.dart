
import 'package:cloud_firestore/cloud_firestore.dart';

class Category{

  int _id;
  String _amount;
  String _category;

  Category(this._id,this._amount,this._category);

  int get id => this._id;
  String get amount => this._amount;
  String get category => this._category;

  set id(int id)=> this._id = id;
  set amount(String amount)=> this._amount = amount;
  set category(String category) => this._category = category;

  factory Category.fromFirebase(DocumentSnapshot doc){
    var data = doc.data;
    return Category(
      data['id'],                   //add validation logic here
      data['amount'],
      data['category']
    );
    
  }

  Category.fromMap(Map<String,dynamic>map){
    this._id = map['id'];                          //add validation logic here
    this._amount = map['amount'];
    this._category = map['category'];
  }

  Map<String,dynamic>toJson(){
    Map<String,dynamic>map = new Map<String,dynamic>();
    map['id'] = this._id;
    map['amount'] = this._amount;                       //add validation logic here (MAYBE)
    map['category'] = this._category;
    return map;
  }

}