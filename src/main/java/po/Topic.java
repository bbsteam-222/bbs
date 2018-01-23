package po;

import java.util.Date;

/**
 * Created by linpeng on 2017/12/8.
 */
public class Topic {
    private String tid;
    private String uid;
    private String title;
    private String context;
    private String block;
    private Date time;
    private int clicknum;
    private int tstatus;

    public String getTid() {
        return tid;
    }

    public void setTid(String tid) {
        this.tid = tid;
    }

    public String getUid() {
        return uid;
    }

    public void setUid(String uid) {
        this.uid = uid;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getContext() {
        return context;
    }

    public void setContext(String context) {
        this.context = context;
    }

    public String getBlock() {
        return block;
    }

    public void setBlock(String block) {
        this.block = block;
    }

    public Date getTime() {
        return time;
    }

    public void setTime(Date time) {
        this.time = time;
    }

    public int getClicknum() {
        return clicknum;
    }

    public void setClicknum(int clicknum) {
        this.clicknum = clicknum;
    }

    public int getTstatus() {
        return tstatus;
    }

    public void setTstatus(int tstatus) {
        this.tstatus = tstatus;
    }
}
