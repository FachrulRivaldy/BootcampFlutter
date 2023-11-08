void main() {
  //Jawaban Soal Nomor 1 ----------------------------------------------------------------------->
  print("SOAL NOMOR 1");

  int i = 0;
  int j = 20;

  print("LOOPING PERTAMA");
  while (i < 20) {
    i += 2;
    print('${i} - I love coding');
  }

  print("LOOPING KEDUA");
  while (j > 0) {
    print('${j} - I will become a mobile developer');
    j -= 2;
  }

  //Jawaban Soal Nomor 2 ----------------------------------------------------------------------->
  print("SOAL NOMOR 2");

  for (var angka = 1; angka <= 20; angka++) {
    if (angka % 2 == 0) {
      print("${angka} - Berkualitas");
    } else if (angka % 2 != 0 && angka % 3 == 0) {
      print("${angka} - I Love Coding");
    } else {
      print("${angka} - Santai");
    }
  }

  //Jawaban Soal Nomor 3 ----------------------------------------------------------------------->
  print("SOAL NOMOR 3");

  for (var i = 1; i <= 4; i++) {
    print("#" * 8);
  }

  //Jawaban Soal Nomor 4 ----------------------------------------------------------------------->
  print("SOAL NOMOR 4");

  for (var i = 1; i <= 7; i++) {
    print("#" * i);
  }
}
