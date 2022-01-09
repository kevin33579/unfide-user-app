part of 'widgets.dart';

class HororCard extends StatefulWidget {
  final Horor horor;

  HororCard({required this.horor});

  @override
  _HororCardState createState() => _HororCardState();
}

class _HororCardState extends State<HororCard> {
  @override
  Widget build(BuildContext context) {
    Horor horor = widget.horor;
    return Card(
      elevation: 1,
      margin: EdgeInsets.all(8),
      child: Container(
        padding: EdgeInsets.all(8),
        child: Column(
          children: [
            ListTile(
              subtitle: Text(
                horor.dataHoror,
                style: TextStyle(fontSize: 13, fontWeight: FontWeight.normal),
                maxLines: 1,
                softWrap: true,
              ),
            ),
            Row(
              children: [
                IconButton(
                  onPressed:() {

                  },
                  icon: Image.asset('assets/icons/j.png'),
                ),
                Text(''+horor.likes.toString()+' '),
                Text(''+horor.createdAt),
              ],
            ),

          ],
        ),
      ),
    );
  }
}
