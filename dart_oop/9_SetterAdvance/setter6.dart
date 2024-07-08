// In this example below, there is a class named BankAccount with one private property _balance.
// There is one getter balance to read the value of the property.
// There are methods deposit and withdraw to update the value of the _balance.

class BankAccount {
  double _balance = 0.0;

  BankAccount(this._balance);

  double get balancaGetter => this._balance;

  void deposit(double amount) {
    this._balance += amount;
  }

  void withdraw(double amount) {
    if (amount > this._balance) {
      throw new Exception("Insufficient balance");
    } else {
      this._balance -= amount;
    }
  }
}

void main() {
  BankAccount account1 = BankAccount(2000);

  account1.deposit(1000);
  account1.withdraw(300);

  print(account1.balancaGetter);
}
