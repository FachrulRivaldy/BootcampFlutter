import 'dart:io';

void main() {
  //Jawaban Soal Nomor 1 ----------------------------------------------------------------------->
  print("SOAL NOMOR 1");
  print("Masukan Input Y/T :");
  String? Input = stdin.readLineSync()!;
  Input == "Y"
      ? print("Anda akan menginstall aplikasi dart")
      : print("Aborted");

  //Jawaban Soal Nomor 2 ----------------------------------------------------------------------->
  print("SOAL NOMOR 2");

  var nama;
  var peran;

  while (nama == null || nama.isEmpty) {
    print("Masukan Nama Anda :");
    nama = stdin.readLineSync()!;
    if (nama.isEmpty) {
      print("Nama Harus Diisi!");
    }
  }

  print(
      "Halo ${nama}, Pilih Peranmu untuk memulai game! Penyihir / Guard / Werewolf");
  peran = stdin.readLineSync()!;

  while (peran != "Penyihir" && peran != "Guard" && peran != "Werewolf") {
    print(
        "Halo ${nama}, Pilih peranmu untuk memulai game! Penyihir / Guard / Werewolf.");
    peran = stdin.readLineSync()!;
  }

  print("Selamat datang di Dunia Werewolf, ${nama}");

  if (peran == "Penyihir") {
    print(
        "Halo Penyihir ${nama}, kamu dapat melihat siapa yang menjadi werewolf!");
  } else if (peran == "Guard") {
    print(
        "Halo Guard ${nama}, kamu akan membantu melindungi temanmu dari serangan werewolf.");
  } else if (peran == "Werewolf") {
    print("Halo Werewolf ${nama}, Kamu akan memakan mangsa setiap malam!");
  }

  //Jawaban Soal Nomor 3 ----------------------------------------------------------------------->
  print("SOAL NOMOR 3");
  var hari;

  print("Masukan Hari :");
  hari = stdin.readLineSync()!;

  while (hari != "Senin" &&
      hari != "Selasa" &&
      hari != "Rabu" &&
      hari != "Kamis" &&
      hari != "Jumat" &&
      hari != "Sabtu" &&
      hari != "Minggu") {
    print("Input Tidak Valid, silakan coba lagi.");
    print("Masukan Hari :");
    hari = stdin.readLineSync()!;
  }

  switch (hari) {
    case "Senin":
      {
        print(
            "Segala sesuatu memiliki kesudahan, yang sudah berakhir biarlah berlalu dan yakinlah semua akan baik-baik saja.");
        break;
      }
    case "Selasa":
      {
        print(
            "Setiap detik sangatlah berharga karena waktu mengetahui banyak hal, termasuk rahasia hati.");
        break;
      }
    case "Rabu":
      {
        print(
            "Jika kamu tak menemukan buku yang kamu cari di rak, maka tulislah sendiri.");
        break;
      }
    case "Kamis":
      {
        print(
            "Jika hatimu banyak merasakan sakit, maka belajarlah dari rasa sakit itu untuk tidak memberikan rasa sakit pada orang lain.");
        break;
      }
    case "Jumat":
      {
        print("Hidup tak selamanya tentang pacar.");
        break;
      }
    case "Sabtu":
      {
        print("Rumah bukan hanya sebuah tempat, tetapi itu adalah perasaan.");
        break;
      }
    case "Minggu":
      {
        print(
            "Hanya seseorang yang takut yang bisa bertindak berani. Tanpa rasa takut itu tidak ada apapun yang bisa disebut berani.");
        break;
      }
  }

  //Jawaban Soal Nomor 4 ----------------------------------------------------------------------->
  print("SOAL NOMOR 4");

  var tanggal = 21;
  var bulan = 1;
  var tahun = 1945;

  switch ((tanggal >= 1 && tanggal <= 31) &&
      (tahun >= 1900 && tahun <= 2200) &&
      (bulan >= 1 && bulan <= 12)) {
    case true:
      {
        switch (bulan) {
          case 1:
            {
              print("${tanggal} Januari ${tahun}");
              break;
            }
          case 2:
            {
              print("${tanggal} Februari ${tahun}");
              break;
            }
          case 3:
            {
              print("${tanggal} Maret ${tahun}");
              break;
            }
          case 4:
            {
              print("${tanggal} April ${tahun}");
              break;
            }
          case 5:
            {
              print("${tanggal} Mei ${tahun}");
              break;
            }
          case 6:
            {
              print("${tanggal} Juni ${tahun}");
              break;
            }
          case 7:
            {
              print("${tanggal} Juli ${tahun}");
              break;
            }
          case 8:
            {
              print("${tanggal} Agustus ${tahun}");
              break;
            }
          case 9:
            {
              print("${tanggal} September ${tahun}");
              break;
            }
          case 10:
            {
              print("${tanggal} Oktober ${tahun}");
              break;
            }
          case 11:
            {
              print("${tanggal} November ${tahun}");
              break;
            }
          case 12:
            {
              print("${tanggal} Desember ${tahun}");
              break;
            }
        }
      }
    case false:
      {
        print("Input Tidak Valid");
      }
  }
}
