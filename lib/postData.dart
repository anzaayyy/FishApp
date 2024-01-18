import 'dart:ffi';
import 'dart:io';

class Barang {
  String? kode_barang;
  String nama_barang;
  String? harga;
  String? kondisi;
  int? jumlah;
  String? foto_barang;
  int? nelayan_id;
  String? nama_pemilik;
  String? nomer_telepon_pemilik;
  String? lokasi;

Barang({
this.kode_barang,
required this.nama_barang,
required this.harga,
required this.kondisi,
required this.jumlah,
required this.foto_barang,
required this.nelayan_id,
required this.nama_pemilik,
required this.nomer_telepon_pemilik,
required this.lokasi,
});

 factory Barang.fromJson(Map<String, dynamic> json) {
    return Barang(
      kode_barang: json['kode_barang'] as String,
      nama_barang: json['nama_barang'] as String,
      harga: json['harga'] as String,
      kondisi: json['kondisi'] as String,
      jumlah: json['jumlah'] as int,
      foto_barang: json['foto_barang'] as String,
      nelayan_id: json['nelayan_id'] as int,
      nama_pemilik: json['nama_pemilik'] as String,
      nomer_telepon_pemilik: json['nomer_telepon_pemilik'] as String,
      lokasi: json['lokasi'] as String
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
    data['nama_pemilik'] = nama_pemilik;
    data['nomer_telepon_pemilik'] = nomer_telepon_pemilik;
    data['lokasi'] = lokasi;
    return data;
  }
}

