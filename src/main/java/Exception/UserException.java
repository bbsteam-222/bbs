package Exception;

/**
 * Created by linpeng on 2017/12/8.
 */
public class UserException extends Exception{

    public UserException() {
    }

    public UserException(String msg){
        super(msg);
    }

    public UserException(String message, Throwable cause) {
        super(message, cause);
    }

    public UserException(Throwable cause) {
        super(cause);
    }


}
