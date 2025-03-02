// Bank Loan Processing System
//  Abstract Class: Loan
//  Create an abstract class Loan with the following properties and methods:
//     - borrowerName (String)
//     - loanAmount (double)
//     - interestRate (double)
//     - Abstract method: double calculateMonthlyInstallment(int months).
//  Loan Subclasses
//  Three types of loans should be implemented:
//     - PersonalLoan: Has a fixed 10% interest rate.
//     - HomeLoan: Has a base 8% interest rate, but if loanAmount > 500,000, the rate increases to 9.5%.
//     - CarLoan: Has a 7% interest rate, but if loanAmount > 50,000, it applies an additional 2% processing fee.
//  LoanProcessingSystem Class
//  Create a LoanProcessingSystem class that:
//     - Stores a list of loans.
//     - Provides methods to:
//         - applyLoan(Loan loan): Adds a loan application to the system.
//         - calculateInstallments(int months): Calculates the monthly installment for all loans.

abstract class Loan {
  String borrowerName;
  double loanAmount;
  double interestRate;

  Loan(
      {required this.borrowerName,
      required this.loanAmount,
      required this.interestRate});

  double calculateMonthlyInstallment(int months);
}

class PersonalLoan extends Loan {
  PersonalLoan({required String borrowerName, required double loanAmount})
      : super(
            borrowerName: borrowerName,
            loanAmount: loanAmount,
            interestRate: 0.10);

  @override
  double calculateMonthlyInstallment(int months) {
    double totalAmount = loanAmount + (loanAmount * interestRate);
    return totalAmount / months;
  }
}

class HomeLoan extends Loan {
  HomeLoan({required String borrowerName, required double loanAmount})
      : super(
            borrowerName: borrowerName,
            loanAmount: loanAmount,
            interestRate: loanAmount > 500000 ? 0.095 : 0.08);

  @override
  double calculateMonthlyInstallment(int months) {
    double totalAmount = loanAmount + (loanAmount * interestRate);
    return totalAmount / months;
  }
}

class CarLoan extends Loan {
  CarLoan({required String borrowerName, required double loanAmount})
      : super(
            borrowerName: borrowerName,
            loanAmount: loanAmount,
            interestRate: 0.07);

  @override
  double calculateMonthlyInstallment(int months) {
    double totalAmount = loanAmount + (loanAmount * interestRate);
    if (loanAmount > 50000) {
      totalAmount += loanAmount * 0.02;
    }
    return totalAmount / months;
  }
}

class LoanProcessingSystem {
  List<Loan> loans = [];

  void applyLoan(Loan loan) {
    loans.add(loan);
    print("Loan applied for: ${loan.borrowerName}");
  }

  void calculateInstallments(int months) {
    for (var loan in loans) {
      print(
          "${loan.borrowerName} needs to pay a monthly installment of: \$${loan.calculateMonthlyInstallment(months).toStringAsFixed(2)}");
    }
  }
}

void main() {
  LoanProcessingSystem system = LoanProcessingSystem();

  system.applyLoan(PersonalLoan(borrowerName: "Ahmed", loanAmount: 10000));
  system.applyLoan(HomeLoan(borrowerName: "Sarah", loanAmount: 600000));
  system.applyLoan(CarLoan(borrowerName: "Ali", loanAmount: 60000));

  system.calculateInstallments(12);
}
