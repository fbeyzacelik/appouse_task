import 'package:appouse_task/Login/LoginTextFormField.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../HomeBar.dart';

class UpdateForm extends StatefulWidget {
  @override
  _UpdateFormState createState() => _UpdateFormState();
}

class _UpdateFormState extends State<UpdateForm> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF08C198),
        title: Text("Ürün Güncelleme/Oluşturma"),
        leading: IconButton(
          onPressed: () => Navigator.of(context).push(CupertinoPageRoute(builder: (context)=> HomePage())),
          icon: Icon(Icons.arrow_back_rounded, color: Colors.white),
        ),
      ),
      body: Container(
        margin: const EdgeInsets.only(top: 10, left: 24),
        decoration: BoxDecoration(
            color: Colors.grey.shade300,
            borderRadius: BorderRadius.circular(12.0)),
        width: MediaQuery.of(context).size.width / 1.15,
        height: MediaQuery.of(context).size.height / 1.25,
        child: Column(
          children: [
            getTextFormField(hintName: 'Ürün ID'),
            getTextFormField(hintName: 'Ürün Başlığı'),
            getTextFormField(hintName: 'Ürün Açıklaması'),
            getTextFormField(
              hintName: 'Fiyat',
            ),
            getTextFormField(
              hintName: 'Kategori Seç',
            ),
            getTextFormField(hintName: 'Ürün Resmi Yükle'),
            Container(
              margin: EdgeInsets.all(30.0),
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.teal,
                borderRadius: BorderRadius.circular(30.0),
              ),
            ),
            Row(
              children: [
                SizedBox(width: 60.0),
                MaterialButton(
                    color: Colors.green,
                    onPressed: () {},
                    child: Text(
                      "Kaydet",
                      style: TextStyle(color: Colors.white),
                    )),
                SizedBox(width: 25.0),
                MaterialButton(
                    color: Colors.red,
                    onPressed: () {},
                    child: Text(
                      "Sil",
                      style: TextStyle(color: Colors.white),
                    ))
              ],
            )
          ],
        ),
      ),
    );
  }
}
