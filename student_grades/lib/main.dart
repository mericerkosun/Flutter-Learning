import 'package:flutter/material.dart';
import 'package:student_grades/Grades.dart';
import 'package:student_grades/GradesDAO.dart';
import 'package:student_grades/detailPage.dart';
import 'package:student_grades/newGrade.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.indigoAccent),
        useMaterial3: true,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  Future<List<Grades>> verileriGetir() async {
    var listGrades = await GradesDAO().bringAll();
    return listGrades;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Column(
          children: [
            Text("Grades App"),
            FutureBuilder(
                future: verileriGetir(),
                builder: (context,snapshot){
                  if(snapshot.hasData){
                    var grades = snapshot.data;
                    double overall = 0.0;

                    if(grades!.isNotEmpty){
                      double total = 0.0;
                      for(var n in grades){
                        total = total + (n.midtermGrade + n.finalGrade)/2;
                      }
                      overall = total / grades.length;
                    }
                    return Text("Overall : $overall", style: TextStyle(fontSize: 10),);
                  }else{
                    return Column();
                  }
                }
            )
          ],
        ),
      ),
      body: FutureBuilder<List<Grades>> (
        future: verileriGetir(),
        builder: (context,snapshot){
          if(snapshot.hasData){
            var listGrade = snapshot.data;
            return ListView.builder(
              itemCount: listGrade!.length,
              itemBuilder: (context, i){
                var grade = listGrade[i];
                return GestureDetector(
                  onTap: (){
                    print("${grade.courseName} Tıklandı.");
                    Navigator.push(context, MaterialPageRoute(builder: (context) => DetailPage(grade)));
                  },
                  child: SizedBox(
                    height: 70,
                    child: Card(
                      child: SizedBox(
                        height: 50,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              SizedBox(
                                width: 100,
                                  child: Text(grade.courseName)),
                              Text(grade.midtermGrade.toString()),
                              Text(grade.finalGrade.toString()),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                );
              },
            );
          }else{
            return Center();
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: (){
          print("FAB Tıklandı.");
          Navigator.push(context, MaterialPageRoute(builder: (context) => NewGrade()));
        },
      ),
    );
  }
}
