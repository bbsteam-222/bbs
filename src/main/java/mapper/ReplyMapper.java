package mapper;

import po.Reply;
import po.ReplyCustom;

import java.util.Date;
import java.util.List;

/**
 * Created by linpeng on 2017/12/2.*/
public interface ReplyMapper {
 public void insertReply(Reply reply)throws Exception;
 public List<ReplyCustom> findUsernameByReplyID(String tid)throws Exception;

}
