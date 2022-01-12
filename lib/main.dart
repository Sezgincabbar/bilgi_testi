import 'package:bilgitesti/constans.dart';
import 'package:bilgitesti/test_veri.dart';
import 'package:flutter/material.dart';

void main() => runApp(BilgiTesti());

class BilgiTesti extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
            backgroundColor: Colors.indigo[700],
            body: SafeArea(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 10.0),
                child: SoruSayfasi(),
              ),
            )));
  }
}

class SoruSayfasi extends StatefulWidget {
  @override
  _SoruSayfasiState createState() => _SoruSayfasiState();
}

class _SoruSayfasiState extends State<SoruSayfasi> {
  List<Widget> secimler = [];
  TestVeri test1 = TestVeri();
  void butonFonk(bool degisken) {
    if (test1.testBittiMi() == true) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Testi Bitirdiniz'),
            //content: new Text('asd'),
            actions: [
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pop();
                  setState(() {
                    secimler = [];
                    test1.testiSifirla();
                  });
                },
                child: Text('Başa Dön'),
              ),
            ],
          );
        },
      );
    } else {
      setState(() {
        test1.getSoruYaniti() == degisken
            ? secimler.add(kDogruIconu)
            : secimler.add(kYanlisIconu);
        //alt ve üst aynı şeyi ifade eder
        // if (dogruYanit == false) {
        //   secimler.add(kDogruIconu);
        // } else {
        //   secimler.add(kYanlisIconu);
        // }
        test1.sonrakiSoru();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Expanded(
          flex: 4,
          child: Padding(
            padding: EdgeInsets.all(10.0),
            child: Center(
              child: Text(
                test1.getSoruMetni(),
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 20.0,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
        Wrap(
          alignment: WrapAlignment.center,
          spacing: 5,
          runSpacing: 5,
          children: secimler,
        ),
        Expanded(
          flex: 1,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 6.0),
            child: Row(
              children: [
                Expanded(
                    child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 6),
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            primary: Colors.red, // background
                          ),
                          child: Icon(
                            Icons.thumb_down,
                            size: 30.0,
                          ),
                          onPressed: () {
                            butonFonk(false);
                          },
                        ))),
                Expanded(
                    child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 6),
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            primary: Colors.green,
                          ),
                          child: Icon(Icons.thumb_up, size: 30.0),
                          onPressed: () {
                            butonFonk(true);
                          },
                        ))),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
