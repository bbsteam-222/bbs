package serviceimpl;

import org.springframework.beans.factory.annotation.Autowired;
import po.ReplyCustom;
import po.Topic;
import po.TopicCustom;
import service.TopicService;
import mapper.TopicMapper;
import service.UserService;

import java.io.*;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.UUID;
import java.util.List;

/**
 * Created by linpeng on 2017/12/8.
 */
public class TopicServiceImpl implements TopicService{

    @Autowired
    private TopicMapper topicMapper;
    @Autowired
    private UserService userService;


    public void insertTopic(Topic topic,String username)throws Exception{
        Date date = new Date();
        Timestamp timeStamp = new Timestamp(date.getTime());
        topic.setTime(timeStamp);

        String uuid = UUID.randomUUID().toString().replace("-","");
        topic.setTid(uuid);

        String uid = userService.findIdByUsername(username);
        topic.setUid(uid);

        SimpleDateFormat sdf =   new SimpleDateFormat( " yyyy-MM-dd HH:mm:ss " );
        String filename = sdf.format(new Date()).replace(":","").replace(" ","")+".txt";
        File fileText = new File(filename);
        String context = topic.getContext();
        FileWriter fileWriter = new FileWriter(fileText);
        //context.getBytes("UTF-8");
        fileWriter.write(context);
        fileWriter.close();
        topic.setContext(fileText.getAbsolutePath());

        topicMapper.insertTopic(topic);
    }

    public String translateContext(String context){
        StringBuilder result = new StringBuilder();
        try{
            BufferedReader br = new BufferedReader(new FileReader(context));//构造一个BufferedReader类来读取文件\
            //FileInputStream fis = new FileInputStream(context);
            //InputStreamReader isr = new InputStreamReader(fis,"UTF-8"); //指定以UTF-8编码读入
           // BufferedReader br = new BufferedReader(isr);
            String s = null;
            while((s = br.readLine())!=null){//使用readLine方法，一次读一行
                result.append(System.lineSeparator()+s);
            }
            br.close();
        }catch(Exception e){
            e.printStackTrace();
        }
        context = result.toString();
        //System.out.println(context);
        return context;
    }

    public List<TopicCustom> showAllTopic()throws Exception{
        List<Topic> topicList = topicMapper.selectAllTopic();
        List<TopicCustom> topicCustoms = new ArrayList<TopicCustom>();
        System.out.println(topicList.size());
        for(Topic topic:topicList){

            System.out.println(topic.getTid());
            TopicCustom topicCustom = userService.findUsernameById(topic.getTid());
            String a = translateContext(topicCustom.getContext());
            topicCustom.setContext(a);
            System.out.println(topicCustom.getContext());
            topicCustoms.add(topicCustom);
        }
        return topicCustoms;
    }

    public TopicCustom showDetial(String tid)throws Exception{
        TopicCustom topicCustom = userService.findUsernameById(tid);
        String a = translateContext(topicCustom.getContext());
        topicCustom.setContext(a);
        return topicCustom;
    }

    @Override
    public String findIdByTitle(String title) throws Exception {
        return topicMapper.findIdByTitle(title);
    }

    @Override
    public String findBlockById(String tid) throws Exception {
        return topicMapper.findBlockById(tid);
    }
}
