public class ContaCorrente {
    public String cpf;
    public float saldo;
    public float taxaSaque;

    // Setters
    public void setCpf(String Cpf){
        this.cpf = Cpf;
    }
    public void setSaldo(float Saldo){
        this.saldo = Saldo;
    }
    public void setTaxa(float Taxa){
        this.taxaSaque = Taxa;
    }

    // Getters
    public String getCpf(){
        return this.cpf;
    }
    public float getSaldo(){
        return this.saldo;
    }

    // Methods
    public void depositar(float vlrDeposito){
        float vlrFinal = saldo + vlrDeposito;
        this.setSaldo(vlrFinal);
    }
    public void sacar(float vlrSaque){
        float vlrDebto = (float) (0.5 * vlrSaque);
        float vlrFinal = saldo - (vlrSaque+vlrDebto);
        this.setSaldo(vlrFinal);
    }
    public void imprimir(){
        System.out.printf(
            "\n\nCPF: "+ this.cpf+
            "\nSaldo: R$"+ this.saldo
        );
    }
}
