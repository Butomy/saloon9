import 'package:flutter/material.dart';
import 'package:saloon9_login/S9save.dart';

class HomeS9 extends StatefulWidget {
  @override
  _HomeS9State createState() => _HomeS9State();
}

List apntDetailsString = [
  'New Appointment',
  'Confirmed',
  'New Appointment',
  'Confirmed',
  'New Appointment',
  'Confirmed',
  'New Appointment',
  'Confirmed',
  'New Appointment',
  'Confirmed',
  'New Appointment',
  'Confirmed',
  'New Appointment',
  'Confirmed',
  'New Appointment',
  'Confirmed',
  'New Appointment',
  'Confirmed',
];
List apntDetails = [0, 1, 0, 1, 0, 1, 0, 1, 0, 1, 0, 1, 0, 1, 0, 1, 0, 1];

class _HomeS9State extends State<HomeS9> {
  checkDate(DateTime dateString) {
    //  example, dateString = "2020-01-26";

    DateTime checkedTime = dateString;
    DateTime currentTime = DateTime.now();

    if ((currentTime.year == checkedTime.year) &&
        (currentTime.month == checkedTime.month) &&
        (currentTime.day == checkedTime.day)) {
      return "Today";
    } else if ((currentTime.year == checkedTime.year) &&
        (currentTime.month == checkedTime.month)) {
      if ((currentTime.day - checkedTime.day) == 1) {
        return "Yesterday";
      } else if ((currentTime.day - checkedTime.day) == -1) {
        return "Tomorrow";
      } else {
        return "${dateTime.day}-${dateTime.month}-${dateTime.year}";
      }
    }
  }

