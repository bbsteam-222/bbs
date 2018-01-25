package serviceimpl;

import mapper.SearchMapper;
import org.springframework.beans.factory.annotation.Autowired;
import po.Topic;
import po.TopicCustom;
import po.User;
import service.SearchService;
import service.UserService;

import java.io.BufferedReader;
import java.io.FileReader;
import java.util.ArrayList;
import java.util.List;

/**
 * Created by Administrator on 2017/12/13.
 */
public class SearchServiceImpl implements SearchService{

    @Autowired
    private SearchMapper searchMapper;

    @Autowired
    private UserService userService;



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


   public List<TopicCustom> showTopicByVague(String context) throws Exception{
        List<TopicCustom> topicList = searchMapper.selectAllTopic();
        List<TopicCustom> topicCustoms = new ArrayList<TopicCustom>();
        for(Topic topic:topicList) {
            //System.out.println(topic.getTid());
            TopicCustom topicCustom = userService.findUsernameById(topic.getTid());
            String a = translateContext(topicCustom.getContext());
            topicCustom.setContext(a);
            //System.out.println(topicCustom.getContext());
            if ((topicCustom.getContext().indexOf(context) != -1)||(topicCustom.getTitle().indexOf(context)!=-1)||
                    (topicCustom.getBlock().indexOf(context)!=-1)||(topicCustom.getUser().getUsername().indexOf(context)!=-1))
            {
                topicCustoms.add(topicCustom);
            }
        }
        return topicCustoms;
    }


    public List<TopicCustom> showTopicByBlock(String block)throws Exception{
        List<TopicCustom> topicList=searchMapper.selectTopicByBlock(block);
        return topicList;
    }
    public List<TopicCustom> showTopicByUid(String uid)throws Exception{
        List<TopicCustom> topicList=searchMapper.selectTopicByUid(uid);
        return topicList;
    }
   /*
   public List<TopicCustom> showTopicByVague(String context)throws Exception{
        TopicCustom topicCustom = new TopicCustom();
        topicCustom.setTitle(context);
        topicCustom.setBlock(context);
        User user = new User();
        user.setUsername(context);
        topicCustom.setUser(user);
        List<TopicCustom> topicList=searchMapper.selectTopicByVague(topicCustom);
        List<TopicCustom> topicList1=this.showTopicByContext(context);
        topicList1.removeAll(topicList);//取差集
        topicList.addAll(topicList1);//取并集

        return topicList;
    }
    */

    public List<TopicCustom> showAllTopic()throws Exception{
        List<TopicCustom> topicList = searchMapper.selectAllTopic();
        return topicList;
    }

    public TopicCustom showDetial(String tid)throws Exception{
        TopicCustom topic = searchMapper.searchOneTopic(tid);
        return topic;
    }

    public List<TopicCustom> findTopicByMulity(String title, String username, String block) throws Exception {
       TopicCustom topicCustom = new TopicCustom();
        topicCustom.setTitle(title);
        topicCustom.setBlock(block);
        User user = new User();
        user.setUsername(username);
        topicCustom.setUser(user);
        List<TopicCustom> topiclist = searchMapper.findTopicByMulity(topicCustom);
        return topiclist;
    }

}
