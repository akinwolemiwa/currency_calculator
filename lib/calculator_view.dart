import 'package:currency_converter/widgets/dropdown_widget.dart';
import 'package:currency_converter/services/api.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cupertino_icons/cupertino_icons.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:http/http.dart';

class CalculatorView extends StatefulWidget {
  const CalculatorView({Key? key}) : super(key: key);

  @override
  State<CalculatorView> createState() => _CalculatorViewState();
}

class _CalculatorViewState extends State<CalculatorView> {
  List<String>? currencies;
  String? from;
  String? to;

  late double rate;
  String result = "";

  ApiClient client = ApiClient();

  @override
  void initState() {
    //
    super.initState();
    (() async {
      List<String> list = await client.getCurrencies();
      setState(() {
        currencies = list;
      });
    })();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: Padding(
          padding: const EdgeInsets.only(left: 20),
          child: IconButton(
            icon: const Icon(
              Icons.menu,
              color: Color(0xff00D998),
            ),
            onPressed: () {},
          ),
        ),
        toolbarTextStyle: const TextStyle(
          color: Color(0xff00D998),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 20),
            child: SizedBox(
              child: Align(
                alignment: Alignment.center,
                child: Text(
                  'Sign Up',
                  style: GoogleFonts.dmSans(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              SizedBox(
                height: 86.h,
              ),
              SizedBox(
                width: 413.w,
                child: Text(
                  'Currency',
                  style: GoogleFonts.dmSans(
                    fontSize: 50.sp,
                    fontWeight: FontWeight.w800,
                    color: const Color(0xff0075FF),
                  ),
                ),
              ),
              SizedBox(
                width: 413.w,
                child: Row(
                  children: [
                    Text(
                      'Calculator',
                      style: GoogleFonts.dmSans(
                        fontSize: 50.sp,
                        fontWeight: FontWeight.w800,
                        color: const Color(0xff0075FF),
                      ),
                    ),
                    Text(
                      '.',
                      style: GoogleFonts.dmSans(
                        fontSize: 50.sp,
                        fontWeight: FontWeight.w800,
                        color: const Color(0xff00D998),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 68.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 363.w,
                    decoration: BoxDecoration(
                      color: const Color(0xffFAFAFA),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: TextFormField(
                      keyboardType: TextInputType.number,
                      decoration: const InputDecoration(
                        border: InputBorder.none,
                      ),
                      style: GoogleFonts.dmSans(
                        fontSize: 16.sp,
                        color: const Color(0xff4F4F4F),
                      ),
                    ),
                  ),
                  Container(
                    width: 50.w,
                    decoration: BoxDecoration(
                      color: const Color(0xffFAFAFA),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: const Padding(
                      padding: EdgeInsets.only(right: 10, top: 8, bottom: 8),
                      child: Text(
                        'EUR',
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 21.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 363.w,
                    decoration: BoxDecoration(
                      color: const Color(0xffFAFAFA),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: TextFormField(
                      keyboardType: TextInputType.number,
                      decoration: const InputDecoration(
                        border: InputBorder.none,
                      ),
                      style: GoogleFonts.dmSans(
                        fontSize: 16.sp,
                        color: const Color(0xff4F4F4F),
                      ),
                    ),
                  ),
                  Container(
                    width: 50.w,
                    decoration: BoxDecoration(
                      color: const Color(0xffFAFAFA),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: const Padding(
                      padding: EdgeInsets.only(right: 10, top: 8, bottom: 8),
                      child: Text(
                        'EUR',
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 43.h,
              ),

              Row(
                children: [customDropDown(currencies, from, (val) {})],
              ),

              //////////////DROPDOWN HERE/////////////////////
              SizedBox(
                height: 43.h,
              ),
              Container(
                decoration: const BoxDecoration(
                    color: Color(0xff00D998),
                    borderRadius: BorderRadius.all(
                      Radius.circular(5),
                    )),
                height: 62.h,
                width: 413.w,
                child: Align(
                  alignment: Alignment.center,
                  child: Text(
                    "Convert",
                    style: GoogleFonts.dmSans(
                      color: Colors.white,
                      fontSize: 20.sp,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 29.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Mid-market exchange rate at 13:38 UTC',
                    style: TextStyle(
                      decoration: TextDecoration.underline,
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w400,
                      color: const Color(0xff0075FF),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(left: 5),
                    child: Icon(
                      CupertinoIcons.info,
                      size: 16,
                      color: Color(0xff0075FF),
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
