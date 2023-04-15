class Model{
  final String lottieImg;
  final String health;
  final double imgHeight;
  final double imgWidth;



  Model(this.lottieImg,this.health,this.imgHeight,this.imgWidth,);

}

List<Model> DataModel=[
  new Model('https://assets9.lottiefiles.com/temp/lf20_Celp8h.json', 'IsEmpty',180.0,180.0,),
  new Model('https://assets6.lottiefiles.com/packages/lf20_NDRSDjCFia.json', 'Underweight',300.0,300.0,),
  new Model('https://assets3.lottiefiles.com/packages/lf20_kOvJ8c/normal/data.json','Normal',180.0,180.0,),
  new Model('https://assets7.lottiefiles.com/packages/lf20_3ejhEJ/over/data.json','Overweight',500.0,200.0,),
  new Model('https://assets7.lottiefiles.com/packages/lf20_6rRg5u/obese/data.json', 'Obesity',180.0,180.0,),
  new Model('https://assets7.lottiefiles.com/packages/lf20_e2MF8p/morbid-obesity/data.json', 'More Obesity',180.0,180.0,)
];