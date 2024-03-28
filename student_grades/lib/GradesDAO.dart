import 'package:student_grades/Grades.dart';
import 'package:student_grades/VeritabaniYardimcisi.dart';

class GradesDAO {

  Future<List<Grades>> bringAll() async {
    var db = await VeritabaniYardimcisi.veritabaniErisim();

    List<Map<String,dynamic>> maps = await db.rawQuery("SELECT * FROM Grades");

    return List.generate(maps.length, (i) {
      var satir = maps[i];
      return Grades(satir["grade_id"], satir["courseName"], satir["midtermGrade"], satir["Field4"]);
    });
  }

  Future<void> addGrade(String course_name, int midterm_grade, int final_grade) async {
    var db = await VeritabaniYardimcisi.veritabaniErisim();

    var bilgiler = <String,dynamic>{};
    bilgiler["courseName"] = course_name;
    bilgiler["midtermGrade"] = midterm_grade;
    bilgiler["Field4"] = final_grade;

    await db.insert("Grades", bilgiler);
  }

  Future<void> update(int grade_id,String course_name, int midterm_grade, int final_grade) async {
    var db = await VeritabaniYardimcisi.veritabaniErisim();

    var bilgiler = <String,dynamic>{};
    bilgiler["courseName"] = course_name;
    bilgiler["midtermGrade"] = midterm_grade;
    bilgiler["Field4"] = final_grade;

    await db.update("Grades", bilgiler,where: "grade_id=?", whereArgs: [grade_id]);
  }

  Future<void> delete(int grade_id) async {
    var db = await VeritabaniYardimcisi.veritabaniErisim();

    await db.delete("Grades", where: "grade_id=?", whereArgs: [grade_id]);
  }
}