package wang.huaichao.web.service;

import org.hibernate.classic.Session;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import wang.huaichao.RtException;
import wang.huaichao.web.dao.UserDao;
import wang.huaichao.web.model.User;

import java.util.Calendar;
import java.util.List;

/**
 * Created by Administrator on 2015/4/24.
 */
@Service
@Transactional
public class UserService {
    @Autowired
    private UserDao userDao;

    public List<User> listAll() {
        return userDao.listAll();
    }

    public void create(String username, String password, String fullname) {
        userDao.create(username, password, fullname);
    }

    public User retrive(String username) {
        return userDao.retrive(username);
    }

    public void update(String username, String password, String fullname) {
        userDao.update(username, password, fullname);
    }

    public void delete(String username) {
        userDao.delete(username);
    }
}
