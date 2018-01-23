import mapper.*;
import org.junit.Before;
import org.junit.Test;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import po.*;
import service.UserService;
import util.MailUtil;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileReader;
import java.io.FileWriter;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

/**
 * Created by linpeng on 2017/12/5.
 */
public class testjava {

    //@Test
    public void testMailUtil()throws Exception{
        MailUtil mailUtil = new MailUtil();
        //mailUtil.send();
    }

    private ApplicationContext applicationContext;

    @Before
    public void setUp()throws Exception{
        applicationContext = new ClassPathXmlApplicationContext("classpath:spring/applicationContext-dao.xml");
    }

    //@Test
    public void testqueryByUsername()throws Exception{
        UserMapper userMapper = (UserMapper) applicationContext.getBean("userMapper");
        User user = userMapper.findByUsername("shisan");
        System.out.println(user.getEmail());
    }

 /*   @Test
    public void testUserService()throws Exception{
        UserResiger userResiger = new UserResiger();
        userResiger.setUsername("ll");
        userResiger.setPassword("123456");
        userResiger.setEmail("724442114@qq.com");
        UserService userService = (UserService)applicationContext.getBean("userService");
        //userService.insertUser(userResiger);

    }*/

    @Test
    public void testTopicCustom()throws Exception{
        UserMapper userMapper = (UserMapper) applicationContext.getBean("userMapper");
        TopicCustom topicCustom = userMapper.findUsernameByTopicID("02df1735a2c74b6b865fbdc33e11e7a3");

            System.out.println(topicCustom.getUser().getUsername());

    }

    @Test
    public void testFile()throws Exception{
        TopicMapper topicMapper = (TopicMapper)applicationContext.getBean("topicMapper");
        Topic topic = topicMapper.findOneTopic("02df1735a2c74b6b865fbdc33e11e7a3");
        //SimpleDateFormat sdf =   new SimpleDateFormat( " yyyy-MM-dd HH:mm:ss " );
        //String filename = sdf.format(new Date()).replace(":","").replace(" ","")+".txt";
        //File fileText = new File(filename);
        String context = topic.getContext();
        //FileWriter fileWriter = new FileWriter(fileText);
       // fileWriter.write(context);
        //fileWriter.close();
        //topic.setContext(fileText.getAbsolutePath());
        //topicMapper.updateTopic(topic);
        StringBuilder result = new StringBuilder();
        try{
            BufferedReader br = new BufferedReader(new FileReader(context));//构造一个BufferedReader类来读取文件
            String s = null;
            while((s = br.readLine())!=null){//使用readLine方法，一次读一行
                result.append(System.lineSeparator()+s);
            }
            br.close();
        }catch(Exception e){
            e.printStackTrace();
        }
        context = result.toString();
        System.out.println(context);


    }

}
