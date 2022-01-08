part of 'models.dart';

class Pendidikan extends Equatable{
  final String uid;
  final String dataPendidikan;
  final String createdAt;
  final String updatedAt;
  final int likes;

  Pendidikan(
      this.uid,
      this.dataPendidikan,
      this.createdAt,
      this.updatedAt,
      this.likes,
      );

  @override
  List<Object> get props => [
    uid,
    dataPendidikan,
    createdAt,
    updatedAt,
    likes,
  ];


}