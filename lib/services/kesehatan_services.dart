part of 'services.dart';

class KesehatanServices {
  static CollectionReference KesehatanCollection =
      FirebaseFirestore.instance.collection("kesehatan");
  static DocumentReference? KesehatanDocument;

  static Reference? ref;
  static UploadTask? uploadTask;

  static Future<bool> addData(Kesehatan Kesehatan) async {
    await Firebase.initializeApp();
    String dateNow = ActivityServices.dateNow();
    final int likes = 0;
    KesehatanDocument = await KesehatanCollection.add({
      'KesehatanUid': Kesehatan.uid,
      'KesehatanData': Kesehatan.dataKesehatan,
      'createdAt': dateNow,
      'updatedAt': dateNow,
      'likes': likes,
    });
    if (KesehatanDocument != null) {
      KesehatanCollection.doc(KesehatanDocument!.id).update({});
      return true;
    } else {
      return false;
    }
  }
}
