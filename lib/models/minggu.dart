part of 'models.dart';

class Minggu extends Equatable {
  String uid;
  String namaPsikolog;
  String jam;

  Minggu(this.uid, this.namaPsikolog, this.jam);

  @override
  List<Object?> get props => [
    uid,
    namaPsikolog,
    jam,
  ];
}
