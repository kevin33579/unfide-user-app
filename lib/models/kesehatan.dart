part of 'models.dart';

class Kesehatan extends Equatable{
  final String uid;
  final String dataKesehatan;
  final String createdAt;
  final String updatedAt;
  final int likes;


  Kesehatan(
      this.uid,
      this.dataKesehatan,
      this.createdAt,
      this.updatedAt,
      this.likes,
      );

  @override
  List<Object> get props => [
    uid,
    dataKesehatan,
    createdAt,
    updatedAt,
    likes,
  ];


}