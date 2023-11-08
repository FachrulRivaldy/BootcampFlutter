void main() {
  //Jawaban Soal Nomor 1 ----------------------------------------------------------------------->
  print("SOAL NOMOR 1");
  teriak();

  //Jawaban Soal Nomor 2 ----------------------------------------------------------------------->
  print("SOAL NOMOR 2");
  var num1 = 12;
  var num2 = 4;

  var hasilKali = kalikan(num1, num2);
  print(hasilKali);

  //Jawaban Soal Nomor 3 ----------------------------------------------------------------------->
  print("SOAL NOMOR 3");

  var name = "Agus";
  var age = 30;
  var address = "Jln. Malioboro, Yogyakarta";
  var hobby = "Gaming";

  var perkenalan = introduce(name, age, address, hobby);
  print(perkenalan);

  //Jawaban Soal Nomor 4 ----------------------------------------------------------------------->
  print("SOAL NOMOR 4");
  var angka = 6;
  print(factorial(angka));
}

teriak() {
  print('Halo Sanbers!');
}

kalikan(num1, num2) {
  return num1 * num2;
}

introduce(name, age, address, hobby) {
  return "Nama saya ${name}, umur saya ${age} tahun, alamat saya di ${address}, dan saya punya hobby yaitu ${hobby}!";
}

factorial(angka) {
  if (angka == 0) {
    return 1;
  } else {
    for (var i = angka - 1; i >= 1; i--) {
      angka = angka * i;
    }
    return angka;
  }
}
