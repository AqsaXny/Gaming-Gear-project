import 'package:flutter/material.dart';
import 'header.dart';
import 'item_gear.dart';
import 'info_gear.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Gaming Gear Review',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(useMaterial3: true, brightness: Brightness.light),
      home: const HomePage(),
    );
  }
}

class DataGear {
  final int id;
  final String judul;
  final String gambar;
  final int rating;
  final String detil;
  const DataGear({
    required this.id,
    required this.judul,
    required this.gambar,
    required this.rating,
    required this.detil,
  });
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<DataGear> dataGear = const [
    DataGear(
      id: 0,
      judul: 'Mousepad, TalonGames SHO',
      gambar: 'assets/mousepad.jpeg',
      rating: 4,
      detil:
          'Mousepad Talongames SHO dirancang untuk ketahanan dan kinerja, menampilkan serat tenun komposit datar yang memastikan permukaan halus untuk pengguliran yang optimal.',
    ),
    DataGear(
      id: 1,
      judul: 'Mouse, Raiden S33 Pro',
      gambar: 'assets/mouse.jpeg',
      rating: 4,
      detil:
          'Mouse gaming modular triple connection dari Sades. Sades Raiden Pro kombinasi sempurna antara performa, fleksibilitas, dan personalisasi. mouse ini diciptakan khusus untuk para gamer yang menginginkan ketepatan dan style.',
    ),
    DataGear(
      id: 2,
      judul: 'Keyboard, VortexSeries NS75',
      gambar: 'assets/keyboard.jpeg',
      rating: 5,
      detil:
          'VortexSeries NS75 adalah mechanical keyboard 75% yang menawarkan paket fitur lengkap (koneksi tri-mode, hot-swappable 5-pin) dengan nilai jual utamanya pada sensasi mengetik gasket mount yang empuk dan "thocky".',
    ),
    DataGear(
      id: 3,
      judul: 'Monitor, Asus VG259Q3A',
      gambar: 'assets/monitor3.jpeg',
      rating: 5,
      detil:
          'Ini adalah monitor 1080p yang "kencang", pilihan solid bagi gamer yang memprioritaskan frame rate dan responsivitas di atas segalanya, terutama untuk game seperti Valorant, CS:GO, atau Apex Legends.',
    ),
    DataGear(
      id: 4,
      judul: 'Gamepad, Fantech WGP13s',
      gambar: 'assets/gamepad.jpeg',
      rating: 5,
      detil:
          'Fantech WGP13S adalah pilihan "value for money" yang sangat kuat bagi siapa saja yang mencari gamepad wireless 2.4Ghz yang responsif untuk PC atau Android, dengan feel dan layout ala stik Xbox, tanpa harus mengeluarkan biaya mahal.',
    ),
  ];

  int terpilih = 0;

  @override
  Widget build(BuildContext context) {
    final atas = Expanded(flex: 7, child: InfoGear(data: dataGear[terpilih]));
    final bawah = Expanded(
      flex: 3,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: const EdgeInsets.only(top: 0),
            padding: const EdgeInsets.only(left: 20, top: 10, bottom: 6),
            decoration: BoxDecoration(
              color: Color.fromRGBO(183, 229, 205, 1),
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(10),
                topRight: Radius.circular(10),
              ),
              boxShadow: [
                BoxShadow(
                  blurRadius: 6,
                  color: Color.fromRGBO(193, 120, 90, 1).withOpacity(0.05),
                  offset: const Offset(0, -1),
                ),
              ],
            ),
            child: const Text(
              'Gaming Gear Lainnya:',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.only(top: 10),
              itemCount: dataGear.length,
              itemBuilder: (context, i) {
                if (i == terpilih) {
                  return const SizedBox.shrink();
                }
                final d = dataGear[i];
                return InkWell(
                  onTap: () => setState(() => terpilih = i),
                  child: ItemWisata(teks: d.judul, gambarAssetPath: d.gambar),
                );
              },
            ),
          ),
        ],
      ),
    );

    return Scaffold(
      backgroundColor: Color.fromRGBO(183, 229, 205, 1),
      body: SafeArea(
        child: Column(
          children: [
            const Header(
              teks: 'GAMING GEAR KELABU',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w600,
                fontSize: 18,
              ),
            ),
            Expanded(child: Column(children: [atas, bawah])),
          ],
        ),
      ),
    );
  }
}
