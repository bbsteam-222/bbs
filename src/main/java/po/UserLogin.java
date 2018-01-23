package po;

/**
 * Created by Administrator on 2017/12/10.
 */
public class UserLogin extends User{

    private String verifyCode;

    public String getVerifyCode() {
        return verifyCode;
    }

    public void setVerifyCode(String verifyCode) {
        this.verifyCode = verifyCode;
    }
}
