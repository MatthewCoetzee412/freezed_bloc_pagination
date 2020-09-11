import 'package:camera_demo/models/food_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class FoodSerializer {
  static Map<String, dynamic> toJson(Food food) => {'type': food.type};

  static Food fromFirestore(DocumentSnapshot dSnap) {
    Map<String, dynamic> map = dSnap.data;

    return Food(type: (map['type'] as String), document: dSnap);
  }
}
