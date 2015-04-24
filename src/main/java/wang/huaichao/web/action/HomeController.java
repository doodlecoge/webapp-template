package wang.huaichao.web.action;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 * Created by Administrator on 2015/4/23.
 */
@Controller
@RequestMapping("/")
public class HomeController {
    @RequestMapping(method = RequestMethod.GET)
    public String index() {
        return "home";
    }

    @RequestMapping("/login_page")
    public String loginPage() {
        return "login_page";
    }
}
