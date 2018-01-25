package controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import po.Topic;
import po.TopicCustom;
import po.UserLogin;
import service.SearchService;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.List;

/**
 * Created by Administrator on 2017/12/13.
 */
@Controller
@RequestMapping("/search")
public class SearchController {
    @Autowired
    private SearchService searchService;

    //@Autowired
   // private UserService userService;
    @RequestMapping("/showAllTopic")
    public String showAllTopic(HttpServletResponse response, HttpServletRequest request, Model model)throws Exception{

        List<TopicCustom> allTopic = searchService.showAllTopic();
        request.setAttribute("allTopic",allTopic);
        return "/jsp/search.jsp";

    }

    @RequestMapping("/showDetial")
    public String showDetial(HttpServletResponse response,HttpServletRequest request,Model model)throws Exception{
        String titleId=request.getParameter("tid");
        TopicCustom topicCustom = searchService.showDetial(titleId);
        request.setAttribute("topic",topicCustom);
        return "/jsp/oneTopic.jsp";
    }

    @RequestMapping("/showByVague")
    public String showByVague( String context,HttpServletResponse response,HttpServletRequest request,Model model)throws Exception{

        List<TopicCustom> allTopic=searchService.showTopicByVague(context);
        request.setAttribute("allTopic",allTopic);
        return "forward:/jsp/topic/list.jsp";
    }

    @RequestMapping("/showByBlock")
    public String showByBlock(HttpServletResponse response,HttpServletRequest request,Model model)throws Exception{
        String block=request.getParameter("block");
        if (block.equals("tiyu")){block = "体育";}
        if (block.equals("xinwen")){block = "新闻";}
        if (block.equals("yule")){block = "娱乐";}
        if (block.equals("keji")){block = "科技";}
        if (block.equals("jianshen")){block = "健身";}
        if (block.equals("lvyou")){block = "旅游";}
        //block=new String(block.trim().getBytes("ISO-8859-1"), "UTF-8");
        //block=block.substring(0,block.length());
        List<TopicCustom> allTopic=searchService.showTopicByBlock(block);
        request.setAttribute("allTopic",allTopic);
        return "forward:/jsp/topic/list.jsp";
    }

    /*@RequestMapping("/showByUid")
    public String showByUid(HttpServletResponse response,HttpServletRequest request,Model model)throws Exception{
        String Uid=request.getParameter("uid");
        List<Topic> allTopic=searchService.showTopicByUid(Uid);
        request.setAttribute("allTopic",allTopic);
        return "/jsp/search.jsp";
    }*/
    @RequestMapping("/findTopicByMulity")
    public String findTopicByMulity(HttpServletRequest request, HttpServletResponse response, Model model, Topic topic)
            throws Exception {
        String title = request.getParameter("title");
        String username = request.getParameter("username");
        String block = request.getParameter("block");
        List<TopicCustom> allTopic = searchService.findTopicByMulity(title,username,block);
        request.setAttribute("allTopic", allTopic);
        return "forward:/jsp/topic/list.jsp";
    }

    @RequestMapping("/myTopic")
    public String myTopic(HttpServletRequest request, HttpServletResponse response,
                          Model model)throws Exception{
        UserLogin userlogin = (UserLogin) request.getSession().getAttribute("sessionUser");
        String uid = userlogin.getUid();
        List<TopicCustom> allTopic = searchService.showTopicByUid(uid);
        request.setAttribute("allTopic", allTopic);
        return "forward:/jsp/topic/list.jsp";

    }



}
