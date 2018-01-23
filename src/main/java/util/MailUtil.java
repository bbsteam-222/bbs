package util;

import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import java.util.Date;
import java.util.Properties;

/**
 * Created by linpeng on 2017/12/2.
 * reference:http://blog.csdn.net/xietansheng/article/details/51673073
 */
public class MailUtil {
    public static String myEmailAccount = "270371976@qq.com";
    public static String myEmailPassword = "snpreyugmbbvbjdh";

    public static String myEmailSMTPHost = "smtp.qq.com";

    //public static String receiveMailAccount = "724442114@qq.com";

    public void send(String receiveMailAccount,String body)throws Exception{
        /*
         *1、参数配置
         *使用的协议（JavaMail规范要求
         *发件人的邮箱的 SMTP 服务器地址
         *需要请求认证
          */
        Properties props = new Properties();
        props.setProperty("mail.transport.protocol", "smtp");
        props.setProperty("mail.smtp.host", myEmailSMTPHost);
        props.setProperty("mail.smtp.auth", "true");

        // SMTP 服务器的端口
        final String smtpPort = "465";
        props.setProperty("mail.smtp.port", smtpPort);
        props.setProperty("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
        props.setProperty("mail.smtp.socketFactory.fallback", "false");
        props.setProperty("mail.smtp.socketFactory.port", smtpPort);

        // 2、根据配置创建会话对象, 用于和邮件服务器交互
        // 设置为debug模式, 可以查看详细的发送 log
        Session session = Session.getInstance(props);
        session.setDebug(true);

        // 3. 创建一封邮件
        MimeMessage message = createMimeMessage(session, myEmailAccount, receiveMailAccount,body);

        // 4. 根据 Session 获取邮件传输对象
        Transport transport = session.getTransport();

        // 5. 使用 邮箱账号 和 密码 连接邮件服务器, 这里认证的邮箱必须与 message 中的发件人邮箱一致, 否则报错
        transport.connect(myEmailAccount, myEmailPassword);

        // 6. 发送邮件, 发到所有的收件地址, message.getAllRecipients() 获取到的是在创建邮件对象时添加的所有收件人, 抄送人, 密送人
        transport.sendMessage(message, message.getAllRecipients());

        // 7. 关闭连接
        transport.close();

    }

    public static MimeMessage createMimeMessage(Session session, String sendMail, String receiveMail,String body)throws Exception{
        // 1. 创建一封邮件
        MimeMessage message = new MimeMessage(session);

        // 2. From: 发件人（昵称有广告嫌疑，避免被邮件服务器误认为是滥发广告以至返回失败，请修改昵称）
        message.setFrom(new InternetAddress(sendMail, "bbs", "UTF-8"));

        // 3. To: 收件人（可以增加多个收件人、抄送、密送）
        message.setRecipient(MimeMessage.RecipientType.TO, new InternetAddress(receiveMail, "新用户", "UTF-8"));

        // 4. Subject: 邮件主题（标题有广告嫌疑，避免被邮件服务器误认为是滥发广告以至返回失败，请修改标题）
        message.setSubject("激活您的账号", "UTF-8");

        // 5. Content: 邮件正文（可以使用html标签）（内容有广告嫌疑，避免被邮件服务器误认为是滥发广告以至返回失败，请修改发送内容）
        message.setContent(body, "text/html;charset=UTF-8");

        // 6. 设置发件时间
        message.setSentDate(new Date());

        // 7. 保存设置
        message.saveChanges();

        return message;
    }

}
