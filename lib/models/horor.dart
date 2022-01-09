part of 'models.dart';

class Horor extends Equatable{
  final String uid;
  final String dataHoror;
  final String createdAt;
  final String updatedAt;
  final int likes;


  Horor(
      this.uid,
      this.dataHoror,
      this.createdAt,
      this.updatedAt,
      this.likes,
      );

  @override
  List<Object> get props => [
    uid,
    dataHoror,
    createdAt,
    updatedAt,
    likes,
  ];


}