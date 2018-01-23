package serviceimpl;

import mapper.SearchMapper;
import org.springframework.beans.factory.annotation.Autowired;
import po.Topic;
import service.SearchService;

import java.util.List;

/**
 * Created by Administrator on 2017/12/13.
 */
public class SearchServiceImpl implements SearchService{

    @Autowired
    private SearchMapper searchMapper;

    public List<Topic> showTopicByBlock(String block)throws Exception{
        List<Topic> topicList=searchMapper.selectTopicByBlock(block);
        return topicList;
    }
    public List<Topic> showTopicByUid(String uid)throws Exception{
        List<Topic> topicList=searchMapper.selectTopicByUid(uid);
        return topicList;
    }
    public List<Topic> showTopicByTitle(String title)throws Exception{
        Topic topic = new Topic();
        topic.setTitle(title);
        List<Topic> topicList=searchMapper.selectTopicByTitle(topic);
        return topicList;
    }

    public List<Topic> showAllTopic()throws Exception{
        List<Topic> topicList = searchMapper.selectAllTopic();
        return topicList;
    }

    public Topic showDetial(String tid)throws Exception{
        Topic topic = searchMapper.searchOneTopic(tid);
        return topic;
    }

    public List<Topic> findTopicByMulity(String title, String uid, String block) throws Exception {
        Topic topic = new Topic();
        topic.setTitle(title);
        topic.setBlock(block);
        topic.setUid(uid);
        List<Topic> topiclist = searchMapper.findTopicByMulity(topic);
        return topiclist;
    }

}
