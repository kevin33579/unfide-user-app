part of 'widgets.dart';

class kamisCard extends StatefulWidget {
  final Kamis kamis;

  kamisCard({required this.kamis});

  @override
  _kamisCardState createState() => _kamisCardState();
}

class _kamisCardState extends State<kamisCard> {
  @override
  Widget build(BuildContext context) {
    Kamis kamis = widget.kamis;
    return Card(
      elevation: 1,
      margin: EdgeInsets.all(8),
      child: Container(
        padding: EdgeInsets.all(8),
        child: Column(
          children: [
            ListTile(
              title: Text(
                kamis.namaPsikolog,
                style: TextStyle(fontSize: 13, fontWeight: FontWeight.normal),
                maxLines: 1,
                softWrap: true,
              ),
              subtitle: Text(
                kamis.jam,
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
