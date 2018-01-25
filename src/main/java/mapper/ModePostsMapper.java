package mapper;

import po.Topic;

import java.util.List;
import java.util.Map;

/**
 * Created by Administrator on 2017/12/14.
 */
public interface ModePostsMapper {
    // 新添加的
    //根据用户名查找用户ID
    public String findIdByName(String username)throws Exception;
    //查询当前版主所在的版块
    public String findBlock(String uid) throws Exception;
    public  List<Topic> findPostsByBlock(String block) throws Exception;
}
