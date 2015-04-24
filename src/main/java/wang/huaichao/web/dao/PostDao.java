package wang.huaichao.web.dao;

import org.hibernate.classic.Session;
import org.hibernate.criterion.Restrictions;
import org.springframework.stereotype.Repository;
import wang.huaichao.RtException;
import wang.huaichao.web.model.Post;
import wang.huaichao.web.model.User;

import java.util.Calendar;
import java.util.Date;
import java.util.List;

/**
 * Created by Administrator on 2015/4/24.
 */
@Repository
public class PostDao extends BaseDao {
    public List<Post> listAll() {
        return sessionFactory.getCurrentSession()
                .createCriteria(Post.class)
                .list();
    }

    public void create(String title, String content, String username) {
        final User user = new User();
        user.setUsername(username);
        final Date date = new Date();
        final Post post = new Post();
        post.setTitle(title);
        post.setContent(content);
        post.setCreatedAt(date);
        post.setUpdatedAt(date);
        post.setUser(user);
        sessionFactory.getCurrentSession().save(post);
    }

    public Post retrive(int id) {
        Session session = sessionFactory.getCurrentSession();
        Object p = session.createCriteria(Post.class)
                .add(Restrictions.eq("id", id))
                .uniqueResult();

        return p == null ? null : (Post) p;
    }

    public void update(int id, String title, String content) {
        final Post post = retrive(id);
        if (title != null)
            post.setTitle(title);
        if (content != null)
            post.setContent(content);
        Session session = sessionFactory.getCurrentSession();
        session.update(post);
    }

    public void delete(int id) {
        final Post post = retrive(id);
        if (post == null)
            throw new RtException("deleting a nonexistent post");
        Session session = sessionFactory.getCurrentSession();
        session.delete(post);
    }
}
