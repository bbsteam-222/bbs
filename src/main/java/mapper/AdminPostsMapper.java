package mapper;

import po.Topic;

import java.util.List;
import java.util.Map;

/**
 * Created by Administrator on 2017/12/14.
 */
public interface AdminPostsMapper {
    // 新添加的
    public List<Topic> findPosts() throws Exception;
    public List<Topic> findUncheckedPosts() throws Exception;
    public List<Topic> findCheckedPosts() throws Exception;
    // 新添加的
    public void updateTstatusToSuccess(String tid) throws Exception;
    // 新添加的
    public void updateTstatusToFail(String tid) throws Exception;
    // 新添加的
    public void updatePosts(Map map) throws Exception;
    //不记得了，对应AdminPostMapper
    public Topic findPostById(String tid) throws Exception;
    // 新添加的
    public void deletePostById(String tid)throws Exception;
}
