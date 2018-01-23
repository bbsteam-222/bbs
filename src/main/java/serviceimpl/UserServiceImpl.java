package serviceimpl;

import mapper.UserMapper;
import org.springframework.beans.factory.annotation.Autowired;
import po.TopicCustom;
import po.User;
import po.UserLogin;
import po.UserResiger;
import service.UserService;
import util.MailUtil;
import Exception.UserException;


import java.text.MessageFormat;
import java.text.SimpleDateFormat;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

/**
 * Created by linpeng on 2017/12/2.
 */
public class UserServiceImpl implements UserService{
    @Autowired
    private UserMapper userMapper;

    @Override
    public void insertUser(UserResiger userResiger,String birthday,String sex)throws Exception
    {
        if (sex != null  && !sex.trim().isEmpty() && !sex.equals("")){
            if (sex.equals("男")){
                userResiger.setSex(2);
            }else if (sex.equals("女")){
                userResiger.setSex(1);
            }
        }

        if (birthday != null && !birthday.trim().isEmpty() && !birthday.equals("")){
            SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
            userResiger.setBirthday(sdf.parse(birthday));
        }

        System.out.println(userResiger.getBirthday());

        String uuid = UUID.randomUUID().toString().replace("-","");
        userResiger.setUid(uuid);
        int status = 0;
        String str = UUID.randomUUID().toString();
        userResiger.setVerifycode(str);
        userResiger.setStatus(status);
        MailUtil mailUtil = new MailUtil();
        String body = MessageFormat.format("您已完成BBS论坛的注册，请点击<a href=http://localhost:8080/bbs/activation.action?activationCode={0}>这里</a>完成账号激活",userResiger.getUid());
        String receiveMailAccount = userResiger.getEmail();
        mailUtil.send(receiveMailAccount,body);
        System.out.println(userResiger.getUsername());
        userMapper.insertUser(userResiger);
    }

    @Override
    public boolean findByUsername(String username)throws Exception{
        if (userMapper.findByUsername(username) == null){
            return false;
        }else {
            return true;
        }
    }

    @Override
    public void activation(String activationCode)throws UserException{
        UserResiger userResiger = null;
        try {
            userResiger = userMapper.findByID(activationCode);
        } catch (Exception e) {
            e.printStackTrace();
        }
        if (userResiger != null){
            if (userResiger.getStatus() == 0) {
                if (activationCode.equals(userResiger.getUid())) {
                    userResiger.setStatus(1);
                    try {
                        userMapper.updateStatus(userResiger);
                    } catch (Exception e) {
                        e.printStackTrace();
                    }
                } else {
                    throw new UserException("激活码不正确");
                }
            }
            else {
                throw new UserException("您已激活");
            }
        }else {
            throw new UserException("该用户未注册");
        }

    }

    public String findIdByUsername(String username)throws Exception{
        User user = null;
        if (userMapper.findByUsername(username) != null){
            user = (User) userMapper.findByUsername(username);
            return user.getUid();
        }
        return null;
    }

    public TopicCustom findUsernameById(String tid)throws Exception{
        TopicCustom topicCustom = userMapper.findUsernameByTopicID(tid);
        System.out.println(topicCustom.getUser().getUsername());
        return topicCustom;
    }

    @Override
    public UserLogin login(UserLogin userLogin) throws Exception {
        Map<String,String> map = new HashMap<String,String>();
        map.put("username",userLogin.getUsername());
        map.put("password",userLogin.getPassword());
        UserLogin userLoginDb = userMapper.findByNameAndPass(map);
        return userLoginDb;
    }

}
