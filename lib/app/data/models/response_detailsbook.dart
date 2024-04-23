/// Status : 200
/// Message : "Berhasil Menampilkan Buku"
/// data : {"BukuID":27,"Deskripsi":"Buku ini memberikan pengantar menyeluruh tentang kecerdasan buatan (AI), mulai dari sejarah dan perkembangannya hingga berbagai aplikasinya di dunia nyata","CoverBuku":"http://192.168.1.4:8000/storage/images/coverbook/After Hourse.jpeg","judul_buku":"After Hourse","penulis_buku":"Anisa Ramadani","penerbit_buku":"Athila davin","tahun_terbit":"2024","jumlah_halaman":"214","Rating":4.142857142857143,"Total_ulasan":7,"JumlahRating":29,"JumlahPeminjam":0,"Kategori":["Horor"],"detail_rating":[0.14285714285714285,0,0,0.2857142857142857,0.5714285714285714],"Koleksi":false}

class ResponseDetailsbook {
  ResponseDetailsbook({
      this.status, 
      this.message, 
      this.data,});

  ResponseDetailsbook.fromJson(dynamic json) {
    status = json['Status'];
    message = json['Message'];
    data = json['data'] != null ? DataBookDetails.fromJson(json['data']) : null;
  }
  int? status;
  String? message;
  DataBookDetails? data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['Status'] = status;
    map['Message'] = message;
    if (data != null) {
      map['data'] = data?.toJson();
    }
    return map;
  }

}

/// BukuID : 27
/// Deskripsi : "Buku ini memberikan pengantar menyeluruh tentang kecerdasan buatan (AI), mulai dari sejarah dan perkembangannya hingga berbagai aplikasinya di dunia nyata"
/// CoverBuku : "http://192.168.1.4:8000/storage/images/coverbook/After Hourse.jpeg"
/// judul_buku : "After Hourse"
/// penulis_buku : "Anisa Ramadani"
/// penerbit_buku : "Athila davin"
/// tahun_terbit : "2024"
/// jumlah_halaman : "214"
/// Rating : 4.142857142857143
/// Total_ulasan : 7
/// JumlahRating : 29
/// JumlahPeminjam : 0
/// Kategori : ["Horor"]
/// detail_rating : [0.14285714285714285,0,0,0.2857142857142857,0.5714285714285714]
/// Koleksi : false

class DataBookDetails {
  DataBookDetails({
      this.bukuID, 
      this.deskripsi, 
      this.coverBuku, 
      this.judulBuku, 
      this.penulisBuku, 
      this.penerbitBuku, 
      this.tahunTerbit, 
      this.jumlahHalaman, 
      this.rating, 
      this.totalUlasan, 
      this.jumlahRating, 
      this.jumlahPeminjam, 
      this.kategori, 
      this.detailRating, 
      this.koleksi,});

  DataBookDetails.fromJson(dynamic json) {
    bukuID = json['BukuID'];
    deskripsi = json['Deskripsi'];
    coverBuku = json['CoverBuku'];
    judulBuku = json['judul_buku'];
    penulisBuku = json['penulis_buku'];
    penerbitBuku = json['penerbit_buku'];
    tahunTerbit = json['tahun_terbit'];
    jumlahHalaman = json['jumlah_halaman'];
    rating = json['Rating'].toDouble();
    totalUlasan = json['Total_ulasan'];
    jumlahRating = json['JumlahRating'];
    jumlahPeminjam = json['JumlahPeminjam'];
    kategori = json['Kategori'] != null ? json['Kategori'].cast<String>() : [];
    detailRating = json['detail_rating'] != null ? List<double>.from(json['detail_rating'].map((x) => x.toDouble())) : [];
    koleksi = json['Koleksi'];
  }
  int? bukuID;
  String? deskripsi;
  String? coverBuku;
  String? judulBuku;
  String? penulisBuku;
  String? penerbitBuku;
  String? tahunTerbit;
  String? jumlahHalaman;
  double? rating;
  int? totalUlasan;
  int? jumlahRating;
  int? jumlahPeminjam;
  List<String>? kategori;
  List<double>? detailRating;
  bool? koleksi;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['BukuID'] = bukuID;
    map['Deskripsi'] = deskripsi;
    map['CoverBuku'] = coverBuku;
    map['judul_buku'] = judulBuku;
    map['penulis_buku'] = penulisBuku;
    map['penerbit_buku'] = penerbitBuku;
    map['tahun_terbit'] = tahunTerbit;
    map['jumlah_halaman'] = jumlahHalaman;
    map['Rating'] = rating;
    map['Total_ulasan'] = totalUlasan;
    map['JumlahRating'] = jumlahRating;
    map['JumlahPeminjam'] = jumlahPeminjam;
    map['Kategori'] = kategori;
    map['detail_rating'] = detailRating;
    map['Koleksi'] = koleksi;
    return map;
  }

}