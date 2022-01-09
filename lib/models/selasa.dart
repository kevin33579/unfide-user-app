part of 'models.dart';

class Selasa extends Equatable {
  String uid;
  String namaPsikolog;
  String jam;

  Selasa(this.uid, this.namaPsikolog, this.jam);

  @override
  List<Object?> get props => [
    uid,
    namaPsikolog,
    jam,
  ];
}
