class Fraction {
    final int numerator;
    final int denominator;
    Fraction(this.numerator, this.denominator);
    
    void printFraction(){
      print('${numerator} / ${denominator}');
    }
    @override
    Fraction operator + (Object other){
      if(other is Fraction){
        int newNumerator = (numerator*other.denominator + other.numerator* denominator);
        int newDemoinator = denominator * other.denominator;
        return Fraction(newNumerator ~/GCD(newNumerator, newDemoinator), newDemoinator ~/GCD(newNumerator, newDemoinator));
      }
      return Fraction(0, 0);
    }
    @override
    Fraction operator - (Object other){
      if(other is Fraction){
        int newNumerator = (numerator*other.denominator - other.numerator* denominator);
        int newDemoinator = denominator * other.denominator;
        return Fraction(newNumerator ~/GCD(newNumerator, newDemoinator), newDemoinator ~/GCD(newNumerator, newDemoinator));
      }
      return Fraction(0, 0);
    }
    @override
    Fraction operator * (Object other){
      if(other is Fraction){
        int newNumerator = numerator*other.numerator;
        int newDemoinator = denominator * other.denominator;
        return Fraction(newNumerator ~/GCD(newNumerator, newDemoinator), newDemoinator ~/GCD(newNumerator, newDemoinator));
      }
      return Fraction(0, 0);
    }
    @override
    Fraction operator / (Object other){
      if(other is Fraction){
        int newNumerator = numerator*other.denominator;
        int newDemoinator = denominator * other.numerator;
        return Fraction(newNumerator ~/GCD(newNumerator, newDemoinator), newDemoinator ~/GCD(newNumerator, newDemoinator));
      }
      return Fraction(0, 0);
    }

    @override
    bool operator == (Object other){
      if (identical(this, other)) return true;
      if(other is Fraction){
        return (numerator * other.denominator == denominator * other.numerator);
      }
      return false;
    }


    @override
    bool operator >= (Object other){
      if (identical(this, other)) return true;
      if(other is Fraction){
        return (numerator * other.denominator >= denominator * other.numerator);
      }
      return false;
    }

    @override
    bool operator > (Object other){
      if (identical(this, other)) return false;
      if(other is Fraction){
        return (numerator * other.denominator > denominator * other.numerator);
      }
      return false;
    }

    @override
    bool operator <= (Object other){
      if (identical(this, other)) return true;
      if(other is Fraction){
        return (numerator * other.denominator <= denominator * other.numerator);
      }
      return false;
    }

    @override
    bool operator < (Object other){
      if (identical(this, other)) return false;
      if(other is Fraction){
        return (numerator * other.denominator < denominator * other.numerator);
      }
      return false;
    }
}

int GCD(int firstNumber, int secondNumber) {
    while (secondNumber != 0) {
      int swap = secondNumber;
      secondNumber = firstNumber % secondNumber;
      firstNumber = swap;
    }
    return firstNumber;
  }

void printFraction (Fraction obj){
  print('${obj.numerator} / ${obj.denominator}');
}

void main(){
  final phanSo1 = Fraction(1, 5);
  final phanSo2 = Fraction(2, 3);
  printFraction(phanSo1 + phanSo2); //   13/15
  printFraction(phanSo1 - phanSo2); //   -7/15
  printFraction(phanSo1 * phanSo2); //   2/15
  printFraction(phanSo1 / phanSo2); //   3/10

}