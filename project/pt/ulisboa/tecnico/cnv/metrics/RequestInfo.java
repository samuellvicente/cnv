package pt.ulisboa.tecnico.cnv.metrics;

import java.io.Serializable;

public class RequestInfo implements Serializable {
    private String threadName;
    private RequestArgs requestArgs = null;
    private Metrics metrics = null;

    public RequestInfo(String threadName) {
        this.threadName = threadName;
    }

    public String getThreadId() {
        return this.threadName;
    }

    public RequestArgs getRequestArgs() {
        return this.requestArgs;
    }

    public void setRequestArgs(RequestArgs requestArgs) {
        this.requestArgs = requestArgs;
    }

    public Metrics getMetrics() {
        return this.metrics;
    }

    public Metrics incGet() {
        if (this.metrics == null)
            this.metrics = new Metrics();
        return this.metrics;
    }

    public String toString(){
        return (this.metrics != null) ? String.format("threadName:%s; request:%s; metrics:%s", this.threadName, this.requestArgs.toString(), this.metrics.toString()): String.format("threadName:%s; request:%s;", this.threadName, this.requestArgs.toString());
    }

}
