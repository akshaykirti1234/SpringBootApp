package tech.csm.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import tech.csm.model.Post;

@Repository
public interface PostRepository extends JpaRepository<Post, Integer> {

}
