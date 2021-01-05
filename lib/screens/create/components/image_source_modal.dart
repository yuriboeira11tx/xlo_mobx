import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';

class ImageSourceModal extends StatelessWidget {
  ImageSourceModal(this.onImageSelected);

  final Function(File) onImageSelected;

  @override
  Widget build(BuildContext context) {
    if (Platform.isAndroid) {
      return BottomSheet(
        onClosing: () {},
        builder: (_) => Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            FlatButton(
              child: Text("Câmera"),
              onPressed: getFromCamera,
            ),

            FlatButton(
              child: Text("Galeria"),
              onPressed: getFromGallery,
            ),
          ],
        ),
      );
    } else {
      return CupertinoActionSheet(
        title: Text("Selecionar imagem para anúncio"),
        cancelButton: CupertinoActionSheetAction(
          child: Text(
            "Cancelar",
            style: TextStyle(color: Colors.red),
          ),
          onPressed: Navigator.of(context).pop,
        ),
        actions: [
          CupertinoActionSheetAction(
            child: Text("Câmera"),
            onPressed: () {},
          ),

          CupertinoActionSheetAction(
            child: Text("Galeria"),
            onPressed: () {},
          ),
        ],
      );
    }
  }

  Future<void> getFromCamera() async {
    final pickedFiled = await ImagePicker().getImage(source: ImageSource.camera);

    if (pickedFiled == null) return;

    imageSelected(File(pickedFiled.path));
  }

  Future<void> getFromGallery() async {
    final pickedFiled = await ImagePicker().getImage(source: ImageSource.gallery);
    
    if (pickedFiled == null) return;
    
    imageSelected(File(pickedFiled.path));
  }

  Future<void> imageSelected(File image) async {
    final croppedFile = await ImageCropper.cropImage(
      sourcePath: image.path,
      aspectRatio: CropAspectRatio(ratioX: 1, ratioY: 1),
      androidUiSettings: AndroidUiSettings(
        toolbarTitle: "Editar Imagem",
        toolbarColor: Colors.purple,
        toolbarWidgetColor: Colors.white,
      ),
      iosUiSettings: IOSUiSettings(
        title: "Editar Imagem",
        cancelButtonTitle: "Cancelar",
        doneButtonTitle: "Concluir",
      ),
    );

    if (croppedFile != null) onImageSelected(croppedFile);
  }
}
