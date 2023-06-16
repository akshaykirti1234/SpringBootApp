package tech.csm.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import tech.csm.model.Post;
import tech.csm.repository.PostRepository;

@Service
public class PostServiceImpl implements PostService {

	@Autowired
	private PostRepository postRepository;

	@Override
	public List<Post> getAllPost() {
		return postRepository.findAll();
	}

	@Override
	public Post savePost(Post post) {
		return postRepository.save(post);
	}

	@Override
	public void deletePostById(Integer postId) {
		postRepository.deleteById(postId);
	}

	@Override
	public Post getPostById(Integer postId) {
		return postRepository.findById(postId).get();
	}

}
