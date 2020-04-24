package pt.ulisboa.tecnico.cnv.server;

import pt.ulisboa.tecnico.cnv.metrics.RequestInfo;
import java.io.*;
import java.util.LinkedList;

public class TempStorage implements Runnable {
    private static File statsBackupFile = new File("stats.backup");
    private static File statsBackupFileTemp = new File("stats.backup.temp");

    private static synchronized LinkedList<RequestInfo> loadStats() {
        try {
            FileInputStream fis = new FileInputStream(TempStorage.statsBackupFile);
            ObjectInputStream ois = new ObjectInputStream(fis);
            LinkedList<RequestInfo> cdq = (LinkedList<RequestInfo>) ois.readObject();
            System.out.println("> Loaded stats backup");
            fis.close();
            ois.close();
            return cdq;
        } catch (ClassNotFoundException | IOException e) {
            try {
                System.out.println("> stats backup not found or corrupted attempting to load temp");
                FileInputStream fis = new FileInputStream(TempStorage.statsBackupFileTemp);
                ObjectInputStream ois = new ObjectInputStream(fis);
                LinkedList<RequestInfo> cdq = (LinkedList<RequestInfo>) ois.readObject();
                System.out.println("> Loaded stats backup temp");
                fis.close();
                ois.close();
                return cdq;
            } catch (IOException | ClassNotFoundException i) {
                System.out.println("> stats backup temp not found or corrupted");
                return new LinkedList<RequestInfo>();
            }
        }
    }

    private static void backupStats(LinkedList ll){
        try {
             FileOutputStream fos = new FileOutputStream(TempStorage.statsBackupFileTemp);
             ObjectOutputStream oos = new ObjectOutputStream(fos);
             oos.writeObject(ll);
            TempStorage.statsBackupFileTemp.renameTo(TempStorage.statsBackupFile);
            System.out.println("> Backup stats Successful");
        } catch (IOException e) {
            System.out.println("> Backup stats Failed");
        }
    }

    @Override
    public void run() {
        LinkedList<RequestInfo> stats = TempStorage.loadStats();

        System.out.println(stats.size());
        while (!WebServer.requestsInfo.isEmpty()){
            stats.add(WebServer.requestsInfo.removeFirst());
        }

        TempStorage.backupStats(stats);
    }
}
