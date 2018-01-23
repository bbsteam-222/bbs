package controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import po.Topic;
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

        List<Topic> allTopic = searchService.showAllTopic();
        request.setAttribute("allTopic",allTopic);
        return "/jsp/search.jsp";

    }

    @RequestMapping("/showDetial")
    public String showDetial(HttpServletResponse response,HttpServletRequest request,Model model)throws Exception{
        String titleId=request.getParameter("tid");
        Topic topic = searchService.showDetial(titleId);
        request.setAttribute("topic",topic);
        return "/jsp/oneTopic.jsp";
    }

    @RequestMapping("/showByTitle")
    public String showByTitle( String title,HttpServletResponse response,HttpServletRequest request,Model model)throws Exception{

        List<Topic> allTopic=searchService.showTopicByTitle(title);
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
        List<Topic> allTopic=searchService.showTopicByBlock(block);
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
        String uid = request.getParameter("uid");
        String block = request.getParameter("block");
        List<Topic> allTopic = searchService.findTopicByMulity(title,uid,block);
        request.setAttribute("allTopic", allTopic);
        return "forward:/jsp/topic/list.jsp";
    }

    @RequestMapping("/myTopic")
    public String myTopic(HttpServletRequest request, HttpServletResponse response,
                          Model model)throws Exception{
        UserLogin userlogin = (UserLogin) request.getSession().getAttribute("sessionUser");
        String uid = userlogin.getUid();
        List<Topic> allTopic = searchService.showTopicByUid(uid);
        request.setAttribute("allTopic", allTopic);
        return "forward:/jsp/topic/list.jsp";

    }



}
