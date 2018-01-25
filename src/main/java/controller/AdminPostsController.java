package controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import po.Topic;
import po.UserLogin;
import service.AdminPostsService;
import service.TopicService;
import service.UserService;

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
    @Autowired
    private UserService userService;
    ModelAndView modelAndView = new ModelAndView();
    @RequestMapping("/showAllPosts")
    public ModelAndView showAllPosts(HttpServletRequest request,
                                     HttpServletResponse response
                                    )throws Exception{
        String button = request.getParameter("button");
        if(button==null){
            modelAndView.setViewName("/jsp/adminTopic.jsp");
        }else if(button.equals("所有帖子")){
            List<Topic> allPosts = adminPostsService.showAllPosts();
            modelAndView.addObject("allPosts",allPosts);
            modelAndView.setViewName("/jsp/adminTopic.jsp");
        }else if(button.equals("待审核的帖子")){
            List<Topic> uncheckedPosts = adminPostsService.showUncheckedPosts();
            modelAndView.addObject("allPosts",uncheckedPosts);
            modelAndView.setViewName("/jsp/adminTopic.jsp");
        }else if(button.equals("已审核的帖子")){
            List<Topic> checkedPosts = adminPostsService.showCheckedPosts();
            modelAndView.addObject("allPosts",checkedPosts);
            modelAndView.setViewName("/jsp/adminTopic.jsp");
        }
        modelAndView.addObject("button",button);
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
        List<Topic> allPosts = adminPostsService.showAllPosts();
        modelAndView.addObject("allPosts",allPosts);
        request.setAttribute("status",status);
        modelAndView.setViewName("jsp/adminTopic.jsp");
        return modelAndView;
    }

    @RequestMapping("/deletePostById")
    public ModelAndView deletePostById(HttpServletRequest request,
                                       HttpServletResponse response
                                        )throws Exception{
        //先验证输入的登录密码是否正确，若正确，进行接下来的操作
        String loginname = "linp";
        String loginpass = request.getParameter("pass");
        UserLogin userLogin = new UserLogin();
        userLogin.setUsername(loginname);
        userLogin.setPassword(loginpass);
        UserLogin userFromDb = userService.login(userLogin);
        if (userFromDb==null){
            //s代表string o代表对象object，为最大父类
            modelAndView.addObject("passError","密码错误!");//保存错误信息到msg前端变量中
        } else{
            String tid = request.getParameter("tid");
            adminPostsService.deletePostById(tid);
            String block = topicService.findBlockById(tid);
            List<Topic> allPosts = adminPostsService.showAllPosts();
            modelAndView.addObject("allPosts",allPosts);
        }
        modelAndView.setViewName("/jsp/adminTopic.jsp");
        return modelAndView;
    }
}
