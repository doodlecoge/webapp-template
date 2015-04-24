package wang.huaichao.web.action;

import javafx.geometry.Pos;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import wang.huaichao.web.model.Post;
import wang.huaichao.web.model.User;
import wang.huaichao.web.service.PostService;
import wang.huaichao.web.service.UserService;

import java.util.List;

/**
 * Created by Administrator on 2015/4/24.
 */
@Controller
@RequestMapping("/post")
public class PostController {
    @Autowired
    private PostService postService;

    @RequestMapping(method = RequestMethod.GET)
    public String index(ModelMap map) {
        final List<Post> users = postService.listAll();
        map.put("posts", users);
        return "post/index";
    }
}
