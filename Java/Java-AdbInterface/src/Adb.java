import javax.swing.*;
import java.io.IOException;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

public class Adb {
    DateTimeFormatter DateHourFormatter = DateTimeFormatter.ofPattern("ddMMyy_HHmmss");

    public void SaveMessage(){
        JOptionPane.showMessageDialog(null,
                "Seu arquivo será salvo na pasta 'logs'",
                "Processamento", JOptionPane.PLAIN_MESSAGE);
    }

    public void StartAdb() throws IOException {
//        Runtime.getRuntime().exec("cmd ..\\adb_tools\\adb.exe devices");
        Runtime.getRuntime().exec("bash ..\\adb_tools\\AdbLinux\\./adb devices");
        JOptionPane.showMessageDialog(null,
            "Sistema iniciado!",
            "Iniciando", JOptionPane.INFORMATION_MESSAGE);
    }
/*
    Informações Globais:            adb shell settings list global
    Fabricante:                     adb shell getprop ro.product.manufacturer
    Modelo:                         adb shell getprop ro.product.model
    Número de Série:                adb shell getprop ril.serialnumber
    IMEI:                           adb shell service call iphonesubinfo 1
    Versão do Sistema Operacional:  adb shell getprop ro.build.version.release
*/
    public void ExtracaoInformacoesDispositivo() throws IOException {
        try {
            String[] args = new String[] {"/bin/bash", "-c", "adb shell settings list global > ../logs/InformacoesGlobais.txt;" +
                    "adb shell getprop ro.product.manufacturer > ../logs/FabricanteModeloSnImeiSo.txt;" +
                    "adb shell getprop ro.product.model >> ../logs/FabricanteModeloSnImeiSo.txt;" +
                    "adb shell getprop ril.serialnumber >> ../logs/FabricanteModeloSnImeiSo.txt;" +
                    "adb shell service call iphonesubinfo 1 >> ../logs/FabricanteModeloSnImeiSo.txt;" +
                    "adb shell getprop ro.build.version.release >> ../logs/FabricanteModeloSnImeiSo.txt;"};
            Process proc = new ProcessBuilder(args).start();
            SaveMessage();
        } catch (IOException ex) {
            ex.printStackTrace();
        }
//        Process exec = Runtime.getRuntime().exec("cmd ..\\adb_tools\\adb.exe shell settings list global");
        //Process exec = Runtime.getRuntime().exec("bash ..\\adb_tools\\AdbLinux\\./adb shell settings list global > Teste.txt");
    }
/*
adb shell getprop
adb shell getprop > <pasta>\propriedades.txt
adb shell getprop ro.product.manufacturer
adb shell dumpsys activity
adb shell dumpsys account
*/
    public void ExtracaoPropriedades() throws IOException {
        try {
            String[] args = new String[] {"/bin/bash", "-c", "adb shell getprop > ../logs/Propriedades.txt;" +
                    "adb shell dumpsys activity > ../logs/Atividade.txt;" +
                    "adb shell dumpsys account > ../logs/Contas.txt"};
            Process proc = new ProcessBuilder(args).start();
            SaveMessage();
        } catch (IOException ex) {
            ex.printStackTrace();
        }
    }
/*
adb shell content query --uri content://com.android.contacts/contacts
adb shell content query --uri content://com.android.contacts/contacts > <pasta>\contatos.txt
*/
    public void ExtracaoInformacoesEspecificas() throws IOException {

        try {
//            String[] args = new String[] {"/bin/bash", "-c", "adb shell content query --uri content://com.android.contacts/contacts > ../logs/Contatos.txt"};
            String[] args = new String[] {"/bin/bash", "-c", "adb shell content query --uri content://com.android.contacts/contacts > ../logs/Contatos.txt"};
            Process proc = new ProcessBuilder(args).start();
            SaveMessage();
        } catch (IOException ex) {
            ex.printStackTrace();
        }
    }
/*
adb shell content query --uri content://media/external/images/media
*/
    public void ExtracaoMetadadoImagem() throws IOException {
        try {
            String[] args = new String[] {"/bin/bash", "-c", "adb shell content query --uri content://media/external/images/media > ../logs/MetadadosImagens.txt"};
            Process proc = new ProcessBuilder(args).start();
            SaveMessage();
        } catch (IOException ex) {
            ex.printStackTrace();
        }
    }
/*
adb exec-out screencap -p > ~/Desktop/PrintTeste.png
*/
    public void CapturaTela() throws IOException {
        String data = DateHourFormatter.format(LocalDateTime.now());

        try {
            String[] args = new String[] {"/bin/bash", "-c", "adb exec-out screencap -p > ../logs/" + data + ".png"};
            Process proc = new ProcessBuilder(args).start();
            SaveMessage();
        } catch (IOException ex) {
            ex.printStackTrace();
        }
    }
/*
adb shell screenrecord --time-limit 10 /sdcard/video01.mp4
adb shell screenrecord --time-limit 10 --size 1280x720 /sdcard/video02.mp4
*/
    public void CapturaVideoTela(String tempo) throws IOException {
        String data = DateHourFormatter.format(LocalDateTime.now());
        try {
            String[] args = new String[] {"/bin/bash", "-c", "adb shell screenrecord --time-limit "+ tempo +" --size 720x1280 /sdcard/"+ data +".mp4"};
            Process proc = new ProcessBuilder(args).start();
            JOptionPane.showMessageDialog(null,
                    "Seu arquivo será salvo na pasta raiz do dispositivo!\n" +
                            "Use a 'Extração de Objetos Específicos' para extraí-lo para a pasta 'logs'",
                    "Processamento", JOptionPane.PLAIN_MESSAGE);
        } catch (IOException ex) {
            ex.printStackTrace();
        }
    }
/*
adb pull /sdcard/video01.mp4 <pasta>\video01.mp4
adb pull /sdcard/video02.mp4 <pasta>\video02.mp4
*/
    public void ExtracaoObjetoEspecifico(String caminho) throws IOException {
        try {
            String[] args = new String[] {"/bin/bash", "-c", "adb pull "+ caminho +" ../logs/"};
            Process proc = new ProcessBuilder(args).start();
            SaveMessage();
        } catch (IOException ex) {
            ex.printStackTrace();
        }

    }
}
