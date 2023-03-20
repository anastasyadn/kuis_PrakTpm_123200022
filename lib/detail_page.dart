import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';


class DetailPage extends StatefulWidget {
  final String id;
  final String brand;
  final String model;
  final String year;
  final String rentalPricePerDay;
  final String available;
  final String description;
  final String images;
  
  const DetailPage({
    Key? key,
    required this.id,
    required this.brand,
    required this.model,
    required this.year,
    required this.rentalPricePerDay,
    required this.available,
    required this.description,
    required this.images,
    
  }) : super(key: key);

  @override
  _DetailPageState createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.rentalPricePerDay),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.share),
            
            onPressed: () async {
                var url = widget.carurl;
                if (await canLaunch(url)) {
                  await launch(url);
                } else {
                  throw 'Could not launch $url';
                }
            }
          ),
        ],
      ),
      body: Container(
        padding: EdgeInsets.all(20),
        child: _createListCard(),
      ),
    );
  }

  Widget _createListCard() {
    var dataCar = widget.id;

    return ListView.separated(
      itemBuilder: (context, index) {
        return _createCard(dataSongs[index], context);
      },
      itemCount: dataSongs.length,
      separatorBuilder: (context, index) {
        return Container(
          color: Colors.grey,
          height: 1,
          margin: EdgeInsets.symmetric(vertical: 4),
        );
      },
    );
  }

  Widget _createCard(String song, BuildContext context) {
    return Card(
      child: InkWell(
        onTap: (){},
        child: Row(
          children: [
            Expanded(
              flex: 3,
              child: Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 10,
                  ),
                  child: Text(
                    song, style: TextStyle(fontWeight: FontWeight.bold ,fontSize: 15),)),
            ),
          ],
        ),
      ),
    );
  }
}
