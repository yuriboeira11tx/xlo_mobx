import 'dart:ffi';

import 'package:get_it/get_it.dart';
import 'package:mobx/mobx.dart';
import 'package:xlo_mobx/models/ad.dart';
import 'package:xlo_mobx/models/address.dart';
import 'package:xlo_mobx/models/category.dart';
import 'package:xlo_mobx/stores/cep_store.dart';
import 'package:xlo_mobx/stores/user_manager_store.dart';
part 'create_store.g.dart';

class CreateStore = _CreateStoreBase with _$CreateStore;

abstract class _CreateStoreBase with Store {
  ObservableList images = ObservableList();
  CEPStore cepStore;

  @observable
  Category category;

  @action
  void setCategory(Category value) => category = value;

  @observable
  String title;

  @action
  void setTitle(String value) => title = value;

  @observable
  String description;

  @action
  void setDescription(String value) => description = value;

  @observable
  double price = 0;

  @action
  void setPrice(String value) => price = double.parse(value);

  @computed
  Address get address => cepStore.address;

  void _send() {
    final ad = Ad();
    ad.title = title;
    ad.address = address;
    ad.category = category;
    ad.images = images;
    ad.price = price;
    ad.description = description;
    ad.user = GetIt.I<UserManagerStore>().user;
    
  }
}
