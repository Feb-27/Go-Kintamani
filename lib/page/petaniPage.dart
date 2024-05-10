import 'package:flutter/material.dart';
import 'package:flutter_application_1/main.dart';
import 'package:flutter_application_1/models/petani.dart';
import 'package:flutter_application_1/page/detailPetani.dart';
import 'package:flutter_application_1/page/TambahEdit_Petani_Page.dart';
import 'package:flutter_application_1/services/apistatic.dart';

class DatasScreen extends StatefulWidget {
  const DatasScreen({
    super.key,
    required Future<List<Petani>> futurePetani,
  });

  @override
  State<DatasScreen> createState() => _DatasScreenState();
}

class _DatasScreenState extends State<DatasScreen> {
  late final ApiStatic _apistatic;
  late Future<List<Petani>> futurePetani;

  @override
  void initState() {
    super.initState();
    _apistatic = ApiStatic();
    futurePetani = _apistatic.fetchPetani();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Petani'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => MyApp(),
              ),
            );
          },
        ),
      ),
      body: Center(
        child: FutureBuilder<List<Petani>>(
          future: futurePetani,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const CircularProgressIndicator();
            } else if (snapshot.hasError) {
              return Text('Error: ${snapshot.error}');
            } else if (snapshot.hasData) {
              final List<Petani> petaniList = snapshot.data!;
              return RefreshIndicator(
                onRefresh: () async {
                  setState(() {
                    futurePetani = _apistatic.fetchPetani();
                  });
                },
                child: ListView.builder(
                  itemCount: petaniList.length,
                  itemBuilder: (context, index) {
                    final petani = petaniList[index];
                    return Column(
                      children: [
                        InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => DetailPetaniPage(
                                  petani: petani,
                                ),
                              ),
                            );
                          },
                          child: ListTile(
                            leading: CircleAvatar(
                              backgroundImage: NetworkImage(petani.foto ?? ''),
                              radius: 20,
                            ),
                            title: Text(
                              petani.nama ?? 'Tidak tersedia',
                              style: const TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            subtitle: Text(
                              'NIK: ${petani.nik ?? 'Tidak tersedia'}',
                            ),
                            trailing: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                IconButton(
                                  icon: const Icon(Icons.edit),
                                  onPressed: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            TambahEditPetaniScreen(
                                          petani: petani,
                                        ),
                                      ),
                                    );
                                  },
                                ),
                                IconButton(
                                  icon: const Icon(Icons.delete),
                                  onPressed: () async {
                                    final confirmed = await showDialog<bool>(
                                      context: context,
                                      builder: (context) {
                                        return AlertDialog(
                                          title: const Text('Konfirmasi Hapus'),
                                          content: const Text(
                                              'Apakah Anda yakin ingin menghapus petani ini?'),
                                          actions: [
                                            TextButton(
                                              child: const Text('Batal'),
                                              onPressed: () {
                                                Navigator.of(context)
                                                    .pop(false);
                                              },
                                            ),
                                            TextButton(
                                              child: const Text('Hapus'),
                                              onPressed: () async {
                                                try {
                                                  final idPenjual =
                                                      petani.idPenjual;
                                                  if (idPenjual != null) {
                                                    await ApiStatic
                                                        .deletePetani(
                                                            idPenjual);
                                                    setState(() {
                                                      futurePetani = _apistatic
                                                          .fetchPetani();
                                                    });
                                                  }
                                                } catch (e) {
                                                  ScaffoldMessenger.of(context)
                                                      .showSnackBar(
                                                    SnackBar(
                                                      content: Text(
                                                          'Gagal menghapus petani: $e'),
                                                    ),
                                                  );
                                                }
                                                Navigator.of(context).pop(true);
                                              },
                                            ),
                                          ],
                                        );
                                      },
                                    );
                                    if (confirmed == true) {
                                      // Lakukan tindakan penghapusan
                                    }
                                  },
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    );
                  },
                ),
              );
            } else {
              return const Text('Data tidak tersedia');
            }
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const TambahEditPetaniScreen(),
            ),
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
