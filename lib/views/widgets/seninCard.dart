part of 'widgets.dart';

class seninCard extends StatefulWidget {
  final Senin senin;

  seninCard({required this.senin});

  @override
  _seninCardState createState() => _seninCardState();
}

class _seninCardState extends State<seninCard> {
  @override
  Widget build(BuildContext context) {
    Senin senin = widget.senin;
    return Card(
      elevation: 1,
      margin: EdgeInsets.all(8),
      child: Container(
        padding: EdgeInsets.all(8),
        child: Column(
          children: [
            ListTile(
              title: Text(
                senin.namaPsikolog,
                style: TextStyle(fontSize: 13, fontWeight: FontWeight.normal),
                maxLines: 1,
                softWrap: true,
              ),
              subtitle: Text(
                senin.jam,
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
