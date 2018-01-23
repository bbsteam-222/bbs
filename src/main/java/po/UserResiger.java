package po;

/**
 * Created by linpeng on 2017/12/2.
 */
public class UserResiger extends User {
    private String repassword;
    private String verifycode;

    public String getRepassword() {
        return repassword;
    }

    public void setRepassword(String repassword) {
        this.repassword = repassword;
    }

    public String getVerifycode() {
        return verifycode;
    }

    public void setVerifycode(String verifycode) {
        this.verifycode = verifycode;
    }
}
