package controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import po.Reply;
import service.ReplyService;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.HashMap;
import java.util.Map;

/**
 * Created by linpeng on 2017/12/10.
 */
@Controller
public class ReplyController {
    @Autowired
    private ReplyService replyService;

    ModelAndView modelAndView = new ModelAndView();

    @RequestMapping("/insertReply")
    public ModelAndView insertReply(Reply reply, HttpServletRequest request,
                                    HttpServletResponse response)throws Exception{

        Map<String,String> errors = new HashMap<>();

        String username = request.getParameter("username");
        String superid = request.getParameter("tid");
        String context = reply.getContext();

        //context=new String(context.trim().getBytes("ISO-8859-1"), "UTF-8");
        //request.setCharacterEncoding("utf-8");
        //request.setCharacterEncoding("ISO8859-1");
        if (context == null || context.trim().isEmpty()){
            errors.put("ReplyContext","回复内容不能为空");
        }
        System.out.println(reply.getContext());
        if (errors.size() > 0){
            modelAndView.addObject("errors",errors);
            modelAndView.setViewName("jsp/blank_reply.jsp");
            return modelAndView;
        }

        replyService.insertReply(username,superid,reply);

        modelAndView.setViewName("jsp/blank_reply.jsp");
        return modelAndView;
    }
}
