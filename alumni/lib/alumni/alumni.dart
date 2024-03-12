import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../student/student.dart';

class TeacherModalClass {
  String name;
  String email;
  String contactNo;
  String subject;
  TeacherModalClass({
    required this.name,
    required this.email,
    required this.contactNo,
    required this.subject,
  });
}

List<TeacherModalClass> teacherList = [
  TeacherModalClass(
      name: 'Prashik Wankhade',
      email: ' prashik@gmail.com',
      contactNo: '8626045643',
      subject: 'GK')
];

class AlumniData extends StatefulWidget {
  const AlumniData({super.key});

  @override
  State<AlumniData> createState() => _AlumniDataState();
}

class _AlumniDataState extends State<AlumniData> {
  TextEditingController nameEditingController = TextEditingController();
  TextEditingController emailEditingController = TextEditingController();
  TextEditingController cotactEditingController = TextEditingController();
  TextEditingController subjectEditingController = TextEditingController();

  void editCard(TeacherModalClass toDoModalObj) {
    setState(() {
      modalbottomsheet(true, toDoModalObj);
      nameEditingController.text = toDoModalObj.name;
      emailEditingController.text = toDoModalObj.email;
      cotactEditingController.text = toDoModalObj.contactNo;
      subjectEditingController.text = toDoModalObj.subject;
    });
  }

  void deleteCard(TeacherModalClass toDoModalobj) {
    setState(() {
      teacherList.remove(toDoModalobj);
    });
  }

  void submit(bool isEdit, [TeacherModalClass? toDoModalobj]) {
    if (nameEditingController.text.trim().isNotEmpty &&
        emailEditingController.text.trim().isNotEmpty &&
        cotactEditingController.text.trim().isNotEmpty) {
      if (!isEdit) {
        teacherList.add(
          TeacherModalClass(
            name: nameEditingController.text.trim(),
            email: emailEditingController.text.trim(),
            contactNo: cotactEditingController.text.trim(),
            subject: subjectEditingController.text.trim(),
          ),
        );
      } else {
        toDoModalobj!.name = nameEditingController.text.trim();
        toDoModalobj.email = emailEditingController.text.trim();
        toDoModalobj.contactNo = cotactEditingController.text.trim();

        toDoModalobj.subject = subjectEditingController.text.trim();
      }
    } else {
      final snackBar = SnackBar(
        content: Text(
          'None of the fields can be empty !',
          style:
              GoogleFonts.quicksand(fontSize: 12, fontWeight: FontWeight.w600),
        ),
      );

      // Find the ScaffoldMessenger in the widget tree
      // and use it to show a SnackBar.
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }
  }

