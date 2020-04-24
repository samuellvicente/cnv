package pt.ulisboa.tecnico.cnv;

public class RequestInfo {
    private String threadId;
    private String[] requestArgs;
    private Metrics metrics;

    public RequestInfo(String threadId) {
        this.threadId = threadId;
        this.requestArgs = null;
        this.metrics = null;
    }

    public String getThreadId() {
        return threadId;
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
    public void setMetrics (int i_count, int b_count, int c_count) {
        this.metrics = new Metrics(i_count, b_count, c_count);
    }

}
