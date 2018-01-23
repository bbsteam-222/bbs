package controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import po.Topic;
import service.AdminPostsService;
import service.TopicService;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created by yaqing on 2017/12/11.(这整个页面都是新加的)
 */
@Controller
//@RequestMapping("/adminPosts")
public class AdminPostsController {
    @Autowired
    private AdminPostsService adminPostsService;
    @Autowired
    private TopicService topicService;
    ModelAndView modelAndView = new ModelAndView();
    @RequestMapping("/showAllPosts")
    public ModelAndView showAllPosts(HttpServletRequest request,
                                     HttpServletResponse response)throws Exception{
        String block = request.getParameter("block");
        List<Topic> allPosts = adminPostsService.showAllPosts(block);
        modelAndView.addObject("allPosts",allPosts);
        modelAndView.setViewName("/jsp/adminTopic.jsp");
        return modelAndView;
    }
    @RequestMapping("/examinePosts")
    public ModelAndView examinePosts(HttpServletRequest request,
                                     HttpServletResponse response)throws Exception{
        String tstatus = request.getParameter("tstatus");
        String title = request.getParameter("title");
        String tid =  topicService.findIdByTitle(title);
        String block =topicService.findBlockById(tid);
        String status = "";
        //得到管理员是点击了同意按钮还是不同意按钮
        String button = request.getParameter("button");

        //审核帖子时分为管理员点击同意和不同意两个按钮,然后分别调用不同的方法
        if(button.equals("同意")){
            adminPostsService.agreePublish(tid);

        }else{
            adminPostsService.disagreePublish(tid);
        }
        if(tstatus.equals("1")){
            status = "已通过";
        }else if (tstatus.equals("0")){
            status = "待审核";
        }else {
            status = "未通过";
        }
        List<Topic> allPosts = adminPostsService.showAllPosts(block);
        modelAndView.addObject("allPosts",allPosts);
        request.setAttribute("status",status);
        modelAndView.setViewName("jsp/adminTopic.jsp");
        return modelAndView;
    }
    @RequestMapping("/modifyPosts")
    public ModelAndView modifyPosts(String tid,HttpServletRequest request,
                                    HttpServletResponse response)throws Exception{
        String title = request.getParameter("title");
//        String tid = topicService.findIdByTitle(title);
//        Topic topic1 = adminPostsService.findPostById(tid);
        String context = request.getParameter("context");
        String block = topicService.findBlockById(tid);
        Map<String,String> map = new HashMap<>();
        map.put("title",title);
        map.put("context",context);
        map.put("tid",tid);
        adminPostsService.updatePosts(map);
        Topic topic = adminPostsService.findPostById(tid);
        List<Topic> allPosts = adminPostsService.showAllPosts(block);
        modelAndView.addObject("allPosts",allPosts);
        modelAndView.addObject("topic",topic);
        modelAndView.setViewName("jsp/adminTopic.jsp");
        return modelAndView;
    }
    @RequestMapping("/deletePostById")
    public ModelAndView deletePostById(String tid)throws Exception{
        adminPostsService.deletePostById(tid);
        String block = topicService.findBlockById(tid);
        List<Topic> allPosts = adminPostsService.showAllPosts(block);
        modelAndView.addObject("allPosts",allPosts);
        modelAndView.setViewName("/jsp/adminTopic.jsp");
        return modelAndView;
    }
}
