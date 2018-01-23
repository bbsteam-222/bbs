package service;

import po.Topic;

import java.util.List;
import java.util.Map;

/**
 * Created by Administrator on 2017/12/14. 新添加的service
 */
public interface AdminPostsService {
    public List<Topic> showAllPosts(String block)throws Exception;
    public void agreePublish(String tid)throws Exception;
    public void disagreePublish(String tid) throws Exception;
    public Topic findPostById(String tid)throws Exception;
    public void updatePosts(Map map)throws Exception;
    public void deletePostById(String tid) throws Exception;
}
