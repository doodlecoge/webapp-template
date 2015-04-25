package wang.huaichao.web.action;

import javafx.geometry.Pos;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;
import wang.huaichao.security.UserUtils;
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

    @RequestMapping("/{id}")
    public String show(@PathVariable int id, ModelMap map) {
        final Post post = postService.retrive(id);
        map.put("post", post);
        return "post/show";
    }

    @RequestMapping("/new")
    public String addPost() {
        return "post/new";
    }

    @RequestMapping("/{id}/edit")
    public String editPost(@PathVariable int id,
                           ModelMap map) {
        final Post post = postService.retrive(id);
        map.put("post", post);
        return "post/new";
    }

    @RequestMapping(value = "/{id}/save", method = RequestMethod.POST)
    public String savePost(@PathVariable int id,
                           @RequestParam String title,
                           @RequestParam String content) {
        if (id == 0) {
            postService.create(title, content, UserUtils.getUsername());
        } else {
            postService.update(id, title, content);
        }
        return "redirect:/post";
    }

    @RequestMapping("/{id}/del")
    @ResponseBody
    public String delPost(@PathVariable int id) {
        postService.delete(id);
        return "{\"error\":false}";
    }
}
