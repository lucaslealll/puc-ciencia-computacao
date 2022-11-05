public class Main {
    public static void main(String[] args) {
        ContaCorrente CC = new ContaCorrente();
            CC.setCpf("123.456.789-10");
            CC.setSaldo(1200);
            CC.depositar(365);
            CC.sacar(230);
                CC.imprimir();

        ContaCorrenteEspecial CCE = new ContaCorrenteEspecial();
            CCE.setCpf("109.876.543.21");
            CCE.setSaldo(15000);
            CCE.depositar(500);
            CCE.sacar(2000);
                CCE.imprimir();
    }
}
