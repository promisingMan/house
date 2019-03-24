package service;

import dao.PermissionMapper;
import dao.UserMapper;
import entity.Permission;
import entity.User;
import entity.UserExample;
import entity.UserExample.Criteria;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @author 曾佳
 * @date 2019/03/05
 */
@Service
public class UserService {


    @Autowired
    UserMapper userMapper;

    @Autowired
    PermissionMapper permissionMapper;

    public void addUser(User user) {
        userMapper.insert(user);
    }

    public void deleteUserById(Integer userId) {
        userMapper.deleteByPrimaryKey(userId);
    }

    public void editUser(User user) {
        userMapper.updateByPrimaryKeySelective(user);
    }

    /**
     * 根据用户账号密码获取用户整体信息
     *
     * @param user
     * @return
     */
    public User getUser(User user) {
        UserExample example = new UserExample();
        Criteria criteria = example.createCriteria();
        criteria.andUsernameEqualTo(user.getUsername());
        criteria.andPasswordEqualTo(user.getPassword());
        List<User> res = userMapper.selectByExample(example);
        return res.size() > 0 ? res.get(0) : null;
    }

    /**
     * 获取全部用户
     *
     * @return
     */
    public List<User> getUsers() {
        List<User> users = userMapper.selectByExample(null);
        return users;
    }

    /**
     * 获取用户权限
     *
     * @param userId
     * @return
     */
    public List<Permission> getPermissions(Integer userId) {
        List<Permission> permissions = permissionMapper.selectByUserId(userId);
        return permissions;
    }
}
