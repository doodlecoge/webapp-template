package wang.huaichao.web.service;

import org.hibernate.classic.Session;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import wang.huaichao.RtException;
import wang.huaichao.web.dao.PostDao;
import wang.huaichao.web.model.Post;
import wang.huaichao.web.model.User;

import java.util.Date;
import java.util.List;

/**
 * Created by Administrator on 2015/4/24.
 */
@Service
@Transactional
public class PostService {
    @Autowired
    private PostDao postDao;

    public List<Post> listAll() {
        return postDao.listAll();
    }

    public void create(String title, String content, String username) {
        postDao.create(title, content, username);
    }

    public Post retrive(int id) {
        return postDao.retrive(id);
    }

    public void update(int id, String title, String content) {
        postDao.update(id, title, content);
    }

    public void delete(int id) {
        postDao.delete(id);
    }
}
