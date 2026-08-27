import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:your_eo/components/form.dart';
import 'dart:convert';

class BookingSayaPage extends StatefulWidget {
  const BookingSayaPage({Key? key}) : super(key: key);

  @override
  State<BookingSayaPage> createState() => _BookingSayaPageState();
}

class _BookingSayaPageState extends State<BookingSayaPage> {
  List<Map<String, dynamic>> bookings = [];
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _fetchBookings();
  }

  Future<void> _fetchBookings() async {
    final url = Uri.parse("http://localhost:3000/api/bookings");

    try {
      final response = await http.get(url);

      if (response.statusCode == 200) {
        final List<Map<String, dynamic>> data = await compute(
          _parseBookings,
          response.body,
        );

        setState(() {
          bookings = data;
          _isLoading = false;
        });
      } else {
        debugPrint("Gagal memuat data booking: ${response.statusCode}");
        setState(() => _isLoading = false);
      }
    } catch (e) {
      debugPrint("Error: $e");
      setState(() => _isLoading = false);
    }
  }

  static List<Map<String, dynamic>> _parseBookings(String responseBody) {
    final parsed = jsonDecode(responseBody) as List<dynamic>;
    return parsed
        .map<Map<String, dynamic>>(
          (item) => {
            "id": item['id'],
            "nama": item['nama_lengkap'] ?? '',
            "paket": item['paket'] ?? '',
            "tanggal": item['tanggal_acara'] ?? '',
            "kapasitas": "${item['jumlah_tamu'] ?? 0} orang",
            "jumlah_tamu": item['jumlah_tamu'] ?? 0,
            "catatan": item['catatan'] ?? '',
          },
        )
        .toList();
  }

  void _deleteBooking(int index) {
    final bookingId = bookings[index]['id'];
    showCupertinoDialog(
      context: context,
      builder:
          (context) => CupertinoAlertDialog(
            title: const Text('Hapus Pesanan'),
            content: const Text('Yakin ingin menghapus pesanan ini?'),
            actions: [
              CupertinoDialogAction(
                child: const Text('Batal'),
                onPressed: () => Navigator.pop(context),
              ),
              CupertinoDialogAction(
                isDestructiveAction: true,
                child: const Text('Hapus'),
                onPressed: () async {
                  Navigator.pop(context);
                  final url = Uri.parse(
                    "http://localhost:3000/api/bookings/$bookingId",
                  );
                  final response = await http.delete(url);

                  if (response.statusCode == 200) {
                    setState(() => bookings.removeAt(index));
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Pesanan berhasil dihapus')),
                    );
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text('Gagal menghapus: ${response.body}'),
                      ),
                    );
                  }
                },
              ),
            ],
          ),
    );
  }

  Future<void> _editBooking(Map<String, dynamic> booking, int index) async {
    final updatedBooking = await Navigator.push(
      context,
      MaterialPageRoute(
        builder:
            (context) =>
                FormBookingPage(paket: booking['paket'], existingData: booking),
      ),
    );

    if (updatedBooking != null) {
      final id = booking['id'];
      final url = Uri.parse("http://localhost:3000/api/bookings/$id");

      final bodyData = {
        "nama_lengkap": updatedBooking['nama'],
        "tanggal_acara": updatedBooking['tanggal'],
        "jumlah_tamu":
            updatedBooking['jumlah_tamu'] is int
                ? updatedBooking['jumlah_tamu']
                : int.tryParse(updatedBooking['jumlah_tamu'].toString()) ?? 0,
        "catatan": updatedBooking['catatan'],
        "paket": updatedBooking['paket'],
      };

      final response = await http.patch(
        url,
        headers: {"Content-Type": "application/json"},
        body: jsonEncode(bodyData),
      );

      if (response.statusCode == 200) {
        setState(() {
          bookings[index] = {
            "id": id,
            "nama": updatedBooking['nama'],
            "paket": updatedBooking['paket'],
            "tanggal": updatedBooking['tanggal'],
            "kapasitas": "${bodyData['jumlah_tamu']} orang",
            "jumlah_tamu": bodyData['jumlah_tamu'],
            "catatan": updatedBooking['catatan'],
          };
        });
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Gagal update: ${response.body}")),
        );
      }
    }
  }

  Future<void> tambahBooking() async {
    final newBooking = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const FormBookingPage(paket: "Custom Paket"),
      ),
    );

    if (newBooking != null) {
      setState(() => bookings.add(newBooking));
    }
  }

  String _formatTanggal(String isoDate) {
    try {
      final date = DateTime.parse(isoDate);
      return "${date.year}-${_twoDigits(date.month)}-${_twoDigits(date.day)}";
    } catch (e) {
      return isoDate;
    }
  }

  String _twoDigits(int n) => n.toString().padLeft(2, '0');

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(title: const Text('Booking Saya')),
        body:
            _isLoading
                ? const Center(child: CircularProgressIndicator())
                : bookings.isEmpty
                ? const Center(child: Text("Belum ada booking saya"))
                : ListView.builder(
                  padding: const EdgeInsets.all(16),
                  itemCount: bookings.length,
                  itemBuilder: (context, index) {
                    final booking = bookings[index];
                    return Card(
                      margin: const EdgeInsets.only(bottom: 16),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      elevation: 3,
                      child: Padding(
                        padding: const EdgeInsets.all(16),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Nama: ${booking['nama']}',
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text('Paket: ${booking['paket']}'),
                            Text(
                              'Tanggal: ${_formatTanggal(booking['tanggal'])}',
                            ),
                            Text('Kapasitas: ${booking['kapasitas']}'),
                            Text('Catatan: ${booking['catatan']}'),
                            const SizedBox(height: 12),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                OutlinedButton.icon(
                                  onPressed: () => _editBooking(booking, index),
                                  icon: const Icon(
                                    Icons.edit,
                                    color: Colors.blue,
                                  ),
                                  label: const Text(
                                    'Update',
                                    style: TextStyle(color: Colors.blue),
                                  ),
                                ),
                                const SizedBox(width: 5),
                                OutlinedButton.icon(
                                  onPressed: () => _deleteBooking(index),
                                  icon: const Icon(
                                    Icons.delete,
                                    color: Colors.red,
                                  ),
                                  label: const Text(
                                    'Hapus',
                                    style: TextStyle(color: Colors.red),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
      ),
    );
  }
}
