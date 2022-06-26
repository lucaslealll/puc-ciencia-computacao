import java.io.IOException;

public class Main {
    public  static void main(String[] args) throws IOException {

        char resposta;
        ClassCaneta canetinha   = new ClassCaneta();
        ClassCaneta canetinha2  = new ClassCaneta();

        canetinha.cor = "preta";
        canetinha.tampada = false;

        canetinha.MetodoDadosCaneta();

            System.out.print("\nDeseja tampar a caneta? [S/N]\n");
            resposta = (char)System.in.read();

        canetinha.MetodoTampar(resposta);
        canetinha.MetodoRabiscar();
    }
}
