package service;

import po.Reply;
import po.ReplyCustom;

import java.util.List;

/**
 * Created by linpeng on 2017/12/9.
 */
public interface ReplyService {
    public void insertReply(String username,String superid, Reply reply)throws Exception;
    public List<ReplyCustom> showReply(String tid)throws Exception;
}
