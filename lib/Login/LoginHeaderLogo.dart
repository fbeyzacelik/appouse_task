import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class genLoginSignupHeader extends StatelessWidget {
  //String headerName;

  //genLoginSignupHeader(this.headerName);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(height: 80.0),
          Fbc(),
          SizedBox(height: 28.0),
          Text("Uygulamaya Hoşgeldiniz",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 21.0)),
          SizedBox(height:30.0,),
          Text("Uygulamamıza giriş yapmak için bilgilerinizi doldurunuz.",style: TextStyle(fontSize: 17.0),textAlign: TextAlign.center),
          SizedBox(height: 15.0,)
        ],
      ),
    );
  }

  Widget Fbc() => Container(
    padding: EdgeInsets.only(bottom: 18.0),
    child: Column(children: [
      Text(
        "FatmaBeyzaCelik",
        style: GoogleFonts.pacifico(
            fontSize: 40.0,
            color: Colors.white,
            backgroundColor: Colors.red.shade600),
        textAlign: TextAlign.left,
      ),
      SizedBox(
        height: 10,
      ),
    ]),
  );
}
