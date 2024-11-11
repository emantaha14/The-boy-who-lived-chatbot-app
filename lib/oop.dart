class Arithmetic {
  int add(int n1, int n2) {
    return n1 + n2;
  }
}

class Adder extends Arithmetic {
  Adder() {
    print('my super class in Arithmetic');
  }
}

abstract class Employee {
  void work();
  factory Employee(){

    return Programmer();
  }

}

class Programmer implements Employee {
  @override
  void work() {
    print('Programmer');
  }
}

class HRManager implements Employee {
  @override
  void work() {
    print('HR');
  }
}

class Boss implements Employee {
  @override
  void work() {
    print('Boss');
  }
}

// class Employee {
//   // Factory constructor - no generative constructor in this class
//   factory Employee(String role) {
//     if (role == 'Manager') {
//       return Employee._internal(role);
//     } else {
//       return Employee._internal('Employee');
//     }
//   }
//
//   // Private generative constructor that can only be called within this class
//   Employee._internal(this.role);
//
//   final String role;
// }
//
// // Attempting to subclass Employee with a generative constructor
// class Programmer extends Employee {
//   // Generative constructor in the subclass
//   Programmer() : super.('Programmer'); // Causes error
//
//   void code() {
//     print("Writing code...");
//   }
// }
//
// void main() {
//   var emp = Employee('Manager');
//   print(emp.role); // Outputs: Manager
//
//   var prog = Programmer(); // Error: Can't subclass Employee because it lacks generative constructors
// }

abstract class Book{
  String? title;
   void setTitle(String s);
  String getTitle(){
  return title??'';
  }
}

class MyBook extends Book{
  @override
  void setTitle(String s) {
    print(s);
  }
}

abstract class AdvancedArithmetic {
  int divisor_sum(int n);
}

class MyCalculator implements AdvancedArithmetic{
  @override
  divisor_sum(int n) {
    int sum =0;
    for(int i =1 ; i<=n ; i++){
      if(n%i ==0 ){
        sum+= i;
      }
    }
    return sum;
  }

}