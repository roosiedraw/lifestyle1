import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Services {
  FirebaseFirestore _firestore = FirebaseFirestore.instance;

  //RANDEVU OLUŞTUR
  sendAppointmentData(
    DateTime date,
    String departmentname,
    String docname,
    String hospitalname,
    String saat,
  ) {
    _firestore
        .collection("users")
        .doc(FirebaseAuth.instance.currentUser!.uid.toString())
        .collection("appointment")
        .doc()
        .set({
      "date": date,
      "departmentname": departmentname,
      "docname": docname,
      "hospitalname": hospitalname,
      "time": saat,
      "userid": FirebaseAuth.instance.currentUser!.uid.toString(),
    });
  }

  //TAKİP EKLE
  sendTrackingData(
    String takipadi,
    DateTime takipbaslangic,
    DateTime takipbitis,
    int takipperiyodu,
    List saat,
  ) {
    _firestore
        .collection("users")
        .doc(FirebaseAuth.instance.currentUser!.uid.toString())
        .collection("tracking")
        .doc()
        .set({
      "takipadi": takipadi,
      "takipbaslangic": takipbaslangic,
      "takipbitis": takipbitis,
      "takipperiyodu": takipperiyodu,
      "saat": FieldValue.arrayUnion(saat),
      "userid": FirebaseAuth.instance.currentUser!.uid.toString(),
    });
  }

  //İLAC EKLE
  sendPillsData(
    String ilacadi,
    DateTime ilacbaslangic,
    int toplamilac,
    int ilacperiyodu,
    List saat,
    String ilacturu,
    String doz,
  ) {
    _firestore
        .collection("users")
        .doc(FirebaseAuth.instance.currentUser!.uid.toString())
        .collection("Pills")
        .doc()
        .set({
      "ilacadi": ilacadi,
      "ilacbaslangic": ilacbaslangic,
      "toplamilac": toplamilac,
      "ilacperiyodu": ilacperiyodu,
      "saat": FieldValue.arrayUnion(saat),
      "ilacturu": ilacturu,
      "doz": doz,
      "userid": FirebaseAuth.instance.currentUser!.uid.toString(),
    });
  }

  //ANASAYFA DATA
  anasayfaDataSend(
      String ilacadi,
      DateTime ilacbaslangic,
      int toplamilac,
      int ilacperiyodu,
      List saat,
      String ilacturu,
      String doz,
      List surepill,
      List suretakip,
      String takipadi,
      DateTime takipbaslangic,
      DateTime takipbitis,
      int takipperiyodu,
      List saatTakip,
      bool isPill) {
    _firestore
        .collection("users")
        .doc(FirebaseAuth.instance.currentUser!.uid.toString())
        .collection("anasayfadatas")
        .doc()
        .set({
      "ilacadi": ilacadi,
      "ilacbaslangic": ilacbaslangic,
      "toplamilac": toplamilac,
      "ilacperiyodu": ilacperiyodu,
      "saat": FieldValue.arrayUnion(saat),
      "ilacturu": ilacturu,
      "doz": doz,
      "sure": surepill,
      "suretakip": suretakip,
      "userid": FirebaseAuth.instance.currentUser!.uid.toString(),
      "takipadi": takipadi,
      "takipbaslangic": takipbaslangic,
      "takipbitis": takipbitis,
      "takipperiyodu": takipperiyodu,
      "saattakip": FieldValue.arrayUnion(saatTakip),
      "ispill": isPill
    });
  }

  //DATA GETİR
  dataGetir(String categories, String order) {
    return _firestore
        .collection("users")
        .doc(FirebaseAuth.instance.currentUser!.uid.toString())
        .collection(categories)
        .orderBy(order, descending: true)
        .snapshots();
  }

  //DOSYA SİL
  dosyaSil(String categories, var indexDocId) async {
    return await _firestore.runTransaction((Transaction myTransaction) async {
      await myTransaction.delete(indexDocId);
    });
  }

  gunIlacHesapla(int doz, int saatler, int periyod, int toplamilac,
      DateTime baslangicTarihi) {
    List dates = [];
    int gunlukAlmaSayisi = ((doz * saatler) / periyod).round();
    int kacGun = (toplamilac / gunlukAlmaSayisi).round();
    int lastday = baslangicTarihi.day;

    for (int i = 0; i < kacGun; (i++ / periyod).round()) {
      lastday = lastday + periyod;
      dates.add(lastday);
    }

    return dates;
  }

  gunTakipHesapla(int periyod, DateTime baslangicTarihi, DateTime bitisTarihi) {
    List dates = [];

    int lastday = baslangicTarihi.day;

    for (int i = baslangicTarihi.day; i < bitisTarihi.day; i++) {
      lastday = lastday + periyod;
      dates.add(lastday);
    }

    return dates;
  }
}
