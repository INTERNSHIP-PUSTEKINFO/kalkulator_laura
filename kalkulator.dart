import 'dart:io';
import 'dart:math';

void main() {
  while (true) {
    print('\n=== Kalkulator ===');
    print('Operator yang tersedia:');
    print('[+, -, *, /, %, ^, sqrt, sin, cos, tan]');
    stdout.write('Masukkan Operator: ');
    String operator = stdin.readLineSync()!.trim().toLowerCase();

    double hasil;

    // Operasi dengan 1 angka
    if (['sqrt', 'sin', 'cos', 'tan'].contains(operator)) {
      stdout.write('Masukkan angka: ');
      double angka = double.parse(stdin.readLineSync()!);

      switch (operator) {
        case 'sqrt':
          if (angka < 0) {
            print('Error: Tidak bisa akar dari bilangan negatif!');
            continue;
          }
          hasil = sqrt(angka);
          print('Hasil √$angka = $hasil');
          break;
        case 'sin':
          hasil = sin(angka * pi / 180); // konversi ke radian
          print('Hasil sin($angka°) = $hasil');
          break;
        case 'cos':
          hasil = cos(angka * pi / 180);
          print('Hasil cos($angka°) = $hasil');
          break;
        case 'tan':
          if ((angka % 180 == 90)) {
            print('Error: tan($angka°) tidak terdefinisi.');
            continue;
          }
          hasil = tan(angka * pi / 180);
          print('Hasil tan($angka°) = $hasil');
          break;
      }
    }
    // Operasi dengan 2 angka
    else if (['+', '-', '*', '/', '%', '^'].contains(operator)) {
      stdout.write('Masukkan angka pertama: ');
      double angka1 = double.parse(stdin.readLineSync()!);

      stdout.write('Masukkan angka kedua: ');
      double angka2 = double.parse(stdin.readLineSync()!);

      switch (operator) {
        case '+':
          hasil = angka1 + angka2;
          break;
        case '-':
          hasil = angka1 - angka2;
          break;
        case '*':
          hasil = angka1 * angka2;
          break;
        case '/':
          if (angka2 == 0) {
            print('Error: Pembagian dengan nol!');
            continue;
          }
          hasil = angka1 / angka2;
          break;
        case '%':
          hasil = angka1 % angka2;
          break;
        case '^':
          hasil = pow(angka1, angka2).toDouble();
          break;
        default:
          print('Operator tidak dikenal.');
          continue;
      }
      print('Hasil: $angka1 $operator $angka2 = $hasil');
    }
    // Jika input tidak sesuai
    else {
      print('Operator tidak valid.');
      continue;
    }

    // Tanya apakah ingin menghitung lagi
    stdout.write('\nIngin menghitung lagi? (y/n): ');
    String? ulang = stdin.readLineSync();
    if (ulang == null || ulang.toLowerCase() != 'y') {
      print('thankyou for using kalkulator, happy nice dayy ^U^');
      break;
    }
  }
}
