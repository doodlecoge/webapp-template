package wang.huaichao.web.action;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import wang.huaichao.web.model.User;
import wang.huaichao.web.service.UserService;

import java.util.List;

/**
 * Created by Administrator on 2015/4/24.
 */
@Controller
@RequestMapping("/user")
public class UserController {
    @Autowired
    private UserService userService;

    @RequestMapping(method = RequestMethod.GET)
    public String index(ModelMap map) {
        final List<User> users = userService.listAll();
        map.put("users", users);
        return "user/index";
    }
}
