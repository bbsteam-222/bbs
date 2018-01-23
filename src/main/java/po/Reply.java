package po;

import java.util.Date;

/**
 * Created by linpeng on 2017/12/8.
 */
public class Reply {
    private String rid;
    private String uid;
    private String tid;
    private String context;
    private Date rtime;

    public String getRid() {
        return rid;
    }

    public void setRid(String rid) {
        this.rid = rid;
    }

    public String getUid() {
        return uid;
    }

    public void setUid(String uid) {
        this.uid = uid;
    }

    public String getTid() {
        return tid;
    }

    public void setTid(String superid) {
        this.tid = superid;
    }

    public String getContext() {
        return context;
    }

    public void setContext(String context) {
        this.context = context;
    }

    public Date getRtime() {
        return rtime;
    }

    public void setRtime(Date rtime) {
        this.rtime = rtime;
    }
}
