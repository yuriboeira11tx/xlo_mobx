import 'package:brasil_fields/brasil_fields.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:xlo_mobx/components/all/error_box.dart';
import 'package:xlo_mobx/stores/signup_store.dart';

class SignupScreen extends StatelessWidget {
  final SignupStore signupStore = SignupStore();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Cadastro"),
        centerTitle: true,
      ),
      body: Container(
        alignment: Alignment.center,
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.only(bottom: 20),
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              elevation: 8.0,
              margin: EdgeInsets.symmetric(horizontal: 32),
              child: Padding(
                padding: EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(bottom: 5, top: 8),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Observer(builder: (_) {
                            return Padding(
                              padding: const EdgeInsets.symmetric(vertical: 8.0),
                              child: ErrorBox(
                                message: signupStore.error
                              ),
                            );
                          }),

                          Text(
                            "Apelido",
                            style: TextStyle(
                              color: Colors.grey[800],
                              fontSize: 16,
                              fontWeight: FontWeight.w700,
                            ),
                          ),

                          Text(
                            "Como aparecerá em seus anúncios",
                            style: TextStyle(
                              color: Colors.grey,
                              fontSize: 14,
                            ),
                          ),
                        ],
                      )
                    ),

                    Padding(
                      padding: EdgeInsets.only(bottom: 10),
                      child: Observer(
                        builder: (_) {
                          return TextField(
                            enabled: !signupStore.loading,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              isDense: true,
                              hintText: "Exemplo: Yuri J.",
                              errorText: signupStore.nameError,
                            ),
                            keyboardType: TextInputType.name,
                            onChanged: signupStore.setName,
                          );
                        },
                      ),
                    ),

                    Padding(
                        padding: EdgeInsets.only(bottom: 5, top: 8),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "E-mail",
                              style: TextStyle(
                                color: Colors.grey[800],
                                fontSize: 16,
                                fontWeight: FontWeight.w700,
                              ),
                            ),

                            Text(
                              "Enviaremos um e-mail de confirmação",
                              style: TextStyle(
                                color: Colors.grey,
                                fontSize: 14,
                              ),
                            ),
                          ],
                        )
                    ),

                    Padding(
                      padding: EdgeInsets.only(bottom: 10),
                      child: Observer(
                        builder: (_) {
                          return TextField(
                            enabled: !signupStore.loading,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              isDense: true,
                              hintText: "Exemplo: yurij@gmail.com",
                              errorText: signupStore.emailError,
                            ),
                            keyboardType: TextInputType.emailAddress,
                            onChanged: signupStore.setEmail,
                          );
                        },
                      )
                    ),

                    Padding(
                        padding: EdgeInsets.only(bottom: 5, top: 8),
                        child: Row(
                          children: [
                            Text(
                              "Celular",
                              style: TextStyle(
                                color: Colors.grey[800],
                                fontSize: 16,
                                fontWeight: FontWeight.w700,
                              ),
                            ),

                            SizedBox(width: 16),

                            Text(
                              "Proteja sua conta",
                              style: TextStyle(
                                color: Colors.grey,
                                fontSize: 14,
                              ),
                            ),
                          ],
                        )
                    ),

                    Padding(
                      padding: EdgeInsets.only(bottom: 10),
                      child: Observer(
                        builder: (_) {
                          return TextField(
                            enabled: !signupStore.loading,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              isDense: true,
                              hintText: "(54) 9999-9999",
                              errorText: signupStore.phoneError,
                            ),
                            keyboardType: TextInputType.phone,
                            inputFormatters: [
                              FilteringTextInputFormatter.digitsOnly,
                              TelefoneInputFormatter(),
                            ],
                            onChanged: signupStore.setPhone,
                          );
                        },
                      )
                    ),

                    Padding(
                        padding: EdgeInsets.only(bottom: 5, top: 8),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Senha",
                              style: TextStyle(
                                color: Colors.grey[800],
                                fontSize: 16,
                                fontWeight: FontWeight.w700,
                              ),
                            ),

                            SizedBox(width: 16),

                            Text(
                              "Use letras, números e caracteres especiais",
                              style: TextStyle(
                                color: Colors.grey,
                                fontSize: 14,
                              ),
                            ),
                          ],
                        )
                    ),

                    Padding(
                      padding: EdgeInsets.only(bottom: 10),
                      child: Observer(
                        builder: (_) {
                          return TextField(
                            enabled: !signupStore.loading,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              isDense: true,
                              errorText: signupStore.pass1Error,
                              suffixIcon: signupStore.pass1Valid ? Icon(Icons.done, color: Colors.green) : Icon(Icons.error, color: Colors.red),
                            ),
                            obscureText: true,
                            onChanged: signupStore.setPass,
                          );
                        },
                      )
                    ),

                    Padding(
                        padding: EdgeInsets.only(bottom: 5, top: 8),
                        child: Row(
                          children: [
                            Text(
                              "Confirmar Senha",
                              style: TextStyle(
                                color: Colors.grey[800],
                                fontSize: 16,
                                fontWeight: FontWeight.w700,
                              ),
                            ),

                            SizedBox(width: 16),

                            Text(
                              "Repita a senha",
                              style: TextStyle(
                                color: Colors.grey,
                                fontSize: 14,
                              ),
                            ),
                          ],
                        )
                    ),

                    Observer(
                        builder: (_) {
                          return TextField(
                            enabled: !signupStore.loading,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              isDense: true,
                              errorText: signupStore.pass2Error,
                              suffixIcon: signupStore.pass2Valid ? Icon(Icons.done, color: Colors.green) : Icon(Icons.error, color: Colors.red),
                            ),
                            obscureText: true,
                            onChanged: signupStore.setPass2,
                          );
                    }),

                    SizedBox(height: 16),

                    Observer(builder: (_) {
                      return Container(
                        margin: EdgeInsets.symmetric(vertical: 12),
                        height: 40,
                        child: RaisedButton(
                          color: Colors.orange,
                          disabledColor: Colors.orange.withAlpha(120),
                          child: signupStore.loading ? CircularProgressIndicator(
                            valueColor: AlwaysStoppedAnimation(Colors.white),
                          ) : Text("CADASTRAR"),
                          textColor: Colors.white,
                          elevation: 0.0,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16),
                          ),
                          onPressed: signupStore.signUpPressed,
                        ),
                      );
                    }),

                    Divider(color: Colors.grey),

                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 10),
                      child: Wrap(
                        alignment: WrapAlignment.center,
                        children: [
                          Text(
                            "Já possui uma conta?",
                            style: TextStyle(fontSize: 16),
                          ),

                          SizedBox(width: 6),

                          GestureDetector(
                            child: Text(
                              "Entrar",
                              style: TextStyle(
                                color: Colors.purple,
                                decoration: TextDecoration.underline,
                                fontSize: 16,
                              ),
                            ),
                            onTap: () {},
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
