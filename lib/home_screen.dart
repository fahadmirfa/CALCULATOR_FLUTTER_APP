
import 'package:calculator/utile/colors.dart';
import 'package:calculator/utile/dimention.dart';
import 'package:calculator/widgets/button.dart';
import 'package:calculator/widgets/display_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var firstNum;
  var secondNum;
  String History ="";
  String res = '';
  late String operator;
  String ArithName ='';
  String allAlg = '';
  String textDisplay = '0';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.BackgroundColor,
      body: Padding(
        padding: EdgeInsets.only(
          top: Dimenstions.height50,
          bottom: Dimenstions.height20,
          left: Dimenstions.width20,
          right: Dimenstions.width20,
        ),
        child: Column(
          children: [
            DisplayScreen(
              nameAlg: allAlg,
              numDisplay: textDisplay,
              numHistory: History,

            ),
            SizedBox(
              height: Dimenstions.height25,
            ),
            Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Button(
                          text: "A/C",
                          callback: BtnOnClick,
                          TextColor: AppColor.TextColorlight,
                        ),
                        Button(
                          text: "C",
                          callback: BtnOnClick,
                          TextColor: AppColor.TextColorlight,
                        ),
                        Button(
                          text: "%",
                          callback: BtnOnClick,
                          TextColor: AppColor.TextColorlight,
                        ),
                        Button(
                          text: "/",
                          callback: BtnOnClick,
                          TextColor: AppColor.TextColorlight,
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Button(text: "9", callback: BtnOnClick),
                        Button(text: "8", callback: BtnOnClick),
                        Button(text: "7", callback: BtnOnClick),
                        Button(
                          text: "x",
                          callback: BtnOnClick,
                          TextColor: AppColor.TextColorlight,
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Button(text: "6", callback: BtnOnClick),
                        Button(text: "5", callback: BtnOnClick),
                        Button(text: "4", callback: BtnOnClick),
                        Button(
                          text: "-",
                          callback: BtnOnClick,
                          TextColor: AppColor.TextColorlight,
                          textsize: Dimenstions.height40,
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Button(text: "3", callback: BtnOnClick),
                        Button(text: "2", callback: BtnOnClick),
                        Button(text: "1", callback: BtnOnClick),
                        Button(
                          text: "+",
                          callback: BtnOnClick,
                          TextColor: AppColor.TextColorlight,
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Button(text: "0", callback: BtnOnClick),
                        SizedBox(width: Dimenstions.width20),
                        Button(text: ".", callback: BtnOnClick),
                        SizedBox(width: Dimenstions.width20),
                        Button(
                          text: "=",
                          callback: BtnOnClick,
                          TextColor: AppColor.TextColorlight,
                        ),
                      ],
                    ),
                  ],
                ))
          ],
        ),
      ),
    );
  }
  void BtnOnClick(String BtnValue) {
    print(BtnValue);

    if(BtnValue == 'C'){
      textDisplay = '0';
      firstNum = '0';
      secondNum = '0';
      allAlg = '';
      res = '';
      ArithName = '';
      }else if(BtnValue == 'A/C'){
      textDisplay = '0';
      firstNum = '0';
      secondNum = '0';
      allAlg = '';
      res = '';
      ArithName = 'CLEAR';
    }else if(BtnValue == '/' ||BtnValue == 'x' ||BtnValue == '+' ||BtnValue == '-' ||BtnValue == '%' ){
      if(BtnValue=='/'){
        ArithName = 'Divide';
      }else if(BtnValue=='x'){
        ArithName = 'MULTIPLY';
      }else if(BtnValue=='+'){
        ArithName = 'ADDITION';
      }else if(BtnValue=='-'){
        ArithName = 'SUBTRACTION';
      }else if(BtnValue=='%'){
        ArithName = 'PERCENTAGE';
      }else{
        ArithName ='';
      }
      firstNum = int.parse(textDisplay);
      res ='';
      operator = BtnValue;
    }
    else if(BtnValue == '='){
      ArithName = 'EQUAL';
      secondNum = int.parse(textDisplay);
      if(operator == '+'){
        res = (firstNum+secondNum).toString();
        History = firstNum.toString()+operator.toString()+secondNum.toString();
      } if(operator == '-'){
        res = (firstNum-secondNum).toString();
        History = firstNum.toString()+operator.toString()+secondNum.toString();
      } if(operator == 'x'){
        res = (firstNum*secondNum).toString();
        History = firstNum.toString()+operator.toString()+secondNum.toString();
      } if(operator == '/'){
        res = (firstNum/secondNum).toString();
        History = firstNum.toString()+operator.toString()+secondNum.toString();
      } if(operator == '%'){
        res = (firstNum%secondNum).toString();
        History = firstNum.toString()+operator.toString()+secondNum.toString();
      }
    }
    else{
      res = int.parse(textDisplay+BtnValue).toString();
    }
setState((){
textDisplay = res;
allAlg = ArithName;
});
  }
}


