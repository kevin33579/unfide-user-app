part of 'widgets.dart';

class sabtuCard extends StatefulWidget {
  final Sabtu sabtu;

  sabtuCard({required this.sabtu});

  @override
  _sabtuCardState createState() => _sabtuCardState();
}

class _sabtuCardState extends State<sabtuCard> {
  @override
  Widget build(BuildContext context) {
    Sabtu sabtu = widget.sabtu;
    return Card(
      elevation: 1,
      margin: EdgeInsets.all(8),
      child: Container(
        padding: EdgeInsets.all(8),
        child: Column(
          children: [
            ListTile(
              title: Text(
                sabtu.namaPsikolog,
                style: TextStyle(fontSize: 13, fontWeight: FontWeight.normal),
                maxLines: 1,
                softWrap: true,
              ),
              subtitle: Text(
                sabtu.jam,
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
