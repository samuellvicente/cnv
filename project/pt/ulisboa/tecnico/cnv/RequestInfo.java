package pt.ulisboa.tecnico.cnv;

public class RequestInfo {
    private String threadName;
    private String[] requestArgs;
    private Metrics metrics;

    public RequestInfo(String threadName) {
        this.threadName = threadName;
        this.requestArgs = null;
        this.metrics = null;
    }

    public String getThreadId() {
        return threadName;
    }

    public String[] getRequestArgs() {
        return requestArgs;
    }
    public void setRequestArgs(String[] requestArgs) {
        this.requestArgs = requestArgs;
    }

    public Metrics getMetrics() {
        return metrics;
    }
    void setMetrics (int i_count, int b_count, int c_count) {
        this.metrics = new Metrics(i_count, b_count, c_count);
    }

    public String toString(){
        return String.format("threadName:%s; request:%s; metrics:%s",this.threadName, this.requestArgs.toString(), this.metrics.toString());
    }

}
