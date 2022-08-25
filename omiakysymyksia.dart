import 'dart:io';

main() {
  var sanasto = {};

  while (true) {
    print('Komennot:');
    print('1 - Lisää kysymys ja vastaus.');
    print('2 - Listaa kysymykset ja vastaukset.');
    print('3 - Kysele.');
    print('4 - Lopeta.');

    var komento = stdin.readLineSync();
    if (komento == '1') {
      lisaa(sanasto);
    } else if (komento == '2') {
      listaa(sanasto);
    } else if (komento == '3') {
      kysele(sanasto);
    } else if (komento == '4') {
      break;
    }
  }
}

lisaa(sanasto) {
  print('Mitä kysytään?');
  var kysymys = stdin.readLineSync();
  print('Mikä on vastaus?');
  var vastaus = stdin.readLineSync();
  sanasto[kysymys] = vastaus;
}

listaa(sanasto) {
  var avaimet = [];
  avaimet.addAll(sanasto.keys);

  for (var i = 0; i < avaimet.length; i++) {
    var kysymys = avaimet[i];
    var vastaus = sanasto[kysymys];

    print('$kysymys: $vastaus');
  }
}

kysele(sanasto) {
  var avaimet = [];
  avaimet.addAll(sanasto.keys);
  var tulos = 0;
  for (var i = 0; i < avaimet.length; i++) {
    var kysymys = avaimet[i];
    var vastaus = sanasto[kysymys];

    print('$kysymys');
    var syote = stdin.readLineSync();

    if (syote == vastaus) {
      print('Oikein!');
      tulos = tulos + 1;
    } else {
      print('Väärin!');
    }
  }
  var kaikki = sanasto.length;
  print('Oikein meni: $tulos/$kaikki');
}
