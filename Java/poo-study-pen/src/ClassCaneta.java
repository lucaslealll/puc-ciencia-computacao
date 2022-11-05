import javax.swing.*;
import java.io.IOException;
import java.util.Scanner;

public class ClassCaneta {

    // Atributos do objeto caneta
    String  marca   = "bic",
            cor;
    int     carga   = 98;
    float   ponta   = 1.0F,
            preco   = 2.50F,
            altura = 15.0F,
            largura = 0.5F;
    boolean tampada;

    public void MetodoTampar(char resposta) throws IOException {

        if (resposta == 'S') this.tampada = true;
        else this.tampada = false;
        System.out.print("Resposta -> " + resposta);
    }

    // Métodos da classe
    public void MetodoRabiscar(){
        if(this.tampada == false) {
            System.out.print("\nRabiscando aljkdasljkdnsalkjdaslkj");
        }
        else{
            System.out.print("\n----------------------------------");
        }
    }
    //
    public void MetodoDadosCaneta(){
        System.out.print("\n\n\n\nMarca: " + this.marca + "\nCor: " + this.cor);
        System.out.print("\nCarga: " + this.carga + "%" + "\nPonta: " + this.ponta);
        System.out.print("\nAltura: " + this.altura + "\nLargura: " + this.largura);
        System.out.print("\nPreco: " + this.preco + "\nTampada? " + this.tampada);
    }
}
