import 'package:flutter/material.dart';
import 'rating.dart';
import 'komentar_model.dart';
import 'main.dart';

class InfoGear extends StatefulWidget {
  final DataGear data;
  const InfoGear({super.key, required this.data});

  @override
  State<InfoGear> createState() => _InfoGearState();
}

class _InfoGearState extends State<InfoGear> {
  bool detil = false; // setara useState di PDF

  void _toggleDetil() => setState(() => detil = !detil);

  Future<void> _bukaKomentar() async {
    await showDialog(
      context: context,
      barrierDismissible: true,
      builder: (_) => const KomentarModel(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: [
        // Background gambar
        Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(widget.data.gambar),
              fit: BoxFit.cover,
            ),
          ),
        ),
        // Overlay gradient agar teks terbaca
        Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [Colors.transparent, Colors.black54],
            ),
          ),
        ),
        // Konten bawah
        Padding(
          padding: const EdgeInsets.only(bottom: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              // Lokasi + rating
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 27),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Text(
                        widget.data.judul,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          shadows: [Shadow(blurRadius: 3, color: Colors.black)],
                        ),
                      ),
                    ),
                    Rating(hati: widget.data.rating),
                  ],
                ),
              ),
              const SizedBox(height: 8),
              Container(
                height: 1,
                color: Colors.white24,
                margin: const EdgeInsets.symmetric(horizontal: 27),
              ),
              const SizedBox(height: 8),
              if (detil)
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 27),
                  child: Text(
                    widget.data.detil,
                    style: const TextStyle(
                      color: Colors.white,
                      shadows: [Shadow(blurRadius: 2, color: Colors.black)],
                    ),
                  ),
                ),
              const SizedBox(height: 10),
              // Dua ikon kanan: message & info (toggle)
              Padding(
                padding: const EdgeInsets.only(right: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    IconButton(
                      icon: const Icon(
                        Icons.message_outlined,
                        color: Colors.white,
                      ),
                      onPressed: _bukaKomentar,
                    ),
                    IconButton(
                      icon: Icon(
                        detil ? Icons.info : Icons.info_outline_rounded,
                        color: Colors.white,
                      ),
                      onPressed: _toggleDetil,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
