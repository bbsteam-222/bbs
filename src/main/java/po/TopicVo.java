package po;

import javax.xml.crypto.Data;

/**
 * Created by Administrator on 2017/12/12.
 */
public class TopicVo {

    private int tid;
    private int uid;
    private String title;
    private String context;
    private String block;
    private Data time;
    private int clicknum;

    private int pc;//pagecode 当前的页码
    private int ps;//pagesize 一页显示多少条post
    private int tr;//totalrecord 一共有多少条记录
    private int tp;//totalpage 一共有多少页码 由tr/ps 计算得出
    private String url;



}
