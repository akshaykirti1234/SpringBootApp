package tech.csm.service;

import java.util.List;

import tech.csm.model.Post;

public interface PostService {

	List<Post> getAllPost();

	Post savePost(Post post);

	void deletePostById(Integer postId);

	Post getPostById(Integer postId);

}
