import java.io.IOException;
import java.util.Scanner;

public class Main {
    public static void main(String[] args) throws IOException {

        Scanner scan = new Scanner(System.in);
        String respSab; int respCal;

        System.out.print("\nQual o sabor da sobremesa? ");
            respSab = scan.nextLine();
        System.out.print("Quantas calorias têm a sobremesa? ");
            respCal = scan.nextInt();

        Sobremesa s = new Sobremesa(respSab,respCal);
        System.out.print(
            "\nNome: " + s.getNome()+
            "\nCalorias: "+ s.getCaloria()+
            "\nSaudavel? "+ s.ehSaudavel(respCal)+
            "\nDeliciosa? "+ s.ehDeliciosa()
        );

        System.out.print("\n\nQual o sabor da sobremesa? Alcaçuz");
        String respSabGec = "alcacuz";
        GeleiaEmCompota gec = new GeleiaEmCompota(respSabGec);

        System.out.print(
            "\n\nNome: " + gec.getNome()+
            "\nCalorias: "+ gec.getCaloria()+
            "\nSaudavel? "+ gec.ehSaudavel(5)+
            "\nDeliciosa? "+ gec.ehDeliciosa(respSabGec)
        );
    }
}
