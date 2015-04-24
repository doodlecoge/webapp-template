package wang.huaichao.web.model;

import javax.persistence.*;
import java.util.Date;

/**
 * Created by Administrator on 2015/4/24.
 */
@Entity
@Table(name = "users")
@org.hibernate.annotations.Entity(dynamicUpdate = true)
public class Post {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;

    private String title;
    private String content;
    private Date createdAt;
    private Date updatedAt;

}
