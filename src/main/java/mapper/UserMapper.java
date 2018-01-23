package mapper;

import po.TopicCustom;
import po.User;
import po.UserLogin;
import po.UserResiger;

import java.util.List;
import java.util.Map;

/**
 * Created by linpeng on 2017/11/30.
 */
public interface UserMapper {
    public User findByUsername(String username)throws Exception;
    public void insertUser(UserResiger userResiger)throws Exception;
    public TopicCustom findUsernameByTopicID(String uid)throws Exception;
    public void updateStatus(UserResiger userResiger)throws Exception;
    public UserResiger findByID(String uid)throws Exception;
    public UserLogin findByNameAndPass(Map<String ,String > map)throws Exception;

}
