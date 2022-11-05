public class GeleiaEmCompota extends Sobremesa {
    private String sabor;

    // Constructor
    public GeleiaEmCompota(String Sabor) {
        super("Geleia de Compota de "+ Sabor, 5);
    }
    // Setters
    public void setSabor(String Sabor){
        this.sabor = Sabor;
    }
    // Getters
    public String getSabor(){
        return this.sabor;
    }
    // ehDeliciosa
    public boolean ehDeliciosa(String Sabor){
        if (Sabor == "alcacuz")
            return false;
        return true;
    }
}
