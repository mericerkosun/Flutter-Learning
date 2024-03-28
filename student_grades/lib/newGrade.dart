import 'package:flutter/material.dart';
import 'package:student_grades/GradesDAO.dart';
import 'package:student_grades/main.dart';

class NewGrade extends StatefulWidget {
  const NewGrade({super.key});

  @override
  State<NewGrade> createState() => _NewGradeState();
}

class _NewGradeState extends State<NewGrade> {

  var courseNameTF = TextEditingController();
  var midtermGradeTF = TextEditingController();
  var finalGradeTF = TextEditingController();

  Future<void> newRecord(String course_name, int midterm_grade, int final_grade) async {
    await GradesDAO().addGrade(course_name, midterm_grade, final_grade);
    Navigator.push(context, MaterialPageRoute(builder: (context) => MyHomePage()));
  }

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
                controller: midtermGradeTF,
                decoration: InputDecoration(
                  labelText: "Midterm Grade",
                ),
              ),
            ),
            SizedBox(
              width: 250,
              child: TextField(
                controller: finalGradeTF,
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
          newRecord(courseNameTF.text, int.parse(midtermGradeTF.text), int.parse(finalGradeTF.text));
        },
      ),
    );
  }
}
