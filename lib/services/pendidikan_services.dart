part of 'services.dart';

class PendidikanServices {
  static CollectionReference pendidikanCollection =
      FirebaseFirestore.instance.collection("pendidikan");
  static DocumentReference? pendidikanDocument;

  static Reference? ref;
  static UploadTask? uploadTask;

  static Future<bool> addData(Pendidikan Pendidikan) async {
    await Firebase.initializeApp();
    String dateNow = ActivityServices.dateNow();
    int likes = 0;
    pendidikanDocument = await pendidikanCollection.add({
      'pendidikanUid': Pendidikan.uid,
      'PendidikanData': Pendidikan.dataPendidikan,
      'createdAt': dateNow,
      'updatedAt': dateNow,
      'likes': likes,
    });
    if (pendidikanDocument != null) {
      pendidikanCollection.doc(pendidikanDocument!.id).update({});
      return true;
    } else {
      return false;
    }
  }
}
