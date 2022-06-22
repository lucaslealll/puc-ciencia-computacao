import javax.swing.*;
import java.awt.*;
import java.io.DataOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.nio.file.Files;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.Date;

public class GerarHash {
    File stream;
    byte[] bytesEntradaHash = null, bytesSaidaHash = null;
    StringBuilder hashHexadecimal;
    String hash;
    FileOutputStream saida;
    DataOutputStream escritor;

    public void SistemaArquivos(String pwd) {
        try{
            stream = new File(pwd);
            if(stream.exists()){
                JOptionPane.showMessageDialog(null,"Nome: " + stream.getName()
                        + "\nTamanho: " + stream.length() + " bytes\nE um arquivo? " + stream.isFile()
                        + "\nE um diretorio? " + stream.isDirectory() + "\nPode acessar para ler? " + stream.canRead()
                        ,"Arquivo Encontrado", JOptionPane.PLAIN_MESSAGE);
            }
            else {
                JOptionPane.showMessageDialog(null,
                "Arquivo (" + stream + ") não encontrado!!!" +
                        "\nLembre-se de colocar o caminho COMPLETO do diretório/arquivo","Atenção!!!", JOptionPane.ERROR_MESSAGE);
            }
        } catch (HeadlessException e) {
            e.printStackTrace();
        }
    }
    // /home/lucasomar/Development/JavaGeradorHash
    //
    // fazer salvar todos os paths em um arquivo
    // recursivamente ler cada local e gerar a hash do arquivo
    public void MethodDisplayContent(File diretorio, String hsh) throws IOException, NoSuchAlgorithmException {
        GerarHash gerahash = new GerarHash();
        File[] files = diretorio.listFiles();
            for(File file : files){
                String fullPath = file.getCanonicalPath(); // recebe o caminho completo do diretório
                gerahash.MethodCalculaHash(fullPath, hsh);
                    if (file.isDirectory()){
                        String fullPath2 = file.getCanonicalPath();
                        gerahash.MethodDisplayContent(new File(fullPath2), hsh);
//                        gerahash.MethodGeraArquivo(hsh, String.valueOf(diretorio), "teste");
//                        gerahash.MethodCalculaHash(fullPath,hsh);
                    }
            }
    }

    public String MethodCalculaHash(String pwd, String hsh) throws NoSuchAlgorithmException {
        File arquivo = new File(pwd);
        try {
            bytesEntradaHash = Files.readAllBytes(arquivo.toPath());
            MessageDigest algoritmoHash = MessageDigest.getInstance(hsh);
            bytesSaidaHash = algoritmoHash.digest(bytesEntradaHash);

            hashHexadecimal = new StringBuilder();
            for (byte b : bytesSaidaHash) {
                hashHexadecimal.append(String.format("%02X", 0xFF & b));
            }
            hash = hashHexadecimal.toString();

            // System.out.println("\nSequência de Bytes da HASH Gerada pelo Algoritmo " + hash);
            System.out.printf("\n" + "[" + hsh + "]\t" + "→\t" + hash + "\t→\t" + pwd);
            MethodGeraArquivo(hsh, pwd, hash);

        } catch (IOException erro) {}
        return hash;
    }

    public void MethodGeraArquivo(String hsh, String pwd, String hash){
        boolean append = true;
        try{
            saida = new FileOutputStream(new File("./log.txt"), true);
            escritor = new DataOutputStream(saida);
            escritor.writeUTF("\n" +"["+ hsh +"] "+ hash +"\t→ "+ pwd +"\t");
            saida.close();
        }
        catch (IOException erro){}
    }

    public static void main(String pwd, String hsh) throws NoSuchAlgorithmException, IOException {
        GerarHash GH = new GerarHash();

        GH.SistemaArquivos(pwd);
        GH.MethodDisplayContent(new File(pwd), hsh);

        String hash = GH.MethodCalculaHash(pwd,hsh);
//        GH.MethodGeraArquivo(pwd,hash);
    }
}
