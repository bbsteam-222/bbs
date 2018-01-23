package serviceimpl;

import mapper.AdminUserMapper;
import org.springframework.beans.factory.annotation.Autowired;
import po.User;
import service.AdminUserService;

import java.util.List;

/**
 * Created by Administrator on 2017/12/11.新添加的serviceImp
 */
public class AdminUserServiceImpl implements AdminUserService {
    @Autowired
    private AdminUserMapper adminUserMapper;
    @Override
    public List<User> showAllUser(String block) throws Exception {
        List<User> userList = adminUserMapper.findAllUser(block);
        return userList;
    }

    @Override
    public int selectModeCount(String block) throws Exception {
        return adminUserMapper.selectModeCount(block);
    }

    @Override
    public void updateUserToMode(String userid) throws Exception {
       adminUserMapper.updateUserToMode(userid);
    }

    @Override
    public void updateModeToUser(String userid) throws Exception {
        adminUserMapper.updateModeToUser(userid);
    }

    @Override
    public void deleteUserById(String userId) throws Exception {
        adminUserMapper.deleteUserById(userId);
    }

}
