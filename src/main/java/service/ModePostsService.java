package service;

import po.Topic;

import java.util.List;
import java.util.Map;

/**
 * Created by Administrator on 2017/12/14. 新添加的service
 */
public interface ModePostsService {
    public String findIdByName(String username) throws Exception;
    public String findBlock(String uid) throws Exception;
    public  List<Topic> findPostsByBlock(String block) throws Exception;

}
