package mapper;

import po.TopicCustom;

import java.util.List;

/**
 * Created by Administrator on 2017/12/12.
 */
public interface SearchMapper {
    public List<TopicCustom> selectTopicByBlock(String block)throws Exception;
    public List<TopicCustom> selectTopicByUid(String uid)throws Exception;
    public List<TopicCustom> selectTopicByVague(TopicCustom topicCustom)throws Exception;
    public List<TopicCustom> selectAllTopic()throws Exception;
    public TopicCustom searchOneTopic(String tid)throws Exception;
    public List<TopicCustom> findTopicByMulity(TopicCustom topicCustom)throws Exception;
    public List<TopicCustom> selectTopicByContext(TopicCustom topicCustom)throws Exception;



}
