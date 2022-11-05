public class Sobremesa {
    private String nome;
    private int calorias;

    // Setters
    public void setNome(String Nome){
        nome = Nome;
    }
    public void setCaloria(int Calorias){
        calorias = Calorias;
    }
    // Getters
    public String getNome(){
        return this.nome;
    }
    public float getCaloria(){
        return this.calorias;
    }
    // Constructor
    public Sobremesa(String nome, int calorias) {
        this.nome = nome;
        this.calorias = calorias;
    }
    // ehSaudavel
    public boolean ehSaudavel(int calorias){
        if(calorias < 200)
            return true;
        return false;
    }
    // ehDeliciosa
    boolean ehDeliciosa(){
        return true;
    }
}
