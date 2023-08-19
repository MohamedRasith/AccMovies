extension aspect on String{

  double convertToAspectRatio(){
   try{ 
  List<int> numbers = this.split("/").map((e)  => int.parse(e)).toList();
  
   return  numbers[0]/numbers[1] ;
   }
   catch (e){
    return 1;
   }
  }
}