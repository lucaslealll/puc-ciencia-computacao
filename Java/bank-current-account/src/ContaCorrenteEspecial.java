public class ContaCorrenteEspecial extends ContaCorrente{

    public void sacar(float vlrSaque) {
        float vlrDebto = (float) (0.1 * vlrSaque);
        float vlrFinal = saldo - (vlrSaque + vlrDebto);
        this.setSaldo(vlrFinal);
    }

    public ContaCorrenteEspecial(){
        super();
    }
}
