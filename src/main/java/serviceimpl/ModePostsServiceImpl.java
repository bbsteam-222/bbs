package serviceimpl;

import mapper.AdminPostsMapper;
import mapper.ModePostsMapper;
import org.springframework.beans.factory.annotation.Autowired;
import po.Topic;
import service.AdminPostsService;
import service.ModePostsService;
import java.util.List;
import java.util.Map;

/**
 * Created by Administrator on 2017/12/14.新添加的serviceImp
 */
public class ModePostsServiceImpl implements ModePostsService {
    @Autowired
    private ModePostsMapper modePostsMapper;

    @Override
    public String findIdByName(String username) throws Exception {
        return modePostsMapper.findIdByName(username);
    }

    @Override
    public String findBlock(String uid) throws Exception {
        return modePostsMapper.findBlock(uid);
    }

    @Override
    public  List<Topic> findPostsByBlock(String block) throws Exception {
        return modePostsMapper.findPostsByBlock(block);
    }
}
