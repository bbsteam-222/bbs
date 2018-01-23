package service;

import po.User;

import java.util.List;

/**
 * Created by Administrator on 2017/12/11.新添加的service
 */
public interface AdminUserService {
    public List<User> showAllUser(String block) throws Exception;
    //查询本版块是否有版主
    public int selectModeCount(String block) throws Exception;
    //设置版主
    public void updateUserToMode(String userid) throws Exception;
    //撤销版主
    public void updateModeToUser(String userid) throws Exception;
    //删除用户
    public void deleteUserById(String userId)throws Exception;
}
