import "package:fraction/fraction.dart";

const measurements = ['tbsp', 'tsp', 'cup', 'quart', 'gallon', 'pound', 'gram'];

class Quantity {
  Quantity({required this.amount, required this.measurement});

  static Quantity parseFromMap(Map<String, String> qty){
    String preparseinput = qty['qty']!;
    List<String> splitInput = preparseinput.split(' ');
    if (splitInput.length == 2) {
      final amount =  splitInput[0].toFraction(); 
      final measurement =  splitInput[1];
      return Quantity(amount: amount, measurement:measurement);
    }
    else if (splitInput.length == 3) {
      final amount =  "${splitInput[0]} ${splitInput[1]}".toMixedFraction();
      final measurement = splitInput[2];
      return Quantity(amount: amount, measurement:measurement);
    }
    else {
      throw Exception("Invalid data");
    }
  }

   static Quantity parseFromString(String qty){
    List<String> splitInput = qty.split(' ');
    if (splitInput.length == 2) {
      final amount =  splitInput[0].toFraction(); 
      final measurement =  splitInput[1];
      return Quantity(amount: amount, measurement:measurement);
    }
    else if (splitInput.length == 3) {
      final amount =  "${splitInput[0]} ${splitInput[1]}".toMixedFraction();
      final measurement = splitInput[2];
      return Quantity(amount: amount, measurement:measurement);
    }
    else {
      throw Exception("Invalid data");
    }
  }


  Rational amount;
  String measurement;

  Quantity add(Quantity otherQty){
    if (measurement != otherQty.measurement) throw Exception("Can't add two different measurements together");

    return Quantity(amount: (amount.toDouble() + otherQty.amount.toDouble()).toFraction(), measurement: measurement);
  }

  Quantity multiply(int multiplier){

    return Quantity(amount: (amount.toDouble() * multiplier).toFraction(), measurement: measurement);
  }

  @override
  String toString(){
    return "$amount $measurement";
  }

}