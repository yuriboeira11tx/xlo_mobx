import 'package:brasil_fields/brasil_fields.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:xlo_mobx/components/custom_drawer/custom_drawer.dart';
import 'package:xlo_mobx/screens/create/components/images_field.dart';

class CreateScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final labelStyle = TextStyle(fontWeight: FontWeight.w800,color: Colors.grey, fontSize: 18,);
    final contentPadding = EdgeInsets.fromLTRB(16, 10, 12, 10);

    return Scaffold(
      appBar: AppBar(
        title: Text("Criar Anúncio"),
        centerTitle: true,
      ),
      drawer: CustomDrawer(),
      body: Card(
        margin: EdgeInsets.symmetric(horizontal: 32),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        elevation: 8,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ImagesField(),

            TextFormField(
              decoration: InputDecoration(
                labelText: "Título",
                labelStyle: labelStyle,
                contentPadding: contentPadding,
              ),
            ),

            TextFormField(
              decoration: InputDecoration(
                labelText: "Descrição",
                labelStyle: labelStyle,
                contentPadding: contentPadding,
              ),
              maxLines: null,
            ),

            TextFormField(
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
            )
          ],
        ),
      ),
    );
  }
}