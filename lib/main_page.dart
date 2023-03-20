import 'package:flutter/material.dart';
import 'package:kuis_123200022/detail_page.dart';

import 'about_page.dart';


import 'rental_car.dart';

class MainPage extends StatefulWidget{
  const MainPage({Key? key}) : super(key: key);

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage>{

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Rental Mobil"),
      ),

      body: Container(
        padding: EdgeInsets.all(20),
        child: _createGridCard(),
      ),

    );
  }

  Widget _createGridCard(){
    var dataMenu = rentalCar;

    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
      itemBuilder: (context, index) {
        return _createCard(dataMenu[index], context);
      },
      itemCount: dataMenu.length,
    );
  }

  Widget _createListCard() {
    var dataMenu = rentalCar;

    return ListView.separated(
      itemBuilder: (context, index) {
        return _createCard(dataMenu[index], context);
      },
      itemCount: dataMenu.length,
      separatorBuilder: (context, index) {
        return Container(
          color: Colors.grey,
          height: 1,
          margin: EdgeInsets.symmetric(vertical: 4),
        );
      },
    );
  }

  Widget _createCard(RentalCar data, BuildContext context) {
    return Card(
      child: InkWell(
        onTap: (){
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return DetailPage(id: data.id, brand: data.brand, model: data.model, year: data.year, rentalPricePerDay: data.rentalPricePerDay, available: available, description: data.description, images: data.images)
            ))
        },
        child:
            Column(
              children: [Image.network(data.imageUrls)],
            ),
      ),
    );
  }
}