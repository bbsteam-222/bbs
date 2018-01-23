package mapper;

import po.Topic;

import java.util.List;

/**
 * Created by Administrator on 2017/12/12.
 */
public interface SearchMapper {
    public List<Topic> selectTopicByBlock(String block)throws Exception;
    public List<Topic> selectTopicByUid(String uid)throws Exception;
    public List<Topic> selectTopicByTitle(Topic topic)throws Exception;
    public List<Topic> selectAllTopic()throws Exception;
    public Topic searchOneTopic(String tid)throws Exception;
    public List<Topic> findTopicByMulity(Topic topic)throws Exception;
}
