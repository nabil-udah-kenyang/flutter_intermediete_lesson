# Intermediate Track Flutter

![Dart](https://img.shields.io/badge/Dart-0175C2?style=for-the-badge&logo=dart&logoColor=white)
![Flutter](https://img.shields.io/badge/Flutter-02569B?style=for-the-badge&logo=flutter&logoColor=white)
![GetX](https://img.shields.io/badge/GetX-6D38FF?style=for-the-badge&logo=flutter&logoColor=white)
![Firebase](https://img.shields.io/badge/Firebase-FFCA28?style=for-the-badge&logo=firebase&logoColor=black)
![Supabase](https://img.shields.io/badge/Supabase-3ECF8E?style=for-the-badge&logo=supabase&logoColor=white)
![Android Studio](https://img.shields.io/badge/Android_Studio-3DDC84?style=for-the-badge&logo=androidstudio&logoColor=white)
![Neovim](https://img.shields.io/badge/Neovim-57A143?style=for-the-badge&logo=neovim&logoColor=white)
![GitHub](https://img.shields.io/badge/GitHub-181717?style=for-the-badge&logo=github&logoColor=white)

Repository ini adalah kumpulan latihan bertahap untuk belajar **Flutter** dari layout responsif sampai integrasi backend. Materinya dimulai dari `MediaQuery`, `Flexible`, dan `Expanded`, kemudian berlanjut ke animasi, navigasi, widget visual, Firebase, autentikasi, Firestore CRUD, dan Supabase.

Setiap folder adalah project Flutter mandiri dengan `pubspec.yaml`, struktur GetX, dan entry point masing-masing. Kerjakan project secara berurutan agar konsep sebelumnya bisa dipakai pada latihan berikutnya.

## Learning Path

1. **Responsive Layout**  
   Belajar membaca ukuran device dan menyesuaikan tampilan dengan `MediaQuery`, `Flexible`, `Expanded`, `FittedBox`, `Wrap`, `Get.width`, `Get.height`, `LayoutBuilder`, `ConstrainedBox`, dan `OrientationBuilder`.

2. **Animation**  
   Mengenal implicit animation melalui `AnimatedContainer`, `AnimatedAlign`, dan `AnimatedPositioned`, lalu memahami `AnimationController` dan `AnimatedBuilder`.

3. **Navigation & Visual Widget**  
   Membuat transisi halaman yang lebih halus dengan `Hero`, memotong bentuk widget menggunakan `ClipOval`/`ClipRRect`, serta membuat carousel dengan package `carousel_slider`.

4. **Backend Integration**  
   Menghubungkan Flutter dengan Firebase Firestore, Firebase Authentication, dan Supabase Auth, Database, Realtime Stream, Storage, serta upload gambar.

## Struktur Folder

| Folder | Materi Latihan |
| --- | --- |
| `01_mediaquery` | Membaca ukuran layar dan safe area menggunakan `MediaQuery`. |
| `02_flexible` | Membagi ruang pada `Row`/`Column` secara fleksibel dengan `Flexible` dan nilai `flex`. |
| `03_expanded` | Mengambil sisa ruang yang tersedia menggunakan `Expanded`. |
| `04_fitted_box` | Menyesuaikan ukuran child agar tidak overflow menggunakan `FittedBox`. |
| `05_wrap` | Membuat layout yang otomatis pindah baris ketika ruang tidak cukup dengan `Wrap`. |
| `06_get_width_height` | Mengakses ukuran layar melalui `Get.width`, `Get.height`, dan padding dari context. |
| `07_layout_builder` | Membuat layout berdasarkan constraint yang diterima widget dengan `LayoutBuilder`. |
| `08_constrained_box` | Memberikan batas minimum dan maksimum ukuran child memakai `ConstrainedBox`. |
| `09_orientation_builder` | Menyiapkan layout berbeda untuk mode portrait dan landscape. |
| `10_animated_container` | Animasi perubahan ukuran dan warna menggunakan `AnimatedContainer` serta state reactive GetX. |
| `11_animated_alignment` | Memindahkan posisi child secara halus dengan `AnimatedAlign`. |
| `12_animated_position` | Menganimasikan posisi widget di dalam `Stack` menggunakan `AnimatedPositioned`. |
| `13_animated_builder` | Animasi custom dengan `AnimationController`, `GetSingleTickerProviderStateMixin`, dan `AnimatedBuilder`. |
| `14_hero_navigasi` | Transisi antar halaman dengan `Hero`, termasuk halaman home dan profile. |
| `15_widget_clip` | Membentuk tampilan widget dengan `ClipOval` dan `ClipRRect`. |
| `16_widget_carousel_slider` | Membuat carousel horizontal/vertikal dengan package `carousel_slider`. |
| `17_belajar_firebase` | Inisialisasi Firebase dan membaca data Firestore menggunakan `FutureBuilder`. |
| `18_praktik_firebase_CRUD` | Mini project auth dan product CRUD dengan Firebase Auth, Firestore, `StreamBuilder`, query, login, register, dan reset password. |
| `19_belajar_supabase` | Auth Supabase, realtime product list, CRUD product, upload gambar ke Storage, dan public image URL. |

## Struktur Umum Project

Project menggunakan pola struktur GetX seperti berikut:

```text
lib/
  app/
    controllers/          # Controller global, contohnya AuthController
    modules/
      home/
        bindings/
        controllers/
        views/
      ...
    routes/
      app_pages.dart
      app_routes.dart
  firebase_options.dart   # Hanya ada pada project Firebase
  main.dart
```

Secara umum:

- `views` berisi tampilan dan interaksi UI.
- `controllers` berisi state serta logic aplikasi.
- `bindings` mendaftarkan dependency sebelum halaman dibuka.
- `routes` mengatur named route GetX.
- `main.dart` melakukan inisialisasi plugin sebelum `runApp` jika diperlukan.

## Prasyarat

- Flutter SDK dan Dart SDK sudah terpasang.
- Android Studio atau emulator/device Flutter.
- Editor seperti Neovim, VS Code, atau Android Studio.
- Firebase CLI dan FlutterFire CLI untuk folder `17` dan `18`.
- Project Supabase sendiri untuk folder `19`.

Periksa instalasi Flutter dengan:

```bash
flutter doctor
```

## Cara Menjalankan

Masuk ke salah satu folder project Flutter, kemudian jalankan:

```bash
cd 01_mediaquery
flutter pub get
flutter run
```

Contoh menjalankan project tertentu:

```bash
cd 13_animated_builder
flutter pub get
flutter run
```

Karena setiap folder mempunyai `pubspec.yaml` sendiri, perintah `flutter pub get` perlu dijalankan dari folder project yang ingin dibuka.

## Cuplikan Kode

### MediaQuery untuk Layout Responsif

```dart
@override
Widget build(BuildContext context) {
  final size = MediaQuery.sizeOf(context);
  final paddingTop = MediaQuery.paddingOf(context).top;

  return Container(
    margin: EdgeInsets.only(top: paddingTop),
    width: size.width / 2,
    height: size.height,
    color: Colors.red,
  );
}
```

### Flexible dan Expanded

```dart
Row(
  children: [
    Flexible(flex: 7, child: Container(color: Colors.red)),
    Flexible(flex: 3, child: Container(color: Colors.amber)),
    Expanded(child: Container(color: Colors.green)),
  ],
)
```

`Flexible` membagi ruang berdasarkan nilai `flex`, sedangkan `Expanded` mengambil sisa ruang yang tersedia.

### Layout Berdasarkan Constraint

```dart
LayoutBuilder(
  builder: (context, constraints) {
    final isWide = constraints.maxWidth >= 600;

    return isWide
        ? const Text('Layout lebar')
        : const Text('Layout compact');
  },
)
```

### AnimatedContainer dengan GetX

```dart
class HomeController extends GetxController {
  final selected = false.obs;
}
```

```dart
Obx(
  () => GestureDetector(
    onTap: controller.selected.toggle,
    child: AnimatedContainer(
      duration: const Duration(seconds: 2),
      curve: Curves.fastLinearToSlowEaseIn,
      width: controller.selected.isFalse ? 300 : 100,
      height: controller.selected.isFalse ? 300 : 100,
      color: controller.selected.isFalse
          ? Colors.cyan
          : Colors.redAccent,
    ),
  ),
)
```

### Hero Navigation

Gunakan `tag` yang sama pada halaman asal dan halaman tujuan:

```dart
Hero(
  tag: 'profile-image',
  child: ClipOval(
    child: Image.network(
      imageUrl,
      width: 100,
      height: 100,
      fit: BoxFit.cover,
    ),
  ),
)
```

### Inisialisasi Firebase

```dart
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(const MyApp());
}
```

Contoh membaca koleksi Firestore secara one-time:

```dart
Future<QuerySnapshot<Map<String, dynamic>>> getBooks() {
  return FirebaseFirestore.instance.collection('rak-buku').get();
}
```

Untuk data realtime, project `18_praktik_firebase_CRUD` menggunakan `StreamBuilder` dengan stream dari Firestore.

### Inisialisasi Supabase

```dart
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Supabase.initialize(
    url: 'https://your-project.supabase.co',
    publishableKey: 'your-publishable-key',
  );

  runApp(const MyApp());
}
```

Contoh stream realtime untuk tabel product:

```dart
final supabase = Supabase.instance.client;

Stream<List<Map<String, dynamic>>> getProducts() {
  return supabase.from('product').stream(primaryKey: ['id']);
}
```

## Package yang Dipakai

| Package | Dipakai Untuk |
| --- | --- |
| `get` | State management, named route, dependency injection, dialog, snackbar, dan bottom sheet. |
| `carousel_slider` | Membuat carousel gambar atau konten. |
| `firebase_core` | Inisialisasi Firebase pada aplikasi Flutter. |
| `cloud_firestore` | Membaca, menambah, mengubah, dan menghapus data Firestore. |
| `firebase_auth` | Register, login, verifikasi email, logout, dan reset password Firebase. |
| `supabase_flutter` | Auth, database, realtime stream, dan Storage Supabase. |
| `image_picker` | Memilih gambar dari gallery/device. |
| `mime` | Menentukan MIME type file sebelum upload ke Storage. |
| `google_fonts` | Menggunakan font Google pada latihan widget clip. |
| `cupertino_icons` | Icon bergaya Cupertino yang tersedia pada template Flutter. |

## Setup Firebase

Folder `17_belajar_firebase` dan `18_praktik_firebase_CRUD` membutuhkan konfigurasi Firebase.

```bash
firebase login
dart pub global activate flutterfire_cli
flutterfire configure
flutter pub get
flutter run
```

Pastikan service berikut sudah aktif pada project Firebase:

- Cloud Firestore untuk folder `17`.
- Firebase Authentication dan provider Email/Password untuk folder `18`.
- Cloud Firestore untuk menyimpan data product pada folder `18`.

Jika memakai project Firebase sendiri, jalankan `flutterfire configure` dari folder project tersebut dan jangan menyalin konfigurasi project lama secara sembarangan.

## Setup Supabase

Folder `19_belajar_supabase` membutuhkan project Supabase sendiri. Sebelum menjalankan aplikasi:

1. Buat project Supabase.
2. Siapkan tabel `product` dengan kolom minimal `id`, `name`, `price`, `created_at`, `image_url`, dan `image_path`.
3. Buat Storage bucket bernama `product-images`.
4. Atur policy RLS untuk operasi auth, database, dan Storage sesuai kebutuhan aplikasi.
5. Ganti `url` dan `publishableKey` pada `lib/main.dart`.

Jangan menaruh service role key di aplikasi Flutter. Gunakan publishable key dan atur keamanan akses melalui RLS/policy Supabase.

## Catatan Belajar

- Kerjakan folder dari `01_mediaquery` sampai `19_belajar_supabase` secara berurutan.
- Pahami constraint Flutter sebelum memakai banyak angka tetap pada layout.
- Gunakan `Flexible`, `Expanded`, `Wrap`, dan `LayoutBuilder` untuk mengurangi masalah overflow.
- Bedakan implicit animation seperti `AnimatedContainer` dengan explicit animation yang memakai `AnimationController`.
- Pada project Firebase dan Supabase, pisahkan UI, controller, dan akses data agar logic lebih mudah dirawat.
- Saat memakai `StreamBuilder`, selalu siapkan state loading, error, dan data kosong.
- Pastikan RLS Supabase sudah dipahami sebelum membuka akses baca/tulis ke tabel atau Storage.

## Target Setelah Menyelesaikan Track Ini

Setelah menyelesaikan semua folder, kamu diharapkan bisa:

- Membuat layout yang beradaptasi terhadap ukuran dan orientasi device.
- Memilih widget layout yang tepat untuk mengatasi constraint dan overflow.
- Membuat animasi implicit dan explicit pada aplikasi Flutter.
- Membuat transisi halaman dengan `Hero` dan mengatur bentuk widget dengan clip widget.
- Menggunakan package Flutter seperti `carousel_slider`, `image_picker`, dan `google_fonts`.
- Menginisialisasi Firebase dan membaca data dari Firestore.
- Membuat autentikasi serta CRUD sederhana dengan Firebase Auth dan Firestore.
- Menggunakan Supabase Auth, database realtime, Storage, dan upload gambar.
- Menyusun project dengan pola GetX berupa route, binding, controller, dan view.
