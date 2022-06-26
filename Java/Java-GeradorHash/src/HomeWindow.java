import javax.swing.*;
import java.awt.*;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.io.IOException;
import java.security.NoSuchAlgorithmException;

public class HomeWindow extends JFrame {
    private static Image icon = Toolkit.getDefaultToolkit().getImage(".\\assets\\icon02_32.png");
    private JPanel  HomeWindowPanel;
    private JButton GerarHashBtn, SairBtn;
    private JTextField GeraHashCaminho;
    private JRadioButton MD5Btn, SHA1Btn, SHA256Btn;
    private JButton HelpBtn;
    public String SetHashType;

    public HomeWindow()
    {
        SairBtn.addActionListener(new ActionListener() {
            @Override
            public void actionPerformed(ActionEvent e) {
                System.exit(0);
            }
        });
        GerarHashBtn.addActionListener(new ActionListener() {
            @Override
            public void actionPerformed(ActionEvent e) {
                try {
                    String pwd = GeraHashCaminho.getText();
                    System.out.printf("Caminho: "+pwd);
                    GerarHash.main(pwd,SetHashType);
                    JOptionPane.showMessageDialog(null, SetHashType + " selecionada");
                } catch (NoSuchAlgorithmException ex) {
                    ex.printStackTrace();
                } catch (IOException ex) {
                    ex.printStackTrace();
                }
            }
        });
        HelpBtn.addActionListener(new ActionListener() {
            @Override
            public void actionPerformed(ActionEvent e) {
                JOptionPane.showMessageDialog(null,
                "1º Digite o caminho do diretório ou Procure-\n" +
                        "2º Selecione um método para geração de hash. MD5, SHA-1 ou SHA-256\n" +
                        "3º Clique no botão 'Gerar Hash' para que seja gerado o documento de referência das hashs\n" +
                        "4º O 'log' com as informações da hash gerada estará na pasta raiz do programa ",
                    "Help", JOptionPane.PLAIN_MESSAGE);
            }
        });
        MD5Btn.addActionListener(new ActionListener() {
            @Override public void actionPerformed(ActionEvent e) { SetHashType = "MD5"; }
        });
        SHA1Btn.addActionListener(new ActionListener() {
            @Override public void actionPerformed(ActionEvent e) { SetHashType = "SHA-1"; }
        });
        SHA256Btn.addActionListener(new ActionListener() {
            @Override public void actionPerformed(ActionEvent e) { SetHashType = "SHA-256"; }
        });
    }

    public static void main()
    {
        JFrame janela = new JFrame("JavaGeradorHash");
        janela.setContentPane(new HomeWindow().HomeWindowPanel);
        janela.setIconImage(icon);
        janela.setVisible(true);
        janela.setDefaultCloseOperation(EXIT_ON_CLOSE);
        janela.setResizable(true);
        janela.setSize(525, 155);
        janela.setLocationRelativeTo(null);
    }
}