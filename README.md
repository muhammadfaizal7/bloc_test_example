# Belajar Bloc Test

Repository ini bertujuan untuk mempelajari penggunaan **bloc_test** pada aplikasi Flutter untuk pengujian unit dan integrasi pada state management menggunakan BLoC.

## Fitur yang Dipelajari
- **State Management** menggunakan **BLoC**
- Penggunaan paket **bloc_test** untuk pengujian
- Simulasi event dan validasi perubahan state

## Struktur Proyek
```
lib/
├── bloc/
│   ├── product_bloc.dart
│   ├── product_event.dart
│   └── product_state.dart
├── model/
│   └── product.dart
└── main.dart

test/
├── product_bloc_test.dart
```

## Instalasi
Pastikan Anda sudah menginstal Flutter dan memiliki environment yang siap untuk development Flutter.

1. Clone repository ini:
   ```bash
   git clone https://github.com/username/belajar_bloc_test.git
   ```
2. Masuk ke direktori proyek:
   ```bash
   cd belajar_bloc_test
   ```
3. Instal dependencies:
   ```bash
   flutter pub get
   ```

## Menjalankan Aplikasi
1. Jalankan aplikasi:
   ```bash
   flutter run
   ```

## Menjalankan Test
1. Jalankan semua test:
   ```bash
   flutter test
   ```

2. Hasil test akan muncul di terminal:
   ```
   +1: All tests passed!  
   ```

## Contoh Pengujian
### ProductBloc Test
File: `test/product_bloc_test.dart`
```dart
import 'package:bloc_test/bloc_test.dart';
import 'package:bloc_test_example/bloc/product_bloc.dart';
import 'package:bloc_test_example/model/product.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group("Product Bloc Test", () {
    test("Initial Value", () {
      final productBloc = ProductBloc();
      expect(productBloc.state, ProductInitial()); // Memeriksa state awal langsung
    });

    blocTest<ProductBloc, ProductState>(
      "Add Product",
      build: () => ProductBloc(),
      act: (bloc) async {
        bloc.add(AddProduct(const Product(name: "Apel", price: 2000)));
      },
      expect: () => [
        ProductLoaded([const Product(name: "Apel", price: 2000)]),
      ],
    );
  });
}
```

## Dependencies yang Digunakan
- [flutter_bloc](https://pub.dev/packages/flutter_bloc)
- [bloc_test](https://pub.dev/packages/bloc_test)
- [equatable](https://pub.dev/packages/equatable)

Happy coding! ✌️

