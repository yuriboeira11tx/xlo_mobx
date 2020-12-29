import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:xlo_mobx/components/all/error_box.dart';
import 'package:xlo_mobx/screens/signup/signup_screen.dart';
import 'package:xlo_mobx/stores/login_store.dart';

class LoginScreen extends StatelessWidget {
  final LoginStore loginStore = LoginStore();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Entrar"),
        centerTitle: true,
      ),
      body: Container(
        alignment: Alignment.center,
        child: SingleChildScrollView(
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
                  Text(
                    "Acessar com E-mail",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 16.0,
                      color: Colors.grey[900],
                    ),
                  ),

                  Observer(builder: (_) {
                    return Padding(
                      padding: EdgeInsets.symmetric(vertical: 8.0),
                      child: ErrorBox(message: loginStore.error),
                    );
                  }),

                  Padding(
                    padding: EdgeInsets.only(left: 3, bottom: 4, top: 8),
                    child: Text(
                      "E-mail",
                      style: TextStyle(
                        color: Colors.grey[800],
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),

                  Observer(builder: (_) {
                    return TextField(
                      enabled: !loginStore.loading,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        isDense: true,
                        errorText: loginStore.emailError
                      ),
                      keyboardType: TextInputType.emailAddress,
                      onChanged: loginStore.setEmail,
                    );
                  }),

                  SizedBox(height: 16,),

                  Padding(
                    padding: EdgeInsets.only(left: 3, bottom: 4, top: 8),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Senha",
                          style: TextStyle(
                            color: Colors.grey[800],
                            fontSize: 16,
                            fontWeight: FontWeight.w700,
                          ),
                        ),

                        GestureDetector(
                          child: Text(
                            "Esqueceu sua senha?",
                            style: TextStyle(
                              color: Colors.purple,
                              decoration: TextDecoration.underline,
                            ),
                          ),
                          onTap: () {

                          },
                        ),
                      ],
                    ),
                  ),

                  Observer(builder: (_) {
                    return TextField(
                      enabled: !loginStore.loading,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        isDense: true,
                        errorText: loginStore.passwordError
                      ),
                      obscureText: true,
                      onChanged: loginStore.setPassword,
                    );
                  }),

                  Observer(builder: (_) {
                    return Container(
                      margin: EdgeInsets.symmetric(vertical: 12),
                      height: 40,
                      child: RaisedButton(
                        color: Colors.orange,
                        disabledColor: Colors.orange.withAlpha(120),
                        child: loginStore.loading ? CircularProgressIndicator(valueColor: AlwaysStoppedAnimation(Colors.white)) : Text("ENTRAR"),
                        textColor: Colors.white,
                        elevation: 0.0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16),
                        ),
                        onPressed: loginStore.loginPressed,
                      ),
                    );
                  }),

                  Divider(color: Colors.grey),

                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 8),
                    child: Wrap(
                      alignment: WrapAlignment.center,
                      children: [
                        Text(
                          "Não tem uma conta?",
                          style: TextStyle(fontSize: 16),
                        ),

                        SizedBox(width: 6),

                        GestureDetector(
                          child: Text(
                            "Cadastre-se",
                            style: TextStyle(
                              color: Colors.purple,
                              decoration: TextDecoration.underline,
                              fontSize: 16,
                            ),
                          ),
                          onTap: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(builder: (_) => SignupScreen())
                            );
                          },
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
    );
  }
}
