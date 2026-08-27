// form_booking_page.dart
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class FormBookingPage extends StatefulWidget {
  final String paket;
  final Map<String, dynamic>? existingData;
  final bool isEdit;

  const FormBookingPage({
    Key? key,
    required this.paket,
    this.existingData,
    this.isEdit = false,
  }) : super(key: key);

  @override
  _FormBookingPageState createState() => _FormBookingPageState();
}

class _FormBookingPageState extends State<FormBookingPage> {
  final _formKey = GlobalKey<FormState>();
  final _dateController = TextEditingController();
  final _namaController = TextEditingController();
  final _tamuController = TextEditingController();
  final _catatanController = TextEditingController();

  @override
  void initState() {
    super.initState();
    if (widget.existingData != null) {
      _namaController.text = widget.existingData!['nama'];
      _dateController.text = widget.existingData!['tanggal'];
      _tamuController.text = widget.existingData!['jumlah_tamu'].toString();
      _catatanController.text = widget.existingData!['catatan'];
    }
  }

  @override
  void dispose() {
    _dateController.dispose();
    _namaController.dispose();
    _tamuController.dispose();
    _catatanController.dispose();
    super.dispose();
  }

  Future<void> _selectDate(BuildContext context) async {
    // Coba parse manual dari controller.text
    DateTime initialDate = DateTime.now();
    try {
      final parts = _dateController.text.split('-');
      if (parts.length == 3) {
        final year = int.parse(parts[0]);
        final month = int.parse(parts[1]);
        final day = int.parse(parts[2]);
        initialDate = DateTime(year, month, day);
      }
    } catch (e) {
      debugPrint("Tanggal tidak valid: ${_dateController.text}, error: $e");
    }

    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: initialDate,
      firstDate: DateTime.now(),
      lastDate: DateTime(2100),
    );

    if (picked != null) {
      setState(() {
        _dateController.text =
            "${picked.year}-${picked.month.toString().padLeft(2, '0')}-${picked.day.toString().padLeft(2, '0')}";
      });
    }
  }

  Future<void> _submitBooking() async {
    final Map<String, dynamic> data = {
      "nama_lengkap": _namaController.text,
      "tanggal_acara": _dateController.text,
      "jumlah_tamu": int.tryParse(_tamuController.text) ?? 0,
      "catatan": _catatanController.text,
      "paket": widget.paket,
    };

    final bool isEdit = widget.isEdit || widget.existingData != null;
    final url =
        isEdit
            ? Uri.parse(
              "http://localhost:3000/api/bookings/${widget.existingData!['id']}",
            )
            : Uri.parse("http://localhost:3000/api/bookings");

    final response =
        isEdit
            ? await http.patch(
              // PATCH untuk update
              url,
              headers: {"Content-Type": "application/json"},
              body: jsonEncode(data),
            )
            : await http.post(
              // POST untuk tambah baru
              url,
              headers: {"Content-Type": "application/json"},
              body: jsonEncode(data),
            );

    if (response.statusCode == 200 || response.statusCode == 201) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            isEdit
                ? "Booking berhasil diupdate!"
                : "Booking berhasil ditambahkan!",
          ),
        ),
      );

      Navigator.pop(context, {
        "id":
            isEdit
                ? widget.existingData!['id']
                : jsonDecode(response.body)['id'],
        "nama": data['nama_lengkap'],
        "paket": data['paket'], // ✅ tambahkan ini
        "tanggal": data['tanggal_acara'],
        "kapasitas": "${data['jumlah_tamu']} orang",
        "jumlah_tamu": data['jumlah_tamu'],
        "catatan": data['catatan'],
      });
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Gagal kirim booking: ${response.body}")),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.isEdit ? "Edit Booking" : "Form Booking - ${widget.paket}",
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              TextFormField(
                controller: _namaController,
                decoration: const InputDecoration(labelText: "Nama Lengkap"),
                validator:
                    (value) =>
                        value == null || value.isEmpty ? 'Wajib diisi' : null,
              ),
              TextFormField(
                controller: _dateController,
                readOnly: true,
                onTap: () => _selectDate(context),
                decoration: const InputDecoration(
                  labelText: "Tanggal Acara",
                  suffixIcon: Icon(Icons.calendar_today),
                ),
                validator:
                    (value) =>
                        value == null || value.isEmpty ? 'Wajib diisi' : null,
              ),
              TextFormField(
                controller: _tamuController,
                decoration: const InputDecoration(labelText: "Jumlah Tamu"),
                keyboardType: TextInputType.number,
                validator:
                    (value) =>
                        value == null || value.isEmpty ? 'Wajib diisi' : null,
              ),
              TextFormField(
                controller: _catatanController,
                decoration: const InputDecoration(labelText: "Catatan"),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                child: Text(
                  widget.isEdit ? "Simpan Perubahan" : "Kirim Booking",
                ),
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    _submitBooking();
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
