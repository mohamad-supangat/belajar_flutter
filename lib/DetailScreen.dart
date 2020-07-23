import 'package:flutter/material.dart';
import 'model/turism_place.dart';

class FavoriteButton extends StatefulWidget {
  @override
  _FavoriteButtonState createState() => _FavoriteButtonState();
}

class _FavoriteButtonState extends State<FavoriteButton> {
  bool isFavorite = false;

  @override
  Widget build(BuildContext context) {
    return IconButton(
        icon: Icon(isFavorite ? Icons.favorite : Icons.favorite_border),
        color: Colors.red,
        onPressed: () {
          setState(() {
            isFavorite = !isFavorite;
          });
        });
  }
}

class DetailScreen extends StatelessWidget {
  final TourismPlace place;

  DetailScreen({@required this.place});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Stack(children: <Widget>[
            Image.asset(place.imageAsset),
            SafeArea(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  IconButton(
                    icon: Icon(Icons.arrow_back),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                  FavoriteButton()
                ],
              ),
            )
          ]),
          Container(
              margin: EdgeInsets.only(top: 16.0),
              child: Text(
                place.name,
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 30.0, fontWeight: FontWeight.bold),
              )),
          Container(
            margin: EdgeInsets.symmetric(vertical: 16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(children: [
                  Icon(Icons.calendar_today),
                  SizedBox(height: 10),
                  Text(place.openDays)
                ]),
                Column(children: [
                  Icon(Icons.access_time),
                  SizedBox(height: 10),
                  Text(place.openTime)
                ]),
                Column(children: [
                  Icon(Icons.attach_money),
                  SizedBox(height: 10),
                  Text(place.ticketPrice)
                ])
              ],
            ),
          ),
          Container(
              padding: EdgeInsets.all(20),
              child: Text(
                place.description,
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 16),
              )),
          Container(
            height: 150,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: place.imageUrls.map((img) {
                return Padding(
                  padding: EdgeInsets.all(10),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(5),
                    child: Image.network(img),
                  ),
                );
              }).toList(),
            ),
          )
        ],
      )),
    );
  }
}
