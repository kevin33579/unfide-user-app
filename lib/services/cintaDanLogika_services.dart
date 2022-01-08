part of 'services.dart';

class CintaDanLogikaServices {
  static CollectionReference CintaDanLogikaCollection =
      FirebaseFirestore.instance.collection("cintadanlogika");
  static DocumentReference? CintaDanLogikaDocument;

  static Reference? ref;
  static UploadTask? uploadTask;

  static Future<bool> addData(CintaDanLogika CintaDanLogika) async {
    await Firebase.initializeApp();
    String dateNow = ActivityServices.dateNow();
    final int likes = 0;
    CintaDanLogikaDocument = await CintaDanLogikaCollection.add({
      'CdlUid': CintaDanLogika.uid,
      'CdlData': CintaDanLogika.dataCintaDanLogika,
      'createdAt': dateNow,
      'updatedAt': dateNow,
      'likes': likes,
    });
    if (CintaDanLogikaDocument != null) {
      CintaDanLogikaCollection.doc(CintaDanLogikaDocument!.id).update({});
      return true;
    } else {
      return false;
    }
  }
}
