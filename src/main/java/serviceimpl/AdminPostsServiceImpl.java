package serviceimpl;

import mapper.AdminPostsMapper;
import org.springframework.beans.factory.annotation.Autowired;
import po.Topic;
import service.AdminPostsService;

import java.util.List;
import java.util.Map;

/**
 * Created by Administrator on 2017/12/14.新添加的serviceImp
 */
public class AdminPostsServiceImpl implements AdminPostsService {
    @Autowired
    private AdminPostsMapper adminPostsMapper;
    @Override
    public List<Topic> showAllPosts(String block) throws Exception {
        return adminPostsMapper.findPosts(block);
    }

    @Override
    public void agreePublish(String tid) throws Exception {
        adminPostsMapper.updateTstatusToSuccess(tid);
    }

    @Override
    public void disagreePublish(String tid) throws Exception {
        adminPostsMapper.updateTstatusToFail(tid);
    }

    @Override
    public Topic findPostById(String tid) throws Exception {
        return adminPostsMapper.findPostById(tid);
    }

    @Override
    public void updatePosts(Map map) throws Exception {
        adminPostsMapper.updatePosts(map);
    }

    @Override
    public void deletePostById(String tid) throws Exception {
        adminPostsMapper.deletePostById(tid);
    }

    /*@Override
    public Topic afterUpdatePost(String uid) throws Exception {
        return adminPostsMapper.findPostById(uid);
    }*/
}
