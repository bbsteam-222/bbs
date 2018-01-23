package service;

import po.Topic;
import po.TopicCustom;

import java.util.List;

/**
 * Created by linpeng on 2017/12/8.
 */
public interface TopicService {
    public void insertTopic(Topic topic,String username)throws Exception;
    public List<TopicCustom> showAllTopic()throws Exception;
    public TopicCustom showDetial(String tid)throws Exception;
    public String translateContext(String context);
    public String findIdByTitle(String title) throws Exception;
    public String findBlockById(String tid) throws Exception;
}
