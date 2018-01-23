package serviceimpl;

import mapper.ReplyMapper;
import org.springframework.beans.factory.annotation.Autowired;
import po.Reply;
import po.ReplyCustom;
import service.ReplyService;
import service.TopicService;
import service.UserService;

import java.io.File;
import java.io.FileWriter;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.UUID;

/**
 * Created by linpeng on 2017/12/9.
 */
public class ReplyServiceImpl implements ReplyService {

    @Autowired
    private ReplyMapper replyMapper;
    @Autowired
    private UserService userService;
    @Autowired
    private TopicService topicService;

    public void insertReply(String username,String superid,Reply reply)throws Exception{

        Date date = new Date();
        Timestamp timeStamp = new Timestamp(date.getTime());
        reply.setRtime(timeStamp);
        reply.setTid(superid);

        String uuid = UUID.randomUUID().toString().replace("-","");
        reply.setRid(uuid);

        reply.setUid(userService.findIdByUsername(username));
       /* SimpleDateFormat sdf =  new SimpleDateFormat( " yyyy-MM-dd HH:mm:ss " );
        String filename = sdf.format(new Date()).replace(":","").replace(" ","")+".txt";
        File fileText = new File(filename);
        String context = reply.getContext();
        FileWriter fileWriter = new FileWriter(fileText);
        //context.getBytes("UTF-8");
        fileWriter.write(context);
        fileWriter.close();
        reply.setContext(fileText.getAbsolutePath());*/
        System.out.println(reply.getContext());
        replyMapper.insertReply(reply);
    }

    public List<ReplyCustom> showReply(String tid)throws Exception{
        List<ReplyCustom> replyCustoms = new ArrayList<ReplyCustom>();
        replyCustoms = replyMapper.findUsernameByReplyID(tid);
        /*for(Reply reply:replyCustoms){
            String a = topicService.translateContext(reply.getContext());
            reply.setContext(a);
        }*/
        System.out.println(replyCustoms.size());
        return replyCustoms;
    }

}
