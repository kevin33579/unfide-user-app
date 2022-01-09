part of 'services.dart';

class HororServices {
  static CollectionReference HororCollection =
      FirebaseFirestore.instance.collection("horor");
  static DocumentReference? HororDocument;

  static Reference? ref;
  static UploadTask? uploadTask;

  static Future<bool> addData(Horor Horor) async {
    await Firebase.initializeApp();
    String dateNow = ActivityServices.dateNow();
    final int likes = 0;
    HororDocument = await HororCollection.add({
      'HororUid': Horor.uid,
      'HororData': Horor.dataHoror,
      'createdAt': dateNow,
      'updatedAt': dateNow,
      'likes': likes,
    });
    if (HororDocument != null) {
      HororCollection.doc(HororDocument!.id).update({});
      return true;
    } else {
      return false;
    }
  }
}
