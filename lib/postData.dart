import 'dart:ffi';
import 'dart:io';

class Barang {
  String? kode_barang;
  String nama_barang;
  int? harga;
  String? kondisi;
  int? jumlah;
  String? foto_barang;
  int? nelayan_id;

Barang({
this.kode_barang,
required this.nama_barang,
required this.harga,
required this.kondisi,
required this.jumlah,
required this.foto_barang,
required this.nelayan_id
});

 factory Barang.fromJson(Map<String, dynamic> json) {
    return Barang(
      kode_barang: json['kode_barang'] as String,
      nama_barang: json['nama_barang'] as String,
      harga: json['harga'] as int,
      kondisi: json['kondisi'] as String,
      jumlah: json['jumlah'] as int,
      foto_barang: json['foto_barang'] as String,
      nelayan_id: json['nelayan_id'] as int
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['kode_barang'] = kode_barang;
    data['nama_barang'] = nama_barang;
    data['harga'] = harga;
    data['kondisi'] = kondisi;
    data['jumlah'] = jumlah;
    data['foto_barang'] = foto_barang;
    data['nelayan_id'] = nelayan_id;
    return data;
  }
}

