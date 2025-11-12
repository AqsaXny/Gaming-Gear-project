import 'package:flutter/material.dart';

class Komentar {
  final String id;
  final String from;
  final String teks;
  const Komentar({required this.id, required this.from, required this.teks});
}

class KomentarModel extends StatefulWidget {
  const KomentarModel({super.key});
  @override
  State<KomentarModel> createState() => _KomentarModelState();
}

class _KomentarModelState extends State<KomentarModel> {
  final TextEditingController _ctrl = TextEditingController();
  final List<Komentar> _data = [
    const Komentar(id: '1', from: 'Mulyadi', teks: 'Aduuhh bagusnyooooo'),
    const Komentar(id: '2', from: 'Mulyani', teks: 'Whenn yhh beli ini'),
  ];

  void _tambah() {
    final t = _ctrl.text.trim();
    if (t.isEmpty) return;
    setState(() {
      _data.add(
        Komentar(
          id: 'komen_${DateTime.now().millisecondsSinceEpoch}',
          from: 'someone',
          teks: t,
        ),
      );
      _ctrl.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      insetPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 24),
      backgroundColor: Colors.white,
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxHeight: 520),
        child: Column(
          children: [
            const SizedBox(height: 14),
            const Text(
              'Komentar Tentang Gear Ini:',
              style: TextStyle(fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 8),
            const Divider(height: 1),
            Expanded(
              child: ListView.builder(
                padding: const EdgeInsets.symmetric(vertical: 8),
                itemCount: _data.length,
                itemBuilder: (_, i) {
                  final k = _data[i];
                  return Padding(
                    padding: const EdgeInsets.fromLTRB(12, 8, 12, 8),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          k.from,
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(height: 4),
                        Text(k.teks),
                      ],
                    ),
                  );
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(12, 8, 12, 8),
              child: TextField(
                controller: _ctrl,
                decoration: const InputDecoration(
                  hintText: 'Tambah Komentar',
                  border: OutlineInputBorder(),
                  isDense: true,
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                const SizedBox(width: 12),
                TextButton(onPressed: _tambah, child: const Text('TAMBAH')),
                const SizedBox(width: 8),
                FilledButton(
                  onPressed: () => Navigator.of(context).maybePop(),
                  child: const Text('TUTUP'),
                ),
                const SizedBox(width: 12),
              ],
            ),
            const SizedBox(height: 12),
          ],
        ),
      ),
    );
  }
}
