part of 'models.dart';

class Jumat extends Equatable {
  String uid;
  String namaPsikolog;
  String jam;

  Jumat(this.uid, this.namaPsikolog, this.jam);

  @override
  List<Object?> get props => [
    uid,
    namaPsikolog,
    jam,
  ];
}
