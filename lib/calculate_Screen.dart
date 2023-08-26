import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:flutter/material.dart';

class Calc extends StatefulWidget {
  Calc({Key? key}) : super(key: key);

  @override
  State<Calc> createState() => _CalcState();
}

class _CalcState extends State<Calc> {
  TextStyle txt = const TextStyle(fontSize: 20, color: Colors.white);
  String DD = "00", MM = "00", YYYY = "0000";

  int presentYear = 00;
  int presentMonth = 00;
  int presentDay = 00;

  int nMonth = 0;
  int nDay = 0;

  final datecontroller = TextEditingController();
  final monthcontroller = TextEditingController();
  final yearcontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    DateTime currentDate = DateTime.now();
    String formattedDate = DateFormat('d MMM, y').format(currentDate);

    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text("Today's Date: ",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                        letterSpacing: 1,
                        color: Color(0xff000000),
                      )),
                  const SizedBox(
                    width: 7,
                  ),
                  Text(
                    formattedDate,
                    style: const TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.w400,
                      color: Color(0xff1C003E),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 70,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text("Present Age",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                        letterSpacing: 1,
                        color: Color(0xff000000),
                      )),
                  const SizedBox(
                    height: 7,
                  ),
                  Container(
                    height: h / 6,
                    width: w,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        gradient: const LinearGradient(
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                            colors: [Color(0xff13547A), Color(0xff203A43)])),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("$presentYear", style: txt),
                            Text("Year", style: txt)
                          ],
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("$presentMonth", style: txt),
                            Text("MM", style: txt)
                          ],
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("$presentDay", style: txt),
                            Text("DD", style: txt)
                          ],
                        )
                      ],
                    ),
                  )
                ],
              ),
              const SizedBox(
                height: 60,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text("Date of Birth",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                        letterSpacing: 1,
                        color: Color(0xff000000),
                      )),
                  const SizedBox(
                    height: 7,
                  ),
                  Row(
                    children: [
                      Expanded(
                        flex: 1,
                        child: Container(
                          alignment: Alignment.centerLeft,
                          height: h / 13,
                          width: w / 3,
                          child: Align(
                            child: TextField(
                              inputFormatters: <TextInputFormatter>[
                                FilteringTextInputFormatter.digitsOnly
                              ],
                              keyboardType: TextInputType.number,
                              controller: datecontroller,
                              onChanged: (d) {
                                DD = d;
                              },
                              textAlign: TextAlign.center,
                              decoration: const InputDecoration(
                                hintText: "DD",
                                border: OutlineInputBorder(),
                              ),
                            ),
                          ),
                        ),
                      ),
                      const Padding(padding: EdgeInsets.only(right: 5)),
                      Expanded(
                        flex: 1,
                        child: Container(
                          alignment: Alignment.centerLeft,
                          height: h / 13,
                          width: w / 3,
                          child: Align(
                            child: TextField(
                              inputFormatters: <TextInputFormatter>[
                                FilteringTextInputFormatter.digitsOnly
                              ],
                              keyboardType: TextInputType.number,
                              controller: monthcontroller,
                              onChanged: (m) {
                                MM = m;
                              },
                              textAlign: TextAlign.center,
                              decoration: const InputDecoration(
                                  hintText: "MM", border: OutlineInputBorder()),
                            ),
                          ),
                        ),
                      ),
                      const Padding(padding: EdgeInsets.only(right: 5)),
                      Expanded(
                        flex: 1,
                        child: Container(
                          alignment: Alignment.centerLeft,
                          height: h / 13,
                          width: w / 3,
                          child: Align(
                            child: TextField(
                              keyboardType: TextInputType.number,
                              inputFormatters: <TextInputFormatter>[
                                FilteringTextInputFormatter.digitsOnly
                              ],
                              controller: yearcontroller,
                              onChanged: (y) {
                                YYYY = y;
                              },
                              textAlign: TextAlign.center,
                              decoration: const InputDecoration(
                                  hintText: "YYYY",
                                  border: OutlineInputBorder()),
                            ),
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: InkWell(
                      onTap: () {
                        setState(() {
                          datecontroller.clear();
                          monthcontroller.clear();
                          yearcontroller.clear();
                        });
                      },
                      child: Container(
                        height: h / 16,
                        width: w / 2,
                        decoration: BoxDecoration(
                            border: Border.all(
                                width: 1, color: const Color(0xff13547A)),
                            borderRadius: BorderRadius.circular(8)),
                        child: const Align(
                            child: Text(
                          "Clear",
                          style: TextStyle(
                              fontSize: 25, fontWeight: FontWeight.bold),
                        )),
                      ),
                    ),
                  ),
                  const Padding(padding: EdgeInsets.only(right: 5)),
                  Expanded(
                    flex: 1,
                    child: InkWell(
                      onTap: () {
                        setState(() {
                          presentMonth = currentDate.month - int.parse(MM);
                          presentYear = (currentDate.month < int.parse(MM))
                              ? (currentDate.year - int.parse(YYYY)) - 1
                              : (currentDate.year - int.parse(YYYY));
                          presentDay = 30 - int.parse(DD);

                          nMonth = int.parse(MM) - currentDate.month;
                          nDay = currentDate.day - int.parse(DD);
                        });
                      },
                      child: Container(
                        height: h / 16,
                        width: w / 2,
                        decoration: BoxDecoration(
                            color: const Color(0xff13547A),
                            borderRadius: BorderRadius.circular(8)),
                        child: const Align(
                            child: Text(
                          "Calculate",
                          style: TextStyle(
                            fontSize: 25,
                            color: Colors.white,
                          ),
                        )),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
