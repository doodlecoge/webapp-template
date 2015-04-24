package wang.huaichao;

/**
 * Created by Administrator on 2015/4/24.
 */
public class RtException extends RuntimeException {
    public RtException() {
        super();
    }

    public RtException(String message) {
        super(message);
    }

    public RtException(String message, Throwable cause) {
        super(message, cause);
    }

    public RtException(Throwable cause) {
        super(cause);
    }

    protected RtException(String message, Throwable cause, boolean enableSuppression, boolean writableStackTrace) {
        super(message, cause, enableSuppression, writableStackTrace);
    }
}
