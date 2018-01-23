package controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import po.User;
import service.AdminUserService;
import service.UserService;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created by yaqing on 2017/12/11.(整个页面都是新加的)
 */
@Controller
public class AdminUserController{
    @Autowired
    private AdminUserService adminUserService;
    @Autowired
    private UserService userService;
    ModelAndView modelAndView = new ModelAndView();


    //显示本版块下的所有用户
    @RequestMapping("/showBlockAllUser")
    public ModelAndView showBlockAllUser(HttpServletRequest request,
                                         HttpServletResponse response)throws Exception{
        String block = request.getParameter("block");
        Map<String,String> blocks = new HashMap<>();
        blocks.put("block",block);
        List<User> blockAllUser = adminUserService.showAllUser(block);
        modelAndView.addObject("blocks",blocks);
        modelAndView.addObject("blockAllUser",blockAllUser);
        modelAndView.setViewName("/jsp/admin.jsp");
        return modelAndView;
    }

    //管理员设置和撤销版主
    //设置版主
    @RequestMapping("/modifyUserToMode")
    public ModelAndView modifyUserToMode(String block,String moderator,HttpServletRequest request,
                                   HttpServletResponse response)throws Exception{
        Map<String,String> errors = new HashMap<>();
        int  ustatus = Integer.parseInt(moderator);
        String userid = request.getParameter("uid");
        int count = adminUserService.selectModeCount(block);
        if(ustatus == 1){
            errors.put("isMode","该用户已是版主！");
            errors.put("isModeId",userid);
        }else if(count > 0){
            errors.put("modeExist","该板块已有版主");
            errors.put("modeExistId",userid);
        }
        if (errors.size()>0){
            modelAndView.addObject("errors",errors);
        }else {
            adminUserService.updateUserToMode(userid);
        }
        List<User> blockAllUser = adminUserService.showAllUser(block);
        modelAndView.addObject("blockAllUser",blockAllUser);
        modelAndView.setViewName("/jsp/admin.jsp");
        return modelAndView;
    }

    //撤销版主
    @RequestMapping("/modifyModeToUser")
    public ModelAndView modifyModeToUser(String block,String moderator,HttpServletRequest request,
                                         HttpServletResponse response)throws Exception{
        Map<String,String> errors = new HashMap<>();
        int  ustatus = Integer.parseInt(moderator);
        String userid = request.getParameter("uid");
        if(ustatus == 0) {
            errors.put("isCommon", "已是普通用户！");
            errors.put("isCommonId", userid);
        }
        if (errors.size()>0){
            modelAndView.addObject("errors",errors);
        }else {
            adminUserService.updateModeToUser(userid);
        }
        List<User> blockAllUser = adminUserService.showAllUser(block);
        modelAndView.addObject("blockAllUser",blockAllUser);
        modelAndView.setViewName("/jsp/admin.jsp");
        return modelAndView;
    }
    @RequestMapping("/deleteUser")
    public ModelAndView deleteUser(String block,String username,HttpServletRequest request,
                                   HttpServletResponse response)throws Exception{
//        String username = request.getParameter("username");
//        String block = request.getParameter("block");
        String userId = userService.findIdByUsername(username);
        adminUserService.deleteUserById(userId);
        List<User> blockAllUser = adminUserService.showAllUser(block);
        modelAndView.addObject("blockAllUser",blockAllUser);
        modelAndView.setViewName("/jsp/admin.jsp");
        return modelAndView;
    }

}
