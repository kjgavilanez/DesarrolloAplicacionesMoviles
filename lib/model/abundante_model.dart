class AbundanteModel{
  // Devuelve la suma de los divisores propios de n 
  static int sumaDivisoresPropios(int n){
    if(n <= 1) return 0;
    int suma = 1; // 1 es divisor propio para n>1
    for(int i = 2; i <= n ~/ 2; i++){
      if(n % i == 0) suma += i;
    }
    return suma;
  }

  // Devuelve true si n es un número abundante y falso en caso contrario
  static bool esAbundante(int n){
    return sumaDivisoresPropios(n) > n;
  }
}