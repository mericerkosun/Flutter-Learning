import 'package:flutter/material.dart';
import 'package:student_grades/Grades.dart';
import 'package:student_grades/GradesDAO.dart';
import 'package:student_grades/main.dart';

class DetailPage extends StatefulWidget {
  Grades grade;

  DetailPage(this.grade);

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {

  var courseNameTF = TextEditingController();
  var midtermGradeTF = TextEditingController();
  var finalGradeTF = TextEditingController();

  Future<void> delete(int grade_id) async {
    await GradesDAO().delete(grade_id);
    Navigator.push(context, MaterialPageRoute(builder: (context) => MyHomePage()));
  }

  Future<void> update(int grade_id,String course_name, int midterm_grade, int final_grade) async {
    await GradesDAO().update(grade_id, course_name, midterm_grade, final_grade);
    Navigator.push(context, MaterialPageRoute(builder: (context) => MyHomePage()));
  }

  @override
  void initState() {
    super.initState();
    var grade = widget.grade;
    courseNameTF.text = grade.courseName;
    midtermGradeTF.text = grade.midtermGrade.toString();
    finalGradeTF.text = grade.finalGrade.toString();

  }

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
              delete(widget.grade.gradeID);
            },
          ),
          TextButton(
            child: Text("Update"),
            onPressed: (){
              update(widget.grade.gradeID, courseNameTF.text, int.parse(midtermGradeTF.text), int.parse(finalGradeTF.text));
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
                controller: courseNameTF,
                decoration: InputDecoration(
                  hintText: '${widget.grade.courseName}',
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 20.0, left: 20.0),
              child: TextField(
                controller: midtermGradeTF,
                decoration: InputDecoration(
                  hintText: "${widget.grade.midtermGrade}",
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 20.0, left: 20.0),
              child: TextField(
                controller: finalGradeTF,
                decoration: InputDecoration(
                  hintText: "${widget.grade.finalGrade}",
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
