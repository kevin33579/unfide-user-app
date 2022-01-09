part of 'widgets.dart';

class mingguCard extends StatefulWidget {
  final Minggu minggu;

  mingguCard({required this.minggu});

  @override
  _mingguCardState createState() => _mingguCardState();
}

class _mingguCardState extends State<mingguCard> {
  @override
  Widget build(BuildContext context) {
    Minggu minggu = widget.minggu;
    return Card(
      elevation: 1,
      margin: EdgeInsets.all(8),
      child: Container(
        padding: EdgeInsets.all(8),
        child: Column(
          children: [
            ListTile(
              title: Text(
                minggu.namaPsikolog,
                style: TextStyle(fontSize: 13, fontWeight: FontWeight.normal),
                maxLines: 1,
                softWrap: true,
              ),
              subtitle: Text(
                minggu.jam,
                style: TextStyle(fontSize: 13, fontWeight: FontWeight.normal),
                maxLines: 1,
                softWrap: true,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
