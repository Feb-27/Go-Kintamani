import 'dart:io';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter_application_1/models/kelompok.dart';
import 'package:flutter_application_1/models/petani.dart';
import 'package:flutter_application_1/services/apistatic.dart';
import 'package:flutter_application_1/page/petaniPage.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class TambahEditPetaniScreen extends StatefulWidget {
  final Petani? petani;
  const TambahEditPetaniScreen({this.petani, Key? key}) : super(key: key);

  @override
  _TambahEditPetaniScreenState createState() => _TambahEditPetaniScreenState();
}

class _TambahEditPetaniScreenState extends State<TambahEditPetaniScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  // Perbaikan tipe data Future

  String? _nik;
  String? _nama;
  String? _alamat;
  String? _telp;
  String? _idKelompok;
  String _status = 'N';
  String? _fotoPath;

  final ApiStatic apiStatic = ApiStatic();

  Kelompok? _selectedKelompok;
  List<Kelompok> _kelompokList = [];

  Future<void> _pickImage(ImageSource source) async {
    final pickedFile = await ImagePicker().pickImage(source: source);
    if (pickedFile != null) {
      setState(() {
        _fotoPath = pickedFile.path;
      });
    }
  }

  Future<void> _pickImageFromGallery() async {
    final pickedImage =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickedImage != null) {
      setState(() {
        _fotoPath = pickedImage.path;
      });
    }
  }

  Future<void> _fetchKelompokTani() async {
    try {
      final response =
          await http.get(Uri.parse('https://dev.wefgis.com/api/kelompoktani'));
      if (response.statusCode == 200) {
        var jsonData = jsonDecode(response.body) as List;
        setState(() {
          _kelompokList =
              jsonData.map((item) => Kelompok.fromJson(item)).toList();
          if (widget.petani != null) {
            _selectedKelompok = _kelompokList.firstWhere(
              (kelompok) =>
                  kelompok.idKelompokTani == widget.petani!.idKelompokTani,
              orElse: () => _kelompokList.first,
            );
          }
        });
      } else {
        throw Exception('Failed to load data');
      }
    } catch (e) {
      print('Error fetching data: $e');
    }
  }

  void _saveData() async {
    try {
      if (widget.petani == null) {
        await ApiStatic.savePetani(
          Petani(
            idKelompokTani: _idKelompok!,
            nama: _nama!,
            nik: _nik!,
            alamat: _alamat!,
            telp: _telp!,
            status: _status,
            fotoPath: '',
          ),
          _fotoPath ?? '',
        );
        Fluttertoast.showToast(
          msg: 'Data berhasil ditambahkan',
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          backgroundColor: Colors.green,
          textColor: Colors.white,
        );
      } else {
        await ApiStatic.editPetani(
          widget.petani?.idPenjual,
          Petani(
            idKelompokTani: _idKelompok!,
            nama: _nama!,
            nik: _nik!,
            alamat: _alamat!,
            telp: _telp!,
            status: _status,
            fotoPath: '',
          ),
          _fotoPath ?? '',
        );
        Fluttertoast.showToast(
          msg: 'Data berhasil diperbarui',
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          backgroundColor: Colors.green,
          textColor: Colors.white,
        );
      }
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => const DatasScreen(),
        ),
      );
    } catch (e) {
      Fluttertoast.showToast(
        msg: 'Error: $e',
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.BOTTOM,
        backgroundColor: Colors.red,
        textColor: Colors.white,
      );
    }
  }

  @override
  void initState() {
    super.initState();
    _fetchKelompokTani();
    if (widget.petani != null) {
      _nik = widget.petani!.nik;
      _nama = widget.petani!.nama;
      _alamat = widget.petani!.alamat;
      _telp = widget.petani!.telp;
      _status = widget.petani!.status!;
      _idKelompok = widget.petani!.idKelompokTani;
      _fotoPath = widget.petani?.fotoPath ?? '';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.petani == null ? 'Tambah Petani' : 'Edit Petani'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              Card(
                elevation: 4,
                margin: const EdgeInsets.symmetric(vertical: 8),
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // NIK
                      TextFormField(
                        initialValue: _nik,
                        decoration: const InputDecoration(
                          labelText: 'NIK',
                          prefixIcon: Icon(Icons.badge),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'NIK tidak boleh kosong';
                          }
                          return null;
                        },
                        onSaved: (newValue) {
                          _nik = newValue!;
                        },
                      ),
                      const SizedBox(height: 10),
                      // Nama
                      TextFormField(
                        initialValue: _nama,
                        decoration: const InputDecoration(
                          labelText: 'Nama',
                          prefixIcon: Icon(Icons.person),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Nama tidak boleh kosong';
                          }
                          return null;
                        },
                        onSaved: (newValue) {
                          _nama = newValue!;
                        },
                      ),
                      const SizedBox(height: 10),
                      // Alamat
                      TextFormField(
                        initialValue: _alamat,
                        decoration: const InputDecoration(
                          labelText: 'Alamat',
                          prefixIcon: Icon(Icons.home),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Alamat tidak boleh kosong';
                          }
                          return null;
                        },
                        onSaved: (newValue) {
                          _alamat = newValue!;
                        },
                      ),
                      const SizedBox(height: 10),
                      // Telepon
                      TextFormField(
                        initialValue: _telp,
                        decoration: const InputDecoration(
                          labelText: 'Telepon',
                          prefixIcon: Icon(Icons.phone),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Telepon tidak boleh kosong';
                          }
                          return null;
                        },
                        onSaved: (newValue) {
                          _telp = newValue!;
                        },
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 10),
              // Dropdown untuk Kelompok Tani
              Card(
                elevation: 4,
                margin: const EdgeInsets.symmetric(vertical: 8),
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      DropdownButtonFormField<Kelompok>(
                        value: _selectedKelompok,
                        onChanged: (newValue) {
                          setState(() {
                            _selectedKelompok = newValue;
                            _idKelompok = newValue?.idKelompokTani;
                          });
                        },
                        items: _kelompokList.map<DropdownMenuItem<Kelompok>>(
                          (Kelompok kelompok) {
                            return DropdownMenuItem<Kelompok>(
                              value: kelompok,
                              child: Text(kelompok.namaKelompok),
                            );
                          },
                        ).toList(),
                        decoration: const InputDecoration(
                          labelText: 'Kelompok Tani',
                          prefixIcon: Icon(Icons.group),
                        ),
                        validator: (value) {
                          if (value == null) {
                            return 'Pilih kelompok tani';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 10),
                      // Radio button untuk status
                      ListTile(
                        title: const Text("Tidak Aktif"),
                        leading: Radio<String>(
                          value: "N",
                          groupValue: _status,
                          onChanged: (value) {
                            setState(() {
                              _status = value!;
                            });
                          },
                        ),
                      ),
                      ListTile(
                        title: const Text("Aktif"),
                        leading: Radio<String>(
                          value: "Y",
                          groupValue: _status,
                          onChanged: (value) {
                            setState(() {
                              _status = value!;
                            });
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              // Menampilkan gambar jika ada gambar yang dipilih
              if (_fotoPath != null && _fotoPath!.isNotEmpty)
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.file(
                      File(_fotoPath!),
                      height: 200,
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              // Tombol memilih gambar dari galeri atau kamera
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton.icon(
                    icon: const Icon(Icons.photo_library),
                    label: const Text('Galeri'),
                    onPressed: _pickImageFromGallery,
                  ),
                  ElevatedButton.icon(
                    icon: const Icon(Icons.photo_camera),
                    label: const Text('Kamera'),
                    onPressed: () {
                      _pickImage(ImageSource.camera);
                    },
                  ),
                ],
              ),
              const SizedBox(height: 20.0),
              // Tombol Submit atau Update
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    _formKey.currentState!.save();
                    _saveData();
                  }
                },
                child: Text(widget.petani == null ? 'Submit' : 'Update'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
