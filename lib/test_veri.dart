import 'package:bilgitesti/soru.dart';

class TestVeri {
  int _soruIndex = 0;
  List<Soru> _soruBankasi = [
    Soru(
        soruMetni: 'Titanik en gelmiş geçmiş en büyük gemidir ',
        soruYaniti: false),
    Soru(
        soruMetni: 'Dünyadaki tavuklar insanlardan fazladır', soruYaniti: true),
    Soru(soruMetni: 'Kelebeklerin ömrü 1 gündür', soruYaniti: false),
    Soru(soruMetni: 'Dünya yuvarlaktır', soruYaniti: false),
    Soru(soruMetni: 'Kaju bir meyvenin sapıdır', soruYaniti: true),
    Soru(
        soruMetni: 'Fatih Sultan Mehmet hiç patates yememiştir',
        soruYaniti: true)
  ];
  String getSoruMetni() {
    return _soruBankasi[_soruIndex].soruMetni;
  }

  bool getSoruYaniti() {
    return _soruBankasi[_soruIndex].soruYaniti;
  }

  void sonrakiSoru() {
    if (_soruIndex + 1 < _soruBankasi.length) {
      _soruIndex++;
    }
  }

// class RandomTestVeri extends TestVeri {
//   @override
//   int _soruIndex = 5;
//
//   @override
//   void sonrakiSoru() {
//     _soruIndex--;
//   }
// }

  bool testBittiMi() {
    if (_soruIndex + 1 >= _soruBankasi.length) {
      return true;
    } else {
      return false;
    }
  }

  void testiSifirla() {
    _soruIndex=0;
  }
}
