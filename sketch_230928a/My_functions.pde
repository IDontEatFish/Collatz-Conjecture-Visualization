int collatz(int n) {

  if (n % 2 == 0) {
    println("Even");
    return n / 2;
  
  }
  
  println("Odd");
  return 3 * n + 1;

}
