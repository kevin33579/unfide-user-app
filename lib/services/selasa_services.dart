part of 'services.dart';

class SelasaServices {
  static FirebaseAuth auth = FirebaseAuth.instance;
  static CollectionReference selasaCollection =
  FirebaseFirestore.instance.collection("selasa");
  static DocumentReference? selasaDocument;

  static Reference? ref;
  static UploadTask? uploadTask;

  static Future<bool> addData(String nama, String jam) async {
    String uid = auth.currentUser!.uid;
    await Firebase.initializeApp();
    selasaDocument = await selasaCollection.add({
      'selasaUid': uid,
      'selasaNama': nama,
      'selasaJam': jam,
    });
    if (selasaDocument != null) {
      selasaCollection.doc(selasaDocument!.id).update({});
      return true;
    } else {
      return false;
    }
  }
}
