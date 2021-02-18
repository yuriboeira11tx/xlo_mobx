import 'package:xlo_mobx/models/address.dart';
import 'package:xlo_mobx/models/category.dart';
import 'package:xlo_mobx/models/user.dart';

enum AdStatus { PENDING, ACTIVE, SOLD, DELETED }

class Ad {
  List images;
  String title;
  String description;
  Category category;
  Address address;
  AdStatus status;
  num price;
  DateTime created;
  User user;
  int views;
}
