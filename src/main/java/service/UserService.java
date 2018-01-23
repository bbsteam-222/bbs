package service;

import po.TopicCustom;
import po.User;
import po.UserLogin;
import po.UserResiger;
import Exception.UserException;

import java.util.List;

/**
 * Created by linpeng on 2017/12/2.
 */
public interface UserService {
    public void insertUser(UserResiger userResiger,String birthday,String sex)throws Exception;
    public boolean findByUsername(String username)throws Exception;
    public void activation(String activationCode)throws UserException;
    public String findIdByUsername(String username)throws Exception;
    public TopicCustom findUsernameById(String uid)throws Exception;
    public UserLogin login(UserLogin userlogin)throws  Exception;
}
