package service;

import po.Topic;

import java.util.List;

/**
 * Created by Administrator on 2017/12/13.
 */
public interface SearchService {
    public List<Topic> showTopicByBlock(String block)throws Exception;
    public List<Topic> showTopicByUid(String uid)throws Exception;
    public List<Topic> showTopicByTitle(String title)throws Exception;
    public List<Topic> showAllTopic()throws Exception;
    public Topic showDetial(String tid)throws Exception;
    public List<Topic> findTopicByMulity(String title, String uid, String block)throws Exception;

}
