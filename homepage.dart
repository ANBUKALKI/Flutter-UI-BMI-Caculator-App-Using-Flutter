import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:bottom_sheet/bottom_sheet.dart';
import 'package:lottie/lottie.dart';
import 'package:bmicalculatorapp/Model.dart';
class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int currentindex = 0;
  String result="";
  String lottieimg='';
  String healthCondition='';
  double lottieH=0;
  double lottieW=0;
  String tColor='';
  double height=0;
  double weight=0;


  TextEditingController heightController = TextEditingController();
  TextEditingController weightController = TextEditingController();

  @override
  void initState(){
    super.initState();
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height:150,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(bottomLeft: Radius.circular(50),bottomRight: Radius.circular(50)),
                gradient: LinearGradient(colors:[(new Color(0xff460151)),(new Color(0xff8C01A1))],
                begin: Alignment.bottomLeft,
                  end: Alignment.topRight,
                )
              ),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      margin:EdgeInsets.only(top:60,),
                      child: Text("BMI CALCULATOR",style: TextStyle(fontWeight:FontWeight.bold,fontSize:25,color:Colors.white,),),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top:30,),
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        radioButton("Man",Colors.blue,0),
                        radioButton("Woman",Colors.pink,1),
                      ],
                    ),
                    SizedBox( height:30.0,),
                    Center(child: Text("Your Height in Cm :",style: TextStyle(fontSize:18.0),)),
                    SizedBox(height:20,),
                    Container(
                      margin: EdgeInsets.only(top:10,left:20,right:20),
                      padding: EdgeInsets.only(left:20,right:20),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadiusDirectional.circular(90),
                        color:Colors.grey[200],
                        boxShadow: [
                        BoxShadow(
                          offset: Offset(0, 10),
                          blurRadius:50,
                          color: Color(0xffEEEEE),
                        ),
                        ],
                      ),
                      alignment: Alignment.center,
                      child: TextFormField(
                        cursorColor:Color(0xff388e3c),
                        keyboardType: TextInputType.number,
                        controller: heightController,
                        decoration:InputDecoration(
                          hintText: "Enter your height",
                          enabledBorder:InputBorder.none,
                          focusedBorder: InputBorder.none,
                        ),
                      ),
                    ),
                    SizedBox( height:30.0,),
                    Center(child: Text("Your Weight in Kg :",style: TextStyle(fontSize:18.0),)),
                    SizedBox(height:20,),
                    Container(
                      margin: EdgeInsets.only(top:10,left:20,right:20),
                      padding: EdgeInsets.only(left:20,right:20),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadiusDirectional.circular(90),
                        color:Colors.grey[200],
                        boxShadow: [
                          BoxShadow(
                            offset: Offset(0, 10),
                            blurRadius:50,
                            color: Color(0xffEEEEE),
                          ),
                        ],
                      ),
                      alignment: Alignment.center,
                      child: TextFormField(
                        cursorColor:Color(0xff388e3c),
                        keyboardType: TextInputType.number,
                        controller: weightController,
                        decoration:InputDecoration(
                          hintText: "Enter your Weight",
                          enabledBorder:InputBorder.none,
                          focusedBorder: InputBorder.none,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 50.0,
                    ),
                    Container(
                      width: double.infinity,
                      height:80.0,
                      child:TextButton(onPressed: (){
                        showModalBottomSheet(context:context,shape:  RoundedRectangleBorder(
                          borderRadius: BorderRadius.vertical(top: Radius.circular(35.0)),
                        ),builder:(context) //BottomSheet code
                        {
                          return SingleChildScrollView(
                            child: Container(
                              child: Column(
                                children: [
                                  SizedBox(height: 20.0,),
                                  Text("Your BMI IS :",textAlign:TextAlign.center,style: TextStyle(fontSize:24.0,fontWeight:FontWeight.bold,),),
                                  Center(child:Lottie.network(lottieimg,width:lottieW,height:lottieH,),),
                                  Container(width:double.infinity,child: Text("$result",textAlign:TextAlign.center,style: TextStyle(fontSize: 20.0,fontWeight: FontWeight.bold),)),
                                  SizedBox(height:10.0,),
                                  Center(child: Text(healthCondition,textAlign: TextAlign.center,style:TextStyle(fontSize:25.0,fontWeight: FontWeight.bold,),),),
                                  SizedBox(height:5.0,),
                                  Center(child:ElevatedButton(child:Text('GoBack'),
                                    onPressed:()
                                    {
                                      Navigator.pop(context);
                                    },
                                  ),
                                  ),
                                  SizedBox(height:30.0,),
                                ],
                              ),
                            ),
                          );
                        }
                        );

                        setState(
                                (){
                              height = double.parse(heightController.value.text);
                              weight = double.parse(weightController.value.text);
                            }
                        );
                        calculateBmi(height, weight);
                      },
                        style:TextButton.styleFrom(backgroundColor:Colors.blue,),
                        child:Text('Calculate',
                            style:TextStyle(fontSize: 20.0,fontWeight:FontWeight.bold,color:Colors.white)),),
                    ),
                    SizedBox(height:30.0,),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void calculateBmi(double height,double weight)
  {
  double finalresult = weight/((height * height)/10000);
  String bmi = finalresult.toStringAsFixed(2);
  if(finalresult==0.00)
    {
      setState(() {
        result=bmi;
        lottieimg=DataModel[0].lottieImg;
        healthCondition=DataModel[0].health;
        lottieH=DataModel[0].imgHeight;
        lottieW=DataModel[0].imgWidth;
      });
    }
  else if(finalresult <= 18.4)
  {
    setState(() {
      result=bmi;
      lottieimg=DataModel[1].lottieImg;
      healthCondition=DataModel[1].health;
      lottieH=DataModel[1].imgHeight;
      lottieW=DataModel[1].imgWidth;

    });
  }
  else if(finalresult >=18.5 && finalresult <=24.9)
  {
    setState(() {
      result=bmi;
      lottieimg=DataModel[2].lottieImg;
      healthCondition=DataModel[2].health;
      lottieH=DataModel[2].imgHeight;
      lottieW=DataModel[2].imgWidth;
    });
  }
  else if(finalresult >=25.0 && finalresult <=29.9)
  {
    setState(() {
      result=bmi;
      lottieimg=DataModel[3].lottieImg;
      healthCondition=DataModel[3].health;
      lottieH=DataModel[3].imgHeight;
      lottieW=DataModel[3].imgWidth;
    });
  }
  else if(finalresult >=30.0 && finalresult <=34.9)
  {
    setState(() {
      result=bmi;
      lottieimg=DataModel[4].lottieImg;
      healthCondition=DataModel[4].health;
      lottieH=DataModel[4].imgHeight;
      lottieW=DataModel[4].imgWidth;
    });
  }
  else if(finalresult >=35.0)
  {
    setState(() {
      result=bmi;
      lottieimg=DataModel[5].lottieImg;
      healthCondition=DataModel[5].health;
      lottieH=DataModel[5].imgHeight;
      lottieW=DataModel[5].imgWidth;
    });
  }
  //setState(() { result=bmi;});
  }

  void changeIndex(int index)
  {
    setState(() {
      currentindex = index;
    });
  }
  
  Widget radioButton(String value,Color color,int index){
    return Expanded(
      child:Container(
        margin: EdgeInsets.symmetric(horizontal:12.0),
    height:50.0,
    child: TextButton(onPressed: () { changeIndex(index); },
        style:TextButton.styleFrom(
            backgroundColor:currentindex == index ? color : Colors.grey[200],
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30.0),
            )
        ),
  child:Text(value,style:TextStyle(
    color: currentindex == index ? Colors.white :color,
    fontSize:20.0,
    fontWeight:FontWeight.bold,
  ))),
    ),
    );
  }
  
}


