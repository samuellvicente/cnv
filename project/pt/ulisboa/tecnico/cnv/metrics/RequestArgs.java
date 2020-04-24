package pt.ulisboa.tecnico.cnv.metrics;

import java.io.Serializable;

enum Strategy {
    BFS, DLX, CP;
}

public class RequestArgs implements Serializable {
    private Strategy strategy;
    private int un;
    private int n1;
    private int n2;
    private String puzzleName;
    private String puzzle;

    public RequestArgs(String[] args){
        this.un = Integer.decode(args[3]);
        this.n1 = Integer.decode(args[5]);
        this.n2 = Integer.decode(args[7]);
        this.puzzleName = args[9];
        this.puzzle= args[11];
        switch(args[1]){
            case "BFS":
                this.strategy=Strategy.BFS;
                break;
            case "DLX":
                this.strategy=Strategy.DLX;
                break;
            case "CP":
                this.strategy=Strategy.CP;
                break;
        }
    }

    @Override
    public String toString() {
        return "s=" + strategy + ", un=" + un + ", n1=" + n1 + ", n2=" + n2 + ", puzzleName='" + puzzleName + ", puzzle='" + puzzle;
    }
}