  DateTime dateTime = DateTime.now();
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Scaffold(
          backgroundColor: const Color(0xFF095D9F),
          drawer: Drawer(
            child: Container(
              //child: Your widget,
              color: const Color(0xFF095D9F),
              width: double.infinity,
              height: double.infinity,
            ),
          ),
          appBar: AppBar(
            elevation: 0,
            iconTheme: const IconThemeData(size: 35, color: Colors.white),
            actions: [
              Center(
                child: IconButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => S9_Save()),
                    );
                  },
                  icon: Stack(
                    children: [
                      const Icon(Icons.notifications_outlined,
                          size: 35, color: Colors.white),
                      const Positioned(
                        top: 0,
                        right: 0,
                        child: const CircleAvatar(
                          radius: 7,
                          backgroundColor: Color(0xFF072cbdd),
                          child: Center(
                              child: Text(
                            '1',
                            style: const TextStyle(color: Colors.white, fontSize: 10),
                          )),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                width: 10,
              )
            ],
            backgroundColor: const Color(0xFF095D9F),
          ),
          bottomNavigationBar: BottomNavigationBar(currentIndex: 2,
//          selectedItemColor: Colors.red,
            backgroundColor:  const Color(0xFF095D9F),
showSelectedLabels: false,

            items: [
              const BottomNavigationBarItem(label: '',
                  backgroundColor: Color(0xFF095D9F),
                  icon: ImageIcon(
                const AssetImage('images/home.png'),

              )),
              const BottomNavigationBarItem(label: '',
                  backgroundColor: const Color(0xFF095D9F),

                  icon: const ImageIcon(
                    AssetImage('images/user.png'),
                  )),
              const BottomNavigationBarItem(label: '',
                  backgroundColor: Color(0xFF095D9F),

                  icon: ImageIcon(
                    AssetImage('images/add.png'),
                  )),
              const BottomNavigationBarItem(label: '',
                  backgroundColor: const Color(0xFF095D9F),

                  icon: const ImageIcon(
                    AssetImage('images/wallet.png'),
                  )),
              const BottomNavigationBarItem(label: '',
                  backgroundColor: Color(0xFF095D9F),

                  icon: const ImageIcon(
                    AssetImage('images/Path 2722.png'),
                  ))
            ],
          ),
          body: SafeArea(
              child: ClipRRect(
            borderRadius: const BorderRadius.only(
              topRight: Radius.circular(30),
              topLeft: const Radius.circular(30),
            ),
            child: Container(
              decoration: const BoxDecoration(
                color: Color(0xFFF2F9FF),
                borderRadius: const BorderRadius.only(
                  topRight: Radius.circular(30),
                  topLeft: const Radius.circular(30),
                ),
              ),
              child: SingleChildScrollView(
                  child: Column(
                children: [
                  Stack(children: [
                    ClipPath(
                      clipper: CostumeContainer(),
                      child: Container(
                        child: Column(
                          children: [
                            ListTile(
                              horizontalTitleGap: 5,
                              contentPadding: const EdgeInsets.all(20),
                              leading: Container(
                                height: 70,
                                width: 70,
                                decoration: BoxDecoration(
                                    border: Border.all(
                                        width: 4, color: const Color(0xFF095D9F)),
                                    shape: BoxShape.circle,
                                    color: Colors.yellow),
                              ),
                              title: const Text(
                                'Mammootty',
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              subtitle: const Text(
                                'Hair Artist',
                                style: const TextStyle(color: Colors.black),
                              ),
                            ),
                            Container(
                              height: 110,
                              width: 110,
                              child: ElevatedButton(
                                onPressed: () {   Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => S9_Save()),
                                );
//                            Navigator.push(
//                              context,
//                              MaterialPageRoute(builder: (context) => S9_Save()),
//                            );
                                },
                                style: ElevatedButton.styleFrom(
                                  primary: const Color(0xFF095D9F),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(30),
                                  ),
                                ),
                                child: const Text(
                                  '+',
                                  style: const TextStyle(
                                      fontSize: 60, fontWeight: FontWeight.bold),
                                ),
                              ),
                            ),
                          ],
                        ),
                        width: double.infinity,
                        height: 470,
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.only(
                              topLeft: const Radius.circular(30),
                              topRight: Radius.circular(30)),
                          color: Colors.white,
                        ),
                      ),
                    ),
                    Positioned(
                      top: 290,
                      left: 15,
                      child: Row(
                        children: [
                          buildContainer('My Total Jobs', '255'),
                          const SizedBox(
                            width: 20,
                          ),
                          buildContainer('Appointments', '15'),
                        ],
                      ),
                    ),
                    Positioned(
                      top: 420,
                      left: 15,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          const SizedBox(
                            width: 10,
                          ),
                          const Text(
                            'Appointments',
                            style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 17,
                                color: Color(0xFF0515257)),
                          ),
                          const SizedBox(
                            width: 140,
                          ),
                          Text(checkDate(dateTime)),

//                          '${dateTime.day}-${dateTime.month}-${dateTime.year}'),

                          IconButton(
                              onPressed: () async {
                                DateTime? newDate = await showDatePicker(
                                  context: context,
                                  initialDate: dateTime,
                                  firstDate: DateTime(2020),
                                  lastDate: DateTime(2030),
                                  builder: (BuildContext context, Widget? child) {
                                    return Theme(
                                      data: ThemeData.light().copyWith(
                                        primaryColor: const Color(0xFF095D9F),
                                        accentColor: const Color(0xFF095D9F),
                                        colorScheme: const ColorScheme.light(
                                            primary: Color(0xFF095D9F)),
                                        buttonTheme: const ButtonThemeData(
                                            textTheme: ButtonTextTheme.primary),
                                      ),
                                      child: child!,
                                    );
                                  },
                                );
                                if (newDate != null) {
                                  setState(() {
                                    dateTime = newDate;
                                  });
                                }
                              },
                              icon: const Icon(Icons.calendar_today_outlined)),
                        ],
                      ),
                    ),
                  ]),
                  Container(
//                height: height+500,
                    color: const Color(0xFFF2F9FF),
                    child: ListView.builder(
                        shrinkWrap: true,
                        itemCount: 15,
                        physics: const NeverScrollableScrollPhysics(),
                        itemBuilder: (BuildContext context, int index) {
                          return Padding(
                              padding: const EdgeInsets.only(
                                  left: 15.0, bottom: 7.5, right: 15, top: 7.5),
                              child: Container(
                                height: 90,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(15),
                                    color: const Color(0xFFD6E9F9)),
                                child: Padding(
                                  padding: const EdgeInsets.all(12.0),
                                  child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          children: [
                                            Text(
                                              'Tojo Tomas$index',
                                              style: const TextStyle(fontSize: 17),
                                            ),
                                            const Text(
                                              '+91546758215',
                                              style: const TextStyle(fontSize: 17),
                                            ),
                                          ],
                                        ),
                                        Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            const Text('04/02/2022 - 05:46PM'),
                                            Container(
                                              width: 150,
                                              child: ElevatedButton(
                                                  style: ElevatedButton.styleFrom(
                                                    primary:
                                                        apntDetails[index] == 0
                                                            ? const Color(0xFF023d567)
                                                            : const Color(0xFF0d59221),
                                                    shape: RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              5),
                                                    ),
                                                  ),
                                                  onPressed: () {},
                                                  child: Text(
                                                      apntDetailsString[index])),
                                            )
                                          ],
                                        ),
                                      ]),
                                ),
                              ));
                        }),
                  ),

                ],
              )),
            ),
          ))),
    );
  }
}

class CostumeContainer extends CustomClipper<Path> {
  @override
  getClip(Size size) {
    Path path0 = Path();
    path0.moveTo(0, 0);
    path0.lineTo(size.width, 0);
    path0.lineTo(size.width, size.height * 0.4625000);
    path0.quadraticBezierTo(size.width * 0.7150000, size.height * 0.5659375,
        size.width * 0.4100000, size.height * 0.5000000);
    path0.quadraticBezierTo(size.width * 0.1683333, size.height * 0.4496875, 0,
        size.height * 0.5000000);
    path0.lineTo(0, 0);
    path0.close();
    return path0;
  }

  @override
  bool shouldReclip(covariant CustomClipper oldClipper) {
    // TODO: implement shouldReclip
    return true;
  }
}

Container buildContainer(String? title, String? value) {
  return Container(
    height: 125,
    width: 170,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(20),
      color: const Color(0xFF095D9F),
    ),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Text(
          title!,
          style: const TextStyle(color: Colors.white, fontSize: 18),
        ),
        Text(
          value!,
          style: const TextStyle(
              color: Colors.white, fontWeight: FontWeight.bold, fontSize: 28),
        )
      ],
    ),
  );
}