  void modalbottomsheet(bool isEdit, [TeacherModalClass? toDoModalobj]) {
    showModalBottomSheet<void>(
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(20),
        ),
      ),
      context: context,
      builder: (BuildContext context) {
        return Padding(
          padding: MediaQuery.of(context).viewInsets,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 15),
                  child: Center(
                    child: Text(
                      'Create Task',
                      style: GoogleFonts.quicksand(
                          fontSize: 22, fontWeight: FontWeight.w600),
                    ),
                  ),
                ),
                Text(
                  'Name',
                  style: GoogleFonts.quicksand(
                      fontSize: 11, fontWeight: FontWeight.w400),
                ),
                SizedBox(
                  height: 40,
                  // width: 330,
                  child: TextField(
                    controller: nameEditingController,
                    style: GoogleFonts.quicksand(
                        fontSize: 12, fontWeight: FontWeight.w500),
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5),
                        borderSide: const BorderSide(
                          width: 0.5,
                          color: Color(0xFF008B94),
                        ),
                      ),
                      hintText: 'Please Enter Title ',
                      hintStyle: GoogleFonts.quicksand(
                          fontSize: 12, fontWeight: FontWeight.w500),
                    ),
                  ),
                ),
                Text(
                  'Email',
                  style: GoogleFonts.quicksand(
                      fontSize: 11, fontWeight: FontWeight.w400),
                ),
                SizedBox(
                  // width: 330,
                  child: TextField(
                    controller: emailEditingController,
                    style: GoogleFonts.quicksand(
                        fontSize: 12, fontWeight: FontWeight.w500),
                    // maxLines: 3,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5),
                        borderSide: const BorderSide(
                          width: 0.5,
                          color: Color(0xFF008B94),
                        ),
                      ),
                      hintText: 'Enter the Description',
                      hintStyle: GoogleFonts.quicksand(
                          fontSize: 12, fontWeight: FontWeight.w500),
                    ),
                  ),
                ),
                Text(
                  'RollNo',
                  style: GoogleFonts.quicksand(
                      fontSize: 11, fontWeight: FontWeight.w400),
                ),
                SizedBox(
                  height: 40,
                  // width: 330,
                  child: TextField(
                    controller: cotactEditingController,
                    style: GoogleFonts.quicksand(
                        fontSize: 12, fontWeight: FontWeight.w500),
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5),
                        borderSide: const BorderSide(
                          width: 0.5,
                          color: Color(0xFF008B94),
                        ),
                      ),
                      hintText: 'Please Enter Title ',
                      hintStyle: GoogleFonts.quicksand(
                          fontSize: 12, fontWeight: FontWeight.w500),
                    ),
                  ),
                ),
                Text(
                  'subject',
                  style: GoogleFonts.quicksand(
                      fontSize: 11, fontWeight: FontWeight.w400),
                ),
                SizedBox(
                  height: 40,
                  // width: 330,
                  child: TextField(
                    controller: subjectEditingController,
                    style: GoogleFonts.quicksand(
                        fontSize: 12, fontWeight: FontWeight.w500),
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5),
                        borderSide: const BorderSide(
                          width: 0.5,
                          color: Color(0xFF008B94),
                        ),
                      ),
                      hintText: 'Please Enter Title ',
                      hintStyle: GoogleFonts.quicksand(
                          fontSize: 12, fontWeight: FontWeight.w500),
                    ),
                  ),
                ),
                Text(
                  '',
                  style: GoogleFonts.quicksand(
                      fontSize: 11, fontWeight: FontWeight.w400),
                ),
                Center(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ElevatedButton(
                      onPressed: () {
                        setState(() {
                          if (isEdit) {
                            submit(isEdit, toDoModalobj);
                          } else {
                            submit(isEdit);
                          }
                        });

                        Navigator.of(context).pop();
                        nameEditingController.clear();
                        emailEditingController.clear();
                        cotactEditingController.clear();
                        subjectEditingController.clear();
                      },
                      style: ElevatedButton.styleFrom(
                          fixedSize: const Size(300, 50),
                          backgroundColor:
                              const Color.fromARGB(255, 0, 139, 148),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10))),
                      child: Text(
                        'Submit',
                        style: GoogleFonts.quicksand(
                          fontSize: 20,
                          fontWeight: FontWeight.w700,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }

  Padding myCard(int index) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
          color: cols[index % cols.length],
          borderRadius: BorderRadius.circular(10),
          boxShadow: const [
            BoxShadow(
              color: Color.fromRGBO(0, 0, 0, 0.1),
              blurRadius: 10,
              spreadRadius: 1,
              offset: Offset(0, 10),
            )
          ],
        ),
        width: double.infinity,
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.all(15),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Center(
                    child: Padding(
                      padding: const EdgeInsets.only(bottom: 8),
                      child: Container(
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.white,
                        ),
                        height: 40,
                        width: 40,
                        child: Image.asset('assets/img.png'),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      teacherList[index].name,
                      style: GoogleFonts.quicksand(
                          fontSize: 12, fontWeight: FontWeight.w700),
                    ),
                    RichText(
                      text: TextSpan(children: [
                        TextSpan(
                          text: 'Contact No : ',
                          style: GoogleFonts.quicksand(
                            fontSize: 10,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        TextSpan(
                          text: teacherList[index].contactNo,
                          style: GoogleFonts.quicksand(
                            fontSize: 10,
                            fontWeight: FontWeight.w500,
                          ),
                        )
                      ]),
                    ),
                    RichText(
                      text: TextSpan(children: [
                        TextSpan(
                          text: 'email : ',
                          style: GoogleFonts.quicksand(
                            fontSize: 10,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        TextSpan(
                          text: teacherList[index].email,
                          style: GoogleFonts.quicksand(
                            fontSize: 10,
                            fontWeight: FontWeight.w500,
                          ),
                        )
                      ]),
                    ),
                    RichText(
                      text: TextSpan(children: [
                        TextSpan(
                          text: 'subject : ',
                          style: GoogleFonts.quicksand(
                            fontSize: 10,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        TextSpan(
                          text: teacherList[index].subject,
                          style: GoogleFonts.quicksand(
                            fontSize: 10,
                            fontWeight: FontWeight.w500,
                          ),
                        )
                      ]),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        GestureDetector(
                          onTap: () {
                            editCard(teacherList[index]);
                          },
                          child: const Icon(
                            Icons.edit,
                            size: 15,
                            color: Color(0xff008B94),
                          ),
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        GestureDetector(
                          onTap: () {
                            deleteCard(teacherList[index]);
                          },
                          child: const Icon(
                            Icons.delete_outline_outlined,
                            size: 15,
                            color: Color(0xff008B94),
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Teachers Data'),
        leading: IconButton(
          onPressed: () {
            setState(() {
              Navigator.pop(context);
            });
          },
          icon: const Icon(Icons.arrow_back),
        ),
        centerTitle: true,
        actions: [
          Image.asset(
            'assets/clg_logo.png',
            fit: BoxFit.contain,
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          modalbottomsheet(false);
        },
        backgroundColor: const Color(0xff02A7B1),
        foregroundColor: const Color(0xffFFFFFF),
        child: const Icon(
          Icons.add,
        ),
      ),
      body: Container(
        margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
        child: ListView.builder(
          itemCount: teacherList.length,
          itemBuilder: ((context, index) {
            return myCard(index);
          }),
        ),
      ),
    );
  }
}
