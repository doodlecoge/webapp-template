package wang.huaichao.web.dao;

import org.hibernate.classic.Session;
import org.hibernate.criterion.Restrictions;
import org.springframework.stereotype.Repository;
import wang.huaichao.RtException;
import wang.huaichao.web.model.User;

import java.util.Calendar;
import java.util.List;

/**
 * Created by Administrator on 2015/4/24.
 */
@Repository
public class UserDao extends BaseDao {
    public List<User> listAll() {
        return sessionFactory.getCurrentSession()
                .createCriteria(User.class)
                .list();
    }

    public void create(String username, String password, String fullname) {
        User user = retrive(username);
        if (user != null)
            throw new RtException("user already exists");
        user = new User();
        user.setUsername(username);
        user.setPassword(password);
        user.setFullname(fullname);
        user.setCreatedAt(Calendar.getInstance().getTime());
        Session session = sessionFactory.getCurrentSession();
        session.save(user);
    }

    public User retrive(String username) {
        Session session = sessionFactory.getCurrentSession();
        Object u = session.createCriteria(User.class)
                .add(Restrictions.eq("username", username))
                .uniqueResult();

        return u == null ? null : (User) u;
    }

    public void update(String username, String password, String fullname) {
        User user = retrive(username);

        if (user == null)
            throw new RtException("updating a nonexistent user");

        if (password != null)
            user.setPassword(password);

        if (fullname != null)
            user.setFullname(fullname);

        Session session = sessionFactory.getCurrentSession();
        session.update(user);
    }

    public void delete(String username) {
        User user = retrive(username);
        if (user == null)
            throw new RtException("deleting a nonexistent user");
        Session session = sessionFactory.getCurrentSession();
        session.delete(user);
    }
}
