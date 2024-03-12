import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';

class StudentModalClass {
  String name;
  String email;
  String rollNo;
  String department;
  String working;
  StudentModalClass(
      {required this.name,
      required this.email,
      required this.rollNo,
      required this.department,
      required this.working});
}

List cols = [
  const Color(0xFFFAE8E8),
  const Color(0xffE8EDFA),
  const Color(0xffFAF9E8),
  const Color(0xffFAE8FA),
];

List<StudentModalClass> studentList = [
  StudentModalClass(
    name: 'Shruti Kothari',
    email: 'shruti@gmail.com',
    rollNo: '102456',
    department: 'TAE MCA',
    working: 'Unemployed',
  ),
  StudentModalClass(
    name: 'Shruti Kothari',
    email: 'shruti@gmail.com',
    rollNo: '102456',
    department: 'Computer Science',
    working: 'Unemployed',
  ),
  StudentModalClass(
    name: 'Shruti Kothari',
    email: 'shruti@gmail.com',
    rollNo: '102456',
    department: 'Computer Science',
    working: 'Unemployed',
  ),
];

class StudentData extends StatefulWidget {
  const StudentData({super.key});

  @override
  State<StudentData> createState() => _StudentDataState();
}

class _StudentDataState extends State<StudentData> {
  TextEditingController nameEditingController = TextEditingController();
  TextEditingController emailEditingController = TextEditingController();
  TextEditingController rollNoEditingController = TextEditingController();
  TextEditingController departmentEditingController = TextEditingController();
  TextEditingController workingEditingController = TextEditingController();
  void editCard(StudentModalClass toDoModalObj) {
    setState(() {
      modalbottomsheet(true, toDoModalObj);
      nameEditingController.text = toDoModalObj.name;
      emailEditingController.text = toDoModalObj.email;
      rollNoEditingController.text = toDoModalObj.rollNo;
      workingEditingController.text = toDoModalObj.working;
      departmentEditingController.text = toDoModalObj.department;
    });
  }

  void deleteCard(StudentModalClass toDoModalobj) {
    setState(() {
      studentList.remove(toDoModalobj);
    });
  }

  void submit(bool isEdit, [StudentModalClass? toDoModalobj]) {
    if (nameEditingController.text.trim().isNotEmpty &&
        emailEditingController.text.trim().isNotEmpty &&
        rollNoEditingController.text.trim().isNotEmpty) {
      if (!isEdit) {
        studentList.add(
          StudentModalClass(
            name: nameEditingController.text.trim(),
            email: emailEditingController.text.trim(),
            rollNo: rollNoEditingController.text.trim(),
            department: departmentEditingController.text.trim(),
            working: workingEditingController.text.trim(),
          ),
        );
      } else {
        toDoModalobj!.name = nameEditingController.text.trim();
        toDoModalobj.email = emailEditingController.text.trim();
        toDoModalobj.rollNo = rollNoEditingController.text.trim();
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

  void modalbottomsheet(bool isEdit, [StudentModalClass? toDoModalobj]) {
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
                    controller: rollNoEditingController,
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
                  'Department',
                  style: GoogleFonts.quicksand(
                      fontSize: 11, fontWeight: FontWeight.w400),
                ),
                SizedBox(
                  height: 40,
                  // width: 330,
                  child: TextField(
                    controller: departmentEditingController,
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
                  'Working',
                  style: GoogleFonts.quicksand(
                      fontSize: 11, fontWeight: FontWeight.w400),
                ),
                SizedBox(
                  height: 40,
                  // width: 330,
                  child: TextField(
                    controller: workingEditingController,
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
                        rollNoEditingController.clear();
                        workingEditingController.clear();
                        departmentEditingController.clear();
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
                      studentList[index].name,
                      style: GoogleFonts.quicksand(
                          fontSize: 12, fontWeight: FontWeight.w700),
                    ),
                    RichText(
                      text: TextSpan(children: [
                        TextSpan(
                          text: 'RollNo : ',
                          style: GoogleFonts.quicksand(
                            fontSize: 10,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        TextSpan(
                          text: studentList[index].rollNo,
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
                          text: studentList[index].email,
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
                          text: 'Department : ',
                          style: GoogleFonts.quicksand(
                            fontSize: 10,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        TextSpan(
                          text: studentList[index].department,
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
                          text: 'Working : ',
                          style: GoogleFonts.quicksand(
                            fontSize: 10,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        TextSpan(
                          text: studentList[index].working,
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
                            editCard(studentList[index]);
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
                            deleteCard(studentList[index]);
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
        title: const Text('Student Data'),
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
          itemCount: studentList.length,
          itemBuilder: ((context, index) {
            return myCard(index);
          }),
        ),
      ),
    );
  }
}
