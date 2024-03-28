import 'package:flutter/material.dart';

class NewGrade extends StatefulWidget {
  const NewGrade({super.key});

  @override
  State<NewGrade> createState() => _NewGradeState();
}

class _NewGradeState extends State<NewGrade> {

  TextEditingController courseNameTF = TextEditingController();
  TextEditingController midtermGradeTF = TextEditingController();
  TextEditingController finalGradeTF = TextEditingController();
  String newCourseName = "";
  String newMidtermGrade = "";
  String newFinalGrade = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("New Grade"),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            SizedBox(
              width: 250,
                child: TextField(
                  onChanged: (text){
                    print("$text");
                  },
                  controller: courseNameTF,
                  decoration: InputDecoration(
                    labelText: "Course Name",
                  ),
                ),
            ),
            SizedBox(
              width: 250,
              child: TextField(
                decoration: InputDecoration(
                  labelText: "Midterm Grade",
                ),
              ),
            ),
            SizedBox(
              width: 250,
              child: TextField(
                decoration: InputDecoration(
                  labelText: "Final Grade",
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        label: Text("Save"),
        icon: Icon(Icons.save),
        onPressed: (){
          setState(() {
            newCourseName = courseNameTF.text;
            newMidtermGrade = midtermGradeTF.text;
            newFinalGrade = finalGradeTF.text;
          });
          print("New Record.");
        },
      ),
    );
  }
}
