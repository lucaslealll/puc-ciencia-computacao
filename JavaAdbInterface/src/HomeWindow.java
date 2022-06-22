import javax.swing.*;
import java.awt.*;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.io.*;

public class HomeWindow extends JFrame {
    private static Image icon = Toolkit.getDefaultToolkit().getImage(".\\assets\\JavaAdbInterface32x32.png");
    private JPanel  HomeWindowPanel;
    private JButton StartBtn, HelpBtn, OpBtn1, OpBtn2, OpBtn3, OpBtn4, OpBtn5, OpBtn6, OpBtn7;
    private JRadioButton LinuxRadioButton, WindowsRadioButton;
    private JTextField CaminhoBtn7;
    private JTextField SegungosBtn6;
    public String SetOS;
    Adb adb = new Adb();


    public HomeWindow() throws IOException {
        HelpBtn.addActionListener(new ActionListener() {
            @Override
            public void actionPerformed(ActionEvent e) {
                JOptionPane.showMessageDialog(null,
                "1º - Certifique que a Depuração USB do dispositivo está habilitada\n" +
                        "2º - Certifique que o dispositivo esta conectado pelo cabo USB\n" +
                        "3º - Os arquivos serão salvos na pasta 'logs' do programa\n" +
                        "4º - Algumas funcionalidades podem exigir que haja elevação de privilégios",
                    "Help", JOptionPane.PLAIN_MESSAGE);
            }
        });
        LinuxRadioButton.addActionListener(new ActionListener() {
            @Override public void actionPerformed(ActionEvent e) { SetOS = "linux"; }
        });
        WindowsRadioButton.addActionListener(new ActionListener() {
            @Override public void actionPerformed(ActionEvent e) { SetOS = "windows"; }
        });
        StartBtn.addActionListener(new ActionListener() {
            @Override
            public void actionPerformed(ActionEvent e) {
                if (SetOS != null) {
                    try {
                        adb.StartAdb();
                    } catch (IOException ex) {
                        ex.printStackTrace();
                    }
                }else{
                    JOptionPane.showMessageDialog(null,
                        "1º - Certifique que há um Sistema Operacional Selecionado!\n" +
                                "2º - Certifique que a Depuração USB do aparelho analisado está ativada!\n" +
                                "3º - Certifique que a Transferência de Arquivos do aparelho analisado está ativada!",
                        "Atenção", JOptionPane.WARNING_MESSAGE);
                }
            }
        });
        OpBtn1.addActionListener(new ActionListener() {
            @Override
            public void actionPerformed(ActionEvent e) {
                try {
                    adb.ExtracaoInformacoesDispositivo();
                } catch (IOException ex) {
                    ex.printStackTrace();
                }
            }
        });
        OpBtn2.addActionListener(new ActionListener() {
            @Override
            public void actionPerformed(ActionEvent e) {
                try {
                    adb.ExtracaoPropriedades();
                } catch (IOException ex) {
                    ex.printStackTrace();
                }
            }
        });
        OpBtn3.addActionListener(new ActionListener() {
            @Override
            public void actionPerformed(ActionEvent e) {
                try {
                    adb.ExtracaoInformacoesEspecificas();
                } catch (IOException ex) {
                    ex.printStackTrace();
                }
            }
        });
        OpBtn4.addActionListener(new ActionListener() {
            @Override
            public void actionPerformed(ActionEvent e) {
                try {
                    adb.ExtracaoMetadadoImagem();
                } catch (IOException ex) {
                    ex.printStackTrace();
                }
            }
        });
        OpBtn5.addActionListener(new ActionListener() {
            @Override
            public void actionPerformed(ActionEvent e) {
                try {
                    adb.CapturaTela();
                } catch (IOException ex) {
                    ex.printStackTrace();
                }
            }
        });https://www.ufc.com.br/athlete/jose-aldo
        OpBtn6.addActionListener(new ActionListener() {
            @Override
            public void actionPerformed(ActionEvent e) {
                String tempo = SegungosBtn6.getText();
                try {
                    adb.CapturaVideoTela(tempo);
                } catch (IOException ex) {
                    ex.printStackTrace();
                }
            }
        });
        OpBtn7.addActionListener(new ActionListener() {
            @Override
            public void actionPerformed(ActionEvent e) {
                String caminho = CaminhoBtn7.getText();
                try {
                    adb.ExtracaoObjetoEspecifico(caminho);
                } catch (IOException ex) {
                    ex.printStackTrace();
                }
            }
        });
    }

    public static void main() throws IOException {
        JFrame janela = new JFrame("JavaAdbInterface");
        janela.setContentPane(new HomeWindow().HomeWindowPanel);
        janela.setIconImage(icon);
        janela.setVisible(true);
        janela.setDefaultCloseOperation(EXIT_ON_CLOSE);
        janela.setResizable(true);
        janela.setSize(300,450);
        janela.setLocationRelativeTo(null);
    }
}