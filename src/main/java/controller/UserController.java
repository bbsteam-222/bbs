package controller;

import com.google.code.kaptcha.Constants;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import po.UserLogin;
import po.UserResiger;
import service.UserService;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.text.SimpleDateFormat;
import java.net.URLEncoder;
import java.util.HashMap;
import java.util.Map;

/*
*
 * Created by linpeng on 2017/12/5.
*/



@Controller
//@RequestMapping("/user")
public class UserController {
    @Autowired
    private UserService userService;
    ModelAndView modelAndView = new ModelAndView();

    @RequestMapping("/registSubmit")
    public ModelAndView registSubmit(UserResiger userResiger,HttpServletRequest request,
                               HttpServletResponse response)throws Exception{

        Map<String,String> errors = new HashMap<>();
        String state = null;

        String username = userResiger.getUsername();
        String password = userResiger.getPassword();
        String repassword = userResiger.getRepassword();
        String phone = userResiger.getPhone();
        String email = userResiger.getEmail();
        String yy = request.getParameter("YYYY");
        String mm = request.getParameter("MM");
        String dd = request.getParameter("DD");
        String birthday = yy+"-"+mm+"-"+dd;
        String sex = request.getParameter("sec");

        System.out.println(yy);
        System.out.println(mm);
        System.out.println(dd);
        System.out.println(birthday);

        //String verifycode = userResiger.getVerifycode();
        //String original = (String) request.getSession().getAttribute(Constants.KAPTCHA_SESSION_KEY);

       // ModelAndView modelAndView = new ModelAndView();

        if(username == null || username.trim().isEmpty()){
            errors.put("username","用户名不能为空");
        }else if(username.length() <= 3 || username.length()>20){
            errors.put("username","3-20位，中文、字母、数字、下划线的组合，以中文或字母开头");
        }else if (userService.findByUsername(username)){
            errors.put("username","用户名已被注册");
        }

        if (password == null || password.trim().isEmpty()){
            errors.put("password","密码不能为空");
        }else if(password.length() <= 3 || password.length()>20){
            errors.put("password","请输入3到20之间的密码");
        }

        if (repassword == null || repassword.trim().isEmpty()){
            errors.put("repassword","确认密码不能为空");
        }else if (!repassword.equals(password)){
            errors.put("repassword","两次密码输入不一致");
        }

        if (email == null || email.trim().isEmpty()){
            errors.put("email","Email不能为空");
        }else if (!email.matches("^([a-zA-Z0-9_-])+@([a-zA-Z0-9_-])+((\\.[a-zA-Z0-9_-]{2,3}){1,2})$")) {
            errors.put("email", "Email格式不正确");
        }

        if(phone != null && !phone.trim().isEmpty()){
            if (!phone.matches(("^((13[0-9])|(15[^4,\\D])|(18[0,5-9]))\\d{8}$"))){
                errors.put("phone", "手机号码格式不正确");
            }
        }


        /*if (verifycode ==null || verifycode.trim().isEmpty()){
            errors.put("verifyCode", "验证码不能为空");
        }
        else if (!verifycode.equalsIgnoreCase(original)) {
            errors.put("verifyCode", "验证码输入错误");
        }
*/

        if (errors.size() > 0){
            //System.out.println(errors.size());
            //state = "error";
            request.setAttribute("user",userResiger);
            request.setAttribute("errors",errors);
            modelAndView.setViewName("/jsp/regist.jsp");
            return modelAndView;
        }

        userService.insertUser(userResiger,birthday,sex);

        modelAndView.setViewName("jsp/email.jsp");
        return modelAndView;
        //return state;
    }

    @RequestMapping("/activation")
    public ModelAndView activation(String activationCode,HttpServletRequest request,
                                   HttpServletResponse response)throws Exception{
        String activationcode = request.getParameter("activationCode");
        userService.activation(activationcode);
        modelAndView.setViewName("jsp/registSuccess.jsp");
        return modelAndView;
    }

    @RequestMapping("/login")
    public String login( HttpServletRequest request, HttpServletResponse response, Model model)
            throws Exception {
        String loginname = request.getParameter("loginname");
        String loginpass = request.getParameter("loginpass");
        String verifyCode = request.getParameter("verifyCode");
        //map是一对一的关系
        Map<String,String> errors = new HashMap<String,String>();
        //除去空格之外的为空
        if (loginname==null||loginname.trim().isEmpty()){
            //这里的username是前端的errors.username
            errors.put("username","用户名不能为空");
        }
        else if (loginname.length()>=20||loginname.length()<=3){
            errors.put("username","用户名的长度应该在3到20个字符之间");
        }
        if (loginpass==null||loginpass.trim().isEmpty()){
            errors.put("password","密码不能为空");
        }
        else if (loginpass.length()>=20||loginpass.length()<3){
            errors.put("password","密码的长度应该在3到20个字符之间");
        }
        String original = (String) request.getSession().getAttribute(Constants.KAPTCHA_SESSION_KEY);
        if (verifyCode==null||verifyCode.trim().isEmpty()){
            errors.put("verifyCode","验证码不能为空");
        }else if (!verifyCode.equalsIgnoreCase(original)){
            errors.put("verifyCode","验证码输入错误");
        }
        if (errors.size()>0){
            request.setAttribute("errors",errors);
            return "/jsp/login.jsp";
        }

        //前台输入的用户、密码
        UserLogin userLogin = new UserLogin();
        userLogin.setUsername(loginname);
        userLogin.setPassword(loginpass);
        userLogin.setVerifyCode(verifyCode);
        //后台数据库中正确的用户名、密码
        UserLogin userFromDb = userService.login(userLogin);
        //查找到数据库的信息为空
        if (userFromDb==null){
            //s代表string o代表对象object，为最大父类
            request.setAttribute("msg","用户名或密码错误");//保存错误信息到msg前端变量中
            model.addAttribute("user",userLogin);//错误信息的回显
            return "/jsp/login.jsp";
        }
        else{
            if (userFromDb.getStatus()==0){
                request.setAttribute("msg","用户还没有激活!");
                model.addAttribute("user",userLogin);
                return "/jsp/login.jsp";
            }else {
                if(userFromDb.getModerator()!=2){
                    //userFromDb放在userSession里面
                    request.getSession().setAttribute("sessionUser",userFromDb);
                    String loginnameDb = userFromDb.getUsername();
                    loginnameDb = URLEncoder.encode("loginnameDb","utf-8");
                    Cookie cookie = new Cookie("loginnameDb",loginnameDb);
                    cookie.setMaxAge(60*60*24*10);
                    response.addCookie(cookie);
//                request.setAttribute("msg","登录成功！");
                    return "/jsp/blank.jsp";
                }
                else{
                    return "/jsp/admin.jsp";
                }

            }
        }

    }

    @RequestMapping("/quick")
    public String quick(HttpServletResponse response,HttpServletRequest request,
                        Model model)throws Exception {
        request.getSession().invalidate();
        return "/jsp/main.jsp";

    }
}
