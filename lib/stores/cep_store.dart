import 'package:mobx/mobx.dart';
import 'package:xlo_mobx/models/address.dart';
import 'package:xlo_mobx/repositories/cep_repository.dart';
part 'cep_store.g.dart';

class CEPStore = _CEPStoreBase with _$CEPStore;

abstract class _CEPStoreBase with Store {
  _CEPStoreBase() {
	autorun((_) {
	  if (clearCep.length != 8) {
		_reset();
	  } else {
		_searchCep();
	  }
	});
  }

  @observable
  String cep = '';

  @action
  void setCep(String value) => cep = value;

  @computed
  String get clearCep => cep.replaceAll(RegExp('[^0-9]'), '');


  @observable
  Address address;

  @observable
  String error;

  @observable
  bool loading = false;

  @action
  void _reset() {
	address = null;
	error = null;
  }

  @action
  Future<void> _searchCep() async {
	loading = true;

	try {
	  address = await CepRepository().getAddressFromApi(clearCep);
	  error = null;
	} catch (e) {
	  error = e;
	  address = null;
	}

	loading = false;
  }
}
