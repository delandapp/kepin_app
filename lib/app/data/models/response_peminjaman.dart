/// Status : 200
/// Message : "Buku Masih Di Pinjam"
/// DataPinjam : {"PeminjamanID":9,"kode_peminjaman":"2024ZLN162","status":"Dipinjam","tanggal_pinjam":"2024-04-16","tanggal_kembali":"Belum dikembalikan","Deadline":"2024-04-23"}

class ResponsePeminjaman {
  ResponsePeminjaman({
      this.status, 
      this.message, 
      this.data,});

  ResponsePeminjaman.fromJson(dynamic json) {
    status = json['Status'];
    message = json['Message'];
    data = json['DataPinjam'] != null ? DataPinjam.fromJson(json['DataPinjam']) : null;
  }
  int? status;
  String? message;
  DataPinjam? data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['Status'] = status;
    map['Message'] = message;
    if (data != null) {
      map['DataPinjam'] = data?.toJson();
    }
    return map;
  }

}

/// PeminjamanID : 9
/// kode_peminjaman : "2024ZLN162"
/// status : "Dipinjam"
/// tanggal_pinjam : "2024-04-16"
/// tanggal_kembali : "Belum dikembalikan"
/// Deadline : "2024-04-23"

class DataPinjam {
  DataPinjam({
      this.peminjamanID, 
      this.kodePeminjaman, 
      this.status, 
      this.tanggalPinjam, 
      this.tanggalKembali, 
      this.deadline,});

  DataPinjam.fromJson(dynamic json) {
    peminjamanID = json['PeminjamanID'];
    kodePeminjaman = json['kode_peminjaman'];
    status = json['status'];
    tanggalPinjam = json['tanggal_pinjam'];
    tanggalKembali = json['tanggal_kembali'];
    deadline = json['Deadline'];
  }
  int? peminjamanID;
  String? kodePeminjaman;
  String? status;
  String? tanggalPinjam;
  String? tanggalKembali;
  String? deadline;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['PeminjamanID'] = peminjamanID;
    map['kode_peminjaman'] = kodePeminjaman;
    map['status'] = status;
    map['tanggal_pinjam'] = tanggalPinjam;
    map['tanggal_kembali'] = tanggalKembali;
    map['Deadline'] = deadline;
    return map;
  }

}