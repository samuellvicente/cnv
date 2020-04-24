package pt.ulisboa.tecnico.cnv.metrics;

public class Metrics {
    private int i_count;
    private int b_count;
    private int m_count;

    public Metrics() {
        this.i_count = 0;
        this.b_count = 0;
        this.m_count = 0;
    }

    public int getI_count() {
        return this.i_count;
    }

    public int getB_count() {
        return this.b_count;
    }

    public int getM_count() {
        return this.m_count;
    }

    public void incrCount(int i){
        this.i_count += i;
        this.b_count++;
    }

    public void incrMCount(){
        this.m_count++;
    }
    public String toString(){
        return String.format("i_count:%d; b_count:%d; m_count:%d;", this.i_count, this.b_count, this.m_count);
    }
}
