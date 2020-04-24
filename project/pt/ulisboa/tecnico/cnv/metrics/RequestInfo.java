package pt.ulisboa.tecnico.cnv.metrics;

public class RequestInfo {
    private String threadName;
    private String[] requestArgs;
    private Metrics metrics;

    public RequestInfo(String threadName) {
        this.threadName = threadName;
        this.requestArgs = null;
        this.metrics = new Metrics();
    }

    public String getThreadId() {
        return this.threadName;
    }

    public String[] getRequestArgs() {
        return this.requestArgs;
    }

    public void setRequestArgs(String[] requestArgs) {
        this.requestArgs = requestArgs;
    }

    public Metrics getMetrics() {
        return this.metrics;
    }

    public String toString(){
        return String.format("threadName:%s; request:%s; metrics:%s",this.threadName, this.requestArgs.toString(), this.metrics.toString());
    }

}
