import 'package:flutter/material.dart';

class DetailPage extends StatefulWidget {
  String detailName;
  double detailMidterm;
  double detailFinal;

  DetailPage(this.detailName, this.detailMidterm, this.detailFinal);

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text("Course Details"),
        actions: [
          TextButton(
            child: Text("Delete"),
            onPressed: (){

            },
          ),
          TextButton(
            child: Text("Update"),
            onPressed: (){

            },
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Padding(
              padding: const EdgeInsets.only(right: 20.0, left: 20.0),
              child: TextField(
                decoration: InputDecoration(
                  labelText: 'Course Name : ${widget.detailName}',
                  hintText: '${widget.detailName}',
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 20.0, left: 20.0),
              child: TextField(
                decoration: InputDecoration(
                  labelText: 'Midterm : ${widget.detailMidterm}',
                  hintText: "${widget.detailMidterm}",
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 20.0, left: 20.0),
              child: TextField(
                decoration: InputDecoration(
                  labelText: 'Final : ${widget.detailFinal}',
                  hintText: "${widget.detailFinal}",
                  border: OutlineInputBorder(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
