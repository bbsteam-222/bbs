package mapper;

import po.Topic;
import java.util.List;

/**
 * Created by linpeng on 2017/12/2.
 */
public interface TopicMapper {
    public void insertTopic(Topic topic)throws Exception;
    public List<Topic> selectAllTopic()throws Exception;
    public Topic findOneTopic(String tid)throws Exception;
    public void updateTopic(Topic topic)throws Exception;
    public String findIdByTitle(String title)throws Exception;
    public String findBlockById(String tid) throws Exception;
    //public Topic findBy
}
