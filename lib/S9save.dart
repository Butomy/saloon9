// ignore_for_file: file_names, prefer_const_constructors, camel_case_types

import 'package:flutter/material.dart';

import 'package:dotted_line/dotted_line.dart';

import 'main.dart';

class S9_Save extends StatefulWidget {
  @override
  _S9_SaveState createState() => _S9_SaveState();
}

class _S9_SaveState extends State<S9_Save> with SingleTickerProviderStateMixin {
  bool _hasBeenPressed = false;
  bool hide = false;
  String dropdownValue = 'Cash';
  String dropdownService = 'Add';
  bool isChecked = false;
  Stopwatch? _stopwatch;
  void resetStopWatch() {
    setState(() {
      _stopwatch!.reset();
    });
  }

  void handleStartStop() {
    if (_stopwatch!.isRunning) {
      _stopwatch!.stop();
    } else {
      _stopwatch!.start();
    }
    setState(() {
      hide = !hide;
    }); // re-render the page
  }

  AnimationController? _animationController;
  Animation? _animation;

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _animationController!.dispose();
  }

  @override
  void initState() {
    _stopwatch = Stopwatch();
    _animationController =
        AnimationController(vsync: this, duration: Duration(seconds: 2));
    _animationController!.repeat(reverse: true);
    _animation = Tween(begin: .5, end: 8.0).animate(_animationController!)
      ..addListener(() {
        setState(() {});
      });
    super.initState();
  }

  DateTime dateTime = DateTime.now();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Container(
        decoration: BoxDecoration(border: Border.all(color: Colors.black)),
        height: 55,
        child: Row(
          children: [
            Expanded(
              child: InkWell(
                onTap: () {
                  print('haai aall');
                  setState(() {
                    _hasBeenPressed = !_hasBeenPressed;
                    _showNToast(context);
                  });
                },
                child: Container(
                  color: !_hasBeenPressed ? Color(0xFF095D9F) : Colors.white,
                  child: Center(
                    child: Text(
                      'Save & New',
                      style: TextStyle(
                        fontSize: 20,
                        color: !_hasBeenPressed ? Colors.white : Colors.black,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              child: InkWell(
                onTap: () {
                  _showToast(context);
                  print('haai');
                  setState(() {
                    _hasBeenPressed = !_hasBeenPressed;
                  });
                },
                child: Container(
                  child: Center(
                      child: Text(
                    'Save',
                    style: TextStyle(
                      fontSize: 20,
                      color: _hasBeenPressed ? Colors.white : Colors.black,
                    ),
                  )),
                  color: _hasBeenPressed ? Color(0xFF095D9F) : Colors.white,
                ),
              ),
            )
          ],
        ),
      ),
      backgroundColor: Color(0xFF095D9F),
      drawer: Drawer(
        child: Container(
          //child: Your widget,
          color: Color(0xFF095D9F),
          width: double.infinity,
          height: double.infinity,
        ),
      ),
      appBar: AppBar(
        elevation: 0,
        iconTheme: IconThemeData(size: 35, color: Colors.white),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Stack(
              children: [
                Icon(Icons.notifications_outlined,
                    size: 35, color: Colors.white),
                Positioned(
                  top: 0,
                  right: 0,
                  child: CircleAvatar(
                    radius: 7,
                    backgroundColor: Color(0xFF072cbdd),
                    child: Center(
                        child: Text(
                      '1',
                      style: TextStyle(color: Colors.white, fontSize: 10),
                    )),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            width: 10,
          )
        ],
        backgroundColor: Colors.red
//        Color(0xFF095D9F),
      ),
      body: SafeArea(
        child: ClipRRect(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30),
            topRight: Radius.circular(30),
          ) ,
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
//                topLeft: Radius.circular(35),
//                topRight: Radius.circular(35),
              ),
            ),
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Invoice No: 10'),
                      SizedBox(
                        width: 130,
                      ),
                      Text(
                          'Date : ${dateTime.day}-${dateTime.month}-${dateTime.year}'),
//                          Text('${dateTime.day}-${dateTime.month}-${dateTime.year}'),
                      IconButton(
                          onPressed: () async {
                            DateTime? newDate = await showDatePicker(
                              context: context,
                              initialDate: dateTime,
                              firstDate: DateTime(2020),
                              lastDate: DateTime(2025),
                              builder: (BuildContext context, Widget? child) {
                                return Theme(
                                  data: ThemeData.light().copyWith(
                                    primaryColor: Color(0xFF095D9F),
                                    accentColor: Color(0xFF095D9F),
                                    colorScheme: ColorScheme.light(
                                        primary: Color(0xFF095D9F)),
                                    buttonTheme: ButtonThemeData(
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
                          icon: Icon(Icons.keyboard_arrow_down))
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 15.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                          height: 50,
                          width: 300,
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.black),
                              borderRadius: BorderRadius.circular(15)),
                          child: TextField(
                            decoration: InputDecoration(
                              isDense: true,
                              hintText: 'search customer by Name/Contact',
                              hintStyle: TextStyle(fontSize: 14),
                              contentPadding: EdgeInsets.all(18.0),
                              border: OutlineInputBorder(
                                borderRadius: new BorderRadius.circular(10.0),
                                borderSide: BorderSide.none,
                              ),
                            ),
                            textAlign: TextAlign.start,
                            maxLines: 1,
                          ),
                        ),
                        SizedBox(
                          width: 15,
                        ),
                        Material(
                          color: Colors.white,
                          child: Align(
                              alignment: Alignment.center,
                              child: InkWell(
                                onTap: () {},
                                child: Container(
                                  height: 35,
                                  width: 35,
                                  decoration: BoxDecoration(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(50.0)),
                                    border: Border.all(
                                        color: Colors.black, width: 1.5),
                                  ),
                                  child: CircleAvatar(
                                    backgroundColor: Colors.white,
                                    child: Icon(
                                      Icons.add,
                                      color: Colors.black,
                                      size: 25,
                                    ),
                                  ),
                                ),
                              )),
                        )
                      ],
                    ),
                  ),
//                Container(height: 300,color: Colors.red,),
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Row(
                      children: [
                        Container(
                          height: 60,
                          width: 60,
                          decoration:
                              BoxDecoration(shape: BoxShape.circle, boxShadow: [
                            new BoxShadow(
                              spreadRadius: _animation!.value,
                              color: Colors.lightBlueAccent,
                              blurRadius: _animation!.value,
                            ),
                          ]),
                          child: RawMaterialButton(
                            fillColor: _stopwatch!.isRunning
                                ? Colors.red
                                : Color(0xFF095D9F),
                            shape: CircleBorder(),
                            onPressed: handleStartStop,
                            child: Text(
                              _stopwatch!.isRunning ? 'STOP' : 'START',
                              style: TextStyle(fontSize: 14, color: Colors.white),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 15,
                        ),
                        Text(formatTime(_stopwatch!.elapsedMilliseconds),
                            style: TextStyle(
                                fontSize: 25.0, fontWeight: FontWeight.bold)),
                        SizedBox(
                          width: 20,
                        ),
                        Container(
                          height: 60,
                          width: 60,
                          child: Opacity(
                            opacity: hide ? 0 : 1,
                            child: RawMaterialButton(
                              fillColor: Color(0xFF095D9F),
                              shape: CircleBorder(),
                              child: Text(
                                'RESET',
                                style: TextStyle(color: Colors.white),
                              ),
                              onPressed: resetStopWatch,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 8.0,top: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        buildContainer('Add Service', () {
                          buildShowModalBottomSheet(context);
                        }),
                        buildContainer('Add Product', () {
                          buildShowModalBottomSheet(context);
                        }),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        buildContainer('Add Membership', () {
                          buildShowModalBottomSheet(context);
                        }),
                        buildContainer('Add Package', () {
                          buildShowModalBottomSheet(context);
                        }),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    height: 150,
                    color: Color(0xFF0ececec),
                    width: double.infinity,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Text(
                                'Total Amount',
                                style: TextStyle(fontSize: 17),
                              ),
                              Row(
                                children: [
                                  Checkbox(
                                    activeColor: Color(0xFF095D9F),
                                    value: isChecked,
                                    onChanged: (bool? value) {
                                      setState(() {
                                        isChecked = value!;
                                      });
                                    },
                                  ),
                                  Text(
                                    'Received',
                                    style: TextStyle(fontSize: 17),
                                  ),
                                ],
                              ),
                              Text(
                                'Balance Due',
                                style: TextStyle(
                                    color: Colors.green,
                                    fontSize: 17,
                                    fontWeight: FontWeight.bold),
                              )
                            ],
                          ),
                          Column(
                            children: [
                              TextContainer(),
                              SizedBox(
                                  width: 150,
                                  child: DottedLine(
                                    dashColor: Colors.grey,
                                  )),
                              TextContainer(),
                              SizedBox(
                                  width: 150,
                                  child: DottedLine(
                                    dashColor: Colors.grey,
                                  )),
                              TextContainer(),
                              SizedBox(
                                  width: 150,
                                  child: DottedLine(
                                    dashColor: Colors.grey,
                                  )),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: Container(
                      height: 100,
                      color: Color(0xFF0ececec),
                      width: double.infinity,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 20.0, right: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Text(
                                  'Payment Method',
                                  style: TextStyle(fontSize: 17),
                                ),
                                Text(
                                  'Payment Action',
                                  style: TextStyle(fontSize: 17),
                                )
                              ],
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Container(
                                  height: 30,
                                  width: 150,
                                  decoration: BoxDecoration(
                                      border: Border.all(color: Colors.black),
                                      borderRadius: BorderRadius.circular(10),
                                      color: Colors.white),
                                  child: Padding(
                                    padding: const EdgeInsets.only(
                                        bottom: 4.0, left: 3),
                                    child: DropdownButton<String>(
                                      isExpanded: true,
                                      iconSize: 25,
                                      underline: SizedBox(),
                                      value: dropdownValue,
                                      isDense: true,
                                      icon: const Icon(
                                        Icons.keyboard_arrow_down,
                                      ),
                                      elevation: 16,
                                      alignment: Alignment.center,
                                      style: const TextStyle(color: Colors.black),
                                      onChanged: (String? newValue) {
                                        setState(() {
                                          dropdownValue = newValue!;
                                        });
                                      },
                                      items: <String>[
                                        'Cash',
                                        'Two',
                                        'Freuiigiyge',
                                        'Four'
                                      ].map<DropdownMenuItem<String>>(
                                          (String value) {
                                        return DropdownMenuItem<String>(
                                          value: value,
                                          child: Text(value),
                                        );
                                      }).toList(),
                                    ),
                                  ),
                                ),
                                Container(
                                  child: TextField(
                                    decoration:
                                        InputDecoration(border: InputBorder.none),
                                  ),
                                  height: 30,
                                  width: 150,
                                  decoration: BoxDecoration(
                                      border: Border.all(color: Colors.black),
                                      borderRadius: BorderRadius.circular(10),
                                      color: Colors.white),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      top: 8,
                    ),
                    child: Container(
                      color: Color(0xFF0ececec),
                      child: Padding(
                        padding: const EdgeInsets.only(
                            left: 20.0, right: 10, bottom: 10, top: 15),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text(
                              'Peyment Note',
                              style: TextStyle(fontSize: 17),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Container(
                              child: TextField(
                                keyboardType: TextInputType.multiline,
                                maxLines: null,
                                decoration: InputDecoration(
                                    isDense: true, border: InputBorder.none),
                              ),
                              height: 70,
                              width: double.infinity,
                              decoration: BoxDecoration(
                                  border: Border.all(color: Colors.black),
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(10)),
                            )
                          ],
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Future<dynamic> buildShowModalBottomSheet(BuildContext context) {
    return showModalBottomSheet(
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(25),
          topLeft: Radius.circular(25),
        ),
      ),
      context: context,
      builder: (context) {
        return ListView(
          children: [
            Container(
                child: Padding(
                  padding: const EdgeInsets.only(top: 15.0, left: 30),
                  child: Text(
                    'Add Service',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                ),
                decoration: BoxDecoration(
                    color: Color(0xFF0ececec),
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(25),
                        topRight: Radius.circular(25))),
                height: 50,
                width: double.infinity),
            Padding(
              padding: const EdgeInsets.only(
                top: 20.0,
                left: 20,
                right: 10,
              ),
              child: Column(
                children: [
                  Stack(
                    children: <Widget>[
                      Container(
                        child: DropdownButtonHideUnderline(
                          child: DropdownButton<String>(
                            hint: Text('Select Service'),
                            isExpanded: true,
                            iconSize: 40,
                            underline: SizedBox(),
                            value: dropdownService,
                            isDense: true,
                            icon: Padding(
                              padding: const EdgeInsets.only(bottom: 30.0),
                              child: const Icon(
                                Icons.keyboard_arrow_down,
                              ),
                            ),
                            alignment: Alignment.center,
                            style: const TextStyle(color: Colors.black),
                            onChanged: (String? newValue) {
                              setState(() {
                                dropdownService = newValue!;
                              });
                            },
                            items: <String>[
                              'Add',
                              'Two',
                              'Freuiigiyge',
                            ].map<DropdownMenuItem<String>>((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Padding(
                                  padding:
                                      const EdgeInsets.only(left: 8.0, top: 8),
                                  child: Text(
                                    value,
                                    style: TextStyle(fontSize: 20),
                                  ),
                                ),
                              );
                            }).toList(),
                          ),
                        ),
                        width: double.infinity,
                        height: 45,
                        margin: EdgeInsets.fromLTRB(5, 20, 20, 0),
                        padding: EdgeInsets.only(bottom: 10),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(
                            color: Colors.black,
                          ),
                          borderRadius: BorderRadius.circular(10),
                          shape: BoxShape.rectangle,
                        ),
                      ),
                      Positioned(
                          left: 10,
                          top: 10,
                          child: Container(
                            padding:
                                EdgeInsets.only(bottom: 0, left: 10, right: 10),
                            color: Colors.white,
                            child: Text(
                              'Service',
                              style:
                                  TextStyle(color: Colors.black, fontSize: 14),
                            ),
                          )),
                    ],
                  ),
                  SizedBox(height: 20),
                  Stack(
                    children: <Widget>[
                      Container(
                        child: DropdownButtonHideUnderline(
                          child: DropdownButton<String>(
                            hint: Text('Select Service'),
                            isExpanded: true,
                            iconSize: 40,
                            underline: SizedBox(),
                            value: dropdownService,
                            isDense: true,
                            icon: Padding(
                              padding: const EdgeInsets.only(bottom: 30.0),
                              child: const Icon(
                                Icons.keyboard_arrow_down,
                              ),
                            ),
                            alignment: Alignment.center,
                            style: const TextStyle(color: Colors.black),
                            onChanged: (String? newValue) {
                              setState(() {
                                dropdownService = newValue!;
                              });
                            },
                            items: <String>[
                              'Add',
                              'Two',
                              'Freuiigiyge',
                            ].map<DropdownMenuItem<String>>((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Padding(
                                  padding:
                                      const EdgeInsets.only(left: 8.0, top: 8),
                                  child: Text(
                                    value,
                                    style: TextStyle(fontSize: 20),
                                  ),
                                ),
                              );
                            }).toList(),
                          ),
                        ),
                        width: double.infinity,
                        height: 45,
                        margin: EdgeInsets.fromLTRB(5, 20, 20, 0),
                        padding: EdgeInsets.only(bottom: 10),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(
                            color: Colors.black,
                          ),
                          borderRadius: BorderRadius.circular(10),
                          shape: BoxShape.rectangle,
                        ),
                      ),
                      Positioned(
                          left: 10,
                          top: 10,
                          child: Container(
                            padding:
                                EdgeInsets.only(bottom: 0, left: 10, right: 10),
                            color: Colors.white,
                            child: Text(
                              'Staff',
                              style:
                                  TextStyle(color: Colors.black, fontSize: 14),
                            ),
                          )),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: [
                      Stack(
                        children: [
                          Container(
                            child: TextField(
                              keyboardType: TextInputType.number,
                              decoration:
                                  InputDecoration(border: InputBorder.none),
                            ),
                            width: 160,
                            height: 45,
                            margin: EdgeInsets.fromLTRB(5, 20, 10, 0),
                            padding: EdgeInsets.only(bottom: 10),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              border: Border.all(
                                color: Colors.black,
                              ),
                              borderRadius: BorderRadius.circular(10),
                              shape: BoxShape.rectangle,
                            ),
                          ),
                          Positioned(
                              left: 10,
                              top: 10,
                              child: Container(
                                padding: EdgeInsets.only(
                                    bottom: 0, left: 10, right: 10),
                                color: Colors.white,
                                child: Text(
                                  'Price',
                                  style: TextStyle(
                                      color: Colors.black, fontSize: 14),
                                ),
                              )),
                        ],
                      ),
                      Stack(
                        children: [
                          Container(
                            child: TextField(
                              keyboardType: TextInputType.number,
                              decoration:
                                  InputDecoration(border: InputBorder.none),
                            ),
                            width: 160,
                            height: 45,
                            margin: EdgeInsets.fromLTRB(5, 20, 20, 0),
                            padding: EdgeInsets.only(bottom: 10),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              border: Border.all(
                                color: Colors.black,
                              ),
                              borderRadius: BorderRadius.circular(10),
                              shape: BoxShape.rectangle,
                            ),
                          ),
                          Positioned(
                              left: 10,
                              top: 10,
                              child: Container(
                                padding: EdgeInsets.only(
                                    bottom: 0, left: 10, right: 10),
                                color: Colors.white,
                                child: Text(
                                  'Qty',
                                  style: TextStyle(
                                      color: Colors.black, fontSize: 14),
                                ),
                              )),
                        ],
                      )
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: [
                      Stack(
                        children: [
                          Container(
                            child: TextField(
                              keyboardType: TextInputType.number,
                              decoration:
                                  InputDecoration(border: InputBorder.none),
                            ),
                            width: 260,
                            height: 45,
                            margin: EdgeInsets.fromLTRB(5, 20, 10, 0),
                            padding: EdgeInsets.only(bottom: 10),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              border: Border.all(
                                color: Colors.black,
                              ),
                              borderRadius: BorderRadius.circular(10),
                              shape: BoxShape.rectangle,
                            ),
                          ),
                          Positioned(
                              left: 10,
                              top: 10,
                              child: Container(
                                padding: EdgeInsets.only(
                                    bottom: 0, left: 10, right: 10),
                                color: Colors.white,
                                child: Text(
                                  'Discount',
                                  style: TextStyle(
                                      color: Colors.black, fontSize: 14),
                                ),
                              )),
                        ],
                      ),
                      Container(
                        width: 60,
                        height: 45,
                        margin: EdgeInsets.fromLTRB(5, 20, 20, 0),
                        padding: EdgeInsets.only(bottom: 10),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(
                            color: Colors.black,
                          ),
                          borderRadius: BorderRadius.circular(10),
                          shape: BoxShape.rectangle,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Stack(
                    children: [
                      Container(
                        child: TextField(
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(border: InputBorder.none),
                        ),
                        width: double.infinity,
                        height: 45,
                        margin: EdgeInsets.fromLTRB(5, 20, 10, 0),
                        padding: EdgeInsets.only(bottom: 10),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(
                            color: Colors.black,
                          ),
                          borderRadius: BorderRadius.circular(10),
                          shape: BoxShape.rectangle,
                        ),
                      ),
                      Positioned(
                          left: 10,
                          top: 10,
                          child: Container(
                            padding:
                                EdgeInsets.only(bottom: 0, left: 10, right: 10),
                            color: Colors.white,
                            child: Text(
                              'Total',
                              style:
                                  TextStyle(color: Colors.black, fontSize: 14),
                            ),
                          )),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  )
                ],
              ),
            ),
            Container(
              height: 60,
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(primary: Color(0xFF095D9F)),
                  onPressed: () => Navigator.of(context).pop(),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.add_circle_outline,
                        size: 30,
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Text(
                        'ADD',
                        style: TextStyle(fontSize: 25),
                      )
                    ],
                  )),
            )
          ],
        );
      },
    );
  }

  Container TextContainer() {
    return Container(
      height: 40,
      width: 150,
      child: TextField(
        keyboardType: TextInputType.number,
        decoration: InputDecoration(
            border: InputBorder.none,
            isDense: true,
            enabled: true,
            prefixIcon: Text(
              "₹",
              style: TextStyle(fontSize: 25),
            )),
      ),
    );
  }

  Container buildContainer(String name, var pressFunction) {
    return Container(
      width: 170,
      height: 45,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          primary: Color(0xFF095D9F),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        onPressed: pressFunction,
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(name),
            SizedBox(
              width: 5,
            ),
            Icon(Icons.add_circle_outline)
          ],
        ),
      ),
    );
  }

  void _showToast(BuildContext context) {
    final scaffold = ScaffoldMessenger.of(context);
    scaffold.showSnackBar(
      SnackBar(
        content: const Text('Saved!'),
      ),
    );
  }

  void _showNToast(BuildContext context) {
    final scaffold = ScaffoldMessenger.of(context);
    scaffold.showSnackBar(
      SnackBar(
        content: const Text('Completed!'),
      ),
    );
  }
}
