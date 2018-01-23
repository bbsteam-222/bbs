package controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import po.ReplyCustom;
import po.Topic;
import po.TopicCustom;
import service.ReplyService;
import service.TopicService;
import service.UserService;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.net.URLEncoder;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created by linpeng on 2017/12/9.
 */

@Controller
public class TopicController {

    @Autowired
    private TopicService topicService;
    @Autowired
    private UserService userService;
    @Autowired
    private ReplyService replyService;

    ModelAndView modelAndView = new ModelAndView();

    @RequestMapping("/topicSubmit")
    public ModelAndView topicSubmit(Topic topic, HttpServletRequest request,
                            HttpServletResponse response)throws Exception{

        Map<String,String> errors = new HashMap<>();

        String title = topic.getTitle();
        String context = topic.getContext();
        String username = request.getParameter("username");

        if (title == null || title.trim().isEmpty()){
            errors.put("title","标题不能为空");
        }

        if (context == null || context.trim().isEmpty()){
            errors.put("context","内容不能为空");
        }

        if (errors.size() > 0){
            //System.out.println(errors.size());
            modelAndView.addObject("topic",topic);
            modelAndView.addObject("errors",errors);
            modelAndView.setViewName("jsp/topic.jsp");
            return modelAndView;
        }

        topicService.insertTopic(topic,username);

        modelAndView.setViewName("jsp/blank.jsp");
        return modelAndView;

    }

    //根据topic的title获取tid,然后再。。。(用来显示管理员管理帖子页面的点击帖子标题的详情页)
    @RequestMapping("/showDetails")
    public ModelAndView showDetails(String title,HttpServletRequest request,
                                    HttpServletResponse response)throws Exception{
//        String context = request.getParameter("context");
//        String title = request.getParameter("title");
        String tid = topicService.findIdByTitle(title);
        Topic topic = topicService.showDetial(tid);
        modelAndView.addObject("topic",topic);
        modelAndView.setViewName("jsp/examine.jsp");
        return modelAndView;
    }

    @RequestMapping("/showAllTopic")
    public ModelAndView showAllTopic()throws Exception {
        List<TopicCustom> TopicCustoms = topicService.showAllTopic();
        modelAndView.addObject("allTopic",TopicCustoms);
        modelAndView.setViewName("jsp/main.jsp");
        return modelAndView;
    }
    //用来显示点击审核后每个帖子的信息（带同意和不同意按钮）
    @RequestMapping("/showDetailInfo")
    public ModelAndView showDetailInfo(HttpServletRequest request,
                                       HttpServletResponse response)throws Exception{
//        Map<String,String> errors = new HashMap<>();
        String tstatus = request.getParameter("tstatus");
//        //状态为1和-1都不可以审核，
//        if(tstatus.equals("1")){
//            errors.put("tstatus","该帖子已通过审核，无需再审核！");
//        }else if(tstatus.equals("-1")){
//            errors.put("tstatus","该帖子已被拒绝！");
//        }
//        if(errors.size()>0){
//            modelAndView.addObject("errors",errors);
//            modelAndView.setViewName("jsp/adminPosts.jsp");
//            return modelAndView;
//        }
        String title = request.getParameter("title");
        String tid = topicService.findIdByTitle(title);
        Topic topic = topicService.showDetial(tid);
        modelAndView.addObject("topic",topic);
        modelAndView.setViewName("jsp/examine.jsp");
        return modelAndView;
    }
    //新添加的action
    //用来显示修改帖子时需要显示的内容
    @RequestMapping("/showNeedToModify")
    public ModelAndView showNeedToModify(HttpServletRequest request,
                                         HttpServletResponse response)throws Exception{
        String title = request.getParameter("title");
//        String tid = request.getParameter("tid");
        String tid = topicService.findIdByTitle(title);
        Topic topic = topicService.showDetial(tid);
        modelAndView.addObject("topic",topic);
        modelAndView.setViewName("jsp/modifyPosts.jsp");
        return modelAndView;
    }


    @RequestMapping("/showDetial")
    public ModelAndView showDetial(HttpServletRequest request,
                                        HttpServletResponse response)throws Exception{
        String titleId = request.getParameter("tid");
        TopicCustom topic = topicService.showDetial(titleId);
        List<ReplyCustom> replyCustoms = replyService.showReply(titleId);
        request.getSession().setAttribute("sessionTopic",topic);
        modelAndView.addObject("topic",topic);
        modelAndView.addObject("replyList",replyCustoms);
        modelAndView.setViewName("jsp/oneTopic.jsp");
        return modelAndView;
    }

    @RequestMapping("/showReplyDetial")
    public ModelAndView showReply(HttpServletRequest request,
                                   HttpServletResponse response)throws Exception{
        Topic topic = (Topic)request.getSession().getAttribute("sessionTopic");
        String titleId = topic.getTid();
        List<ReplyCustom> replyCustoms = replyService.showReply(titleId);
        modelAndView.addObject("replyList",replyCustoms);
        modelAndView.setViewName("jsp/oneTopic.jsp");
        return modelAndView;
    }

   /* @RequestMapping("/showWriter")
    public ModelAndView showWriter(HttpServletRequest request,
                                   HttpServletResponse response)throws Exception{
        Map<String,String> user = new HashMap<>();
        String userId = request.getParameter("uid");
        TopicCustom topicCustom = userService.findUsernameById(userId);
        //user.put("username",topicCustom);
        modelAndView.addObject("user",user);
        modelAndView.setViewName("jsp/oneTopic.jsp");
        return modelAndView;

    }*/
}
