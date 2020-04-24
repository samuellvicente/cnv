package pt.ulisboa.tecnico.cnv;

public class Metrics {
    private int i_count;
    private int b_count;
    private int c_count;

    public Metrics(int i_count, int b_count, int c_count) {
        this.i_count = i_count;
        this.b_count = b_count;
        this.c_count = c_count;
    }

    public int getI_count() {
        return i_count;
    }

    public int getB_count() {
        return b_count;
    }

    public int getC_count() {
        return c_count;
    }

    public String toString(){
        return String.format("i_count:%d; i_count:%d; i_count:%d;", this.i_count, this.b_count, this.c_count);
    }
}
