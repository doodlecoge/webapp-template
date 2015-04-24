package wang.huaichao.web.model;

import com.sun.istack.internal.NotNull;

import javax.persistence.*;
import java.util.Date;

/**
 * Created by Administrator on 2015/4/24.
 */
@Entity
@Table(name = "users")
@org.hibernate.annotations.Entity(dynamicUpdate = true)
public class User {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private String username;

    @Column
    private String password;

    @Column
    private String fullname;

    @Column(name = "created_at")
    private Date createdAt;

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getFullname() {
        return fullname;
    }

    public void setFullname(String fullname) {
        this.fullname = fullname;
    }

    public Date getCreatedAt() {
        return createdAt;
    }

    public void setCreatedAt(Date createdAt) {
        this.createdAt = createdAt;
    }
}
