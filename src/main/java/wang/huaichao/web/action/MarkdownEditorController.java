package wang.huaichao.web.action;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import wang.huaichao.security.UserUtils;
import wang.huaichao.web.model.User;
import wang.huaichao.web.service.UserService;

/**
 * Created by Administrator on 2015/4/24.
 */
@Controller
@RequestMapping("/mde")
public class MarkdownEditorController {
    @RequestMapping("/new")
    public String index(ModelMap map) {
        return "mde/new";
    }
}
