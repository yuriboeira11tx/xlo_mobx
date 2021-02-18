import 'package:brasil_fields/brasil_fields.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:xlo_mobx/components/custom_drawer/custom_drawer.dart';
import 'package:xlo_mobx/screens/create/components/category_field.dart';
import 'package:xlo_mobx/screens/create/components/cep_field.dart';
import 'package:xlo_mobx/screens/create/components/images_field.dart';
import 'package:xlo_mobx/stores/create_store.dart';

class CreateScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final labelStyle = TextStyle(
      fontWeight: FontWeight.w800,
      color: Colors.grey,
      fontSize: 18,
    );
    final contentPadding = EdgeInsets.fromLTRB(16, 10, 12, 10);
    final CreateStore createStore = CreateStore();

    return Scaffold(
      appBar: AppBar(
        title: Text("Criar Anúncio"),
        centerTitle: true,
      ),
      drawer: CustomDrawer(),
      body: Card(
        margin: EdgeInsets.symmetric(horizontal: 32),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        elevation: 8,
        child: Observer(builder: (_) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisSize: MainAxisSize.min,
            children: [
              ImagesField(createStore),
              TextFormField(
                onChanged: createStore.setTitle,
                decoration: InputDecoration(
                  labelText: "Título",
                  labelStyle: labelStyle,
                  contentPadding: contentPadding,
                ),
              ),
              TextFormField(
                onChanged: createStore.setDescription,
                decoration: InputDecoration(
                  labelText: "Descrição",
                  labelStyle: labelStyle,
                  contentPadding: contentPadding,
                ),
                maxLines: null,
              ),
              CategoryField(createStore),
              CEPField(),
              TextFormField(
                onChanged: createStore.setPrice,
                decoration: InputDecoration(
                  labelText: "Preço",
                  labelStyle: labelStyle,
                  contentPadding: contentPadding,
                  prefixText: "R\$",
                ),
                keyboardType: TextInputType.number,
                inputFormatters: [
                  FilteringTextInputFormatter.digitsOnly,
                  RealInputFormatter(centavos: true),
                ],
              ),
              SizedBox(
                height: 50,
                child: RaisedButton(
                  onPressed: () {},
                  child: Text("Enviar"),
                  textColor: Colors.white,
                  color: Colors.orange,
                  disabledColor: Colors.orange.withAlpha(120),
                  materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                ),
              ),
            ],
          );
        }),
      ),
    );
  }
}
