import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../BottomNavigationBar.dart';
import 'LoginHeaderLogo.dart';
import 'LoginTextFormField.dart';
import 'SignupForm.dart';
import 'dbHelper.dart';
import 'login_model.dart';
import 'valHelper.dart';

class LoginForm extends StatefulWidget {
  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  Future<SharedPreferences> _pref = SharedPreferences.getInstance();

  //final _formKey = new GlobalKey<FormState>();
  final _conEmail = TextEditingController();
  final _conPassword = TextEditingController();
  var dbHelper;

  @override
  void initState() {
    super.initState();
    dbHelper = DbHelper();
  }

  login() async {
    String email = _conEmail.text;
    String passwd = _conPassword.text;

    if (email.isEmpty) {
      alertDialog(context, "Lütfen mail giriniz.");
    } else if (passwd.isEmpty) {
      alertDialog(context, "Lütfen parolayı giriniz.");
    } else {
      await dbHelper.getLoginUser(email, passwd).then((userData) {
        if (userData != null) {
          setSP(userData).whenComplete(() {
            Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (_) => MyHomePage()),
                (Route<dynamic> route) => false);
          });
        } else {
          alertDialog(context, "Hata: Kullanıcı Bulunamadı");
        }
      }).catchError((error) {
        print(error);
        alertDialog(context, "Hata: Giriş Başarısız");
      });
    }
  }

  Future setSP(UserModel user) async {
    final SharedPreferences sp = await _pref;

    sp.setString("user_id", user.user_id);
    sp.setString("user_name", user.user_name);
    sp.setString("email", user.email);
    sp.setString("password", user.password);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Container(
          padding: EdgeInsets.only(top: 120.0),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                genLoginSignupHeader(), //""
                getTextFormField(
                    controller: _conEmail,
                    icon: Icons.person,
                    hintName: 'E-mail'),
                SizedBox(height: 10.0),
                getTextFormField(
                  controller: _conPassword,
                  icon: Icons.lock,
                  hintName: 'Şifre',
                  isObscureText: true,
                ),
                Container(
                  margin: EdgeInsets.all(30.0),
                  width: double.infinity,
                  child: MaterialButton(
                    child: Text(
                      'Giriş Yap',
                      style: TextStyle(color: Colors.white),
                    ),
                    onPressed: login,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.teal.shade400,
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
                Warning(),
                Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Hesabınız yok mu ?'),
                      MaterialButton(
                        textColor: Colors.red,
                        child: Text('Üye Ol'),
                        onPressed: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (_) => SignupForm()));
                        },
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget Warning() => Row(children: [
        Icon(Icons.info_outline_rounded, color: Colors.teal),
        Text(
          "Sorun yaşıyor iseniz IT birimi ile görüşünüz.",
          style: TextStyle(color: Colors.grey.shade400),
        )
      ]);
}
