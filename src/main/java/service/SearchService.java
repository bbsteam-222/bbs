package service;

import po.TopicCustom;

import java.util.List;

/**
 * Created by Administrator on 2017/12/13.
 */
public interface SearchService {
    public List<TopicCustom> showTopicByBlock(String block)throws Exception;
    public List<TopicCustom> showTopicByUid(String uid)throws Exception;
    public List<TopicCustom> showTopicByVague(String context)throws Exception;
    public List<TopicCustom> showAllTopic()throws Exception;
    public TopicCustom showDetial(String tid)throws Exception;
    public List<TopicCustom> findTopicByMulity(String title, String username, String block)throws Exception;
  //  public List<TopicCustom> showTopicByContext(String context) throws Exception;

}
