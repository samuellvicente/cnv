package pt.ulisboa.tecnico.cnv;

public class ThreadLocalRequestInfo {

    private static final ThreadLocal<RequestInfo> requestInfo = new ThreadLocal<RequestInfo>() {
        @Override protected RequestInfo initialValue() {
            return new RequestInfo(Thread.currentThread().getName());
        }
    };

    public static void setRequestArgs(String[] a) {
            requestInfo.get().setRequestArgs(a);
        }

    public static void setMetrics(int i,int b,int m) {
        requestInfo.get().setMetrics(i, b, m);
    }

    public static void remove() {
            requestInfo.remove();
        }

    public static RequestInfo get() {
        return requestInfo.get();
    }
}
