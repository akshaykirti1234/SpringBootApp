package tech.csm.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import tech.csm.model.User;

@Repository
public interface UserRepository extends JpaRepository<User, Integer> {

	@Query("from User where userId=?1")
	User findUserById(Integer userId);

}
