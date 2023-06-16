package tech.csm.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import tech.csm.model.Post;
import tech.csm.model.User;
import tech.csm.model.Vote;
import tech.csm.repository.VoteRepository;

@Service
public class VoteServiceImpl implements VoteService {

	@Autowired
	VoteRepository voteRepository;

	@Override
	public Vote saveVote(Vote vote) {
		return voteRepository.save(vote);
	}

	@Override
	public Vote checkUserVote(User user, Post post) {
		return voteRepository.checkUserVote(user, post);
	}

	@Override
	public List<Object> getAllVote() {
		return voteRepository.getAllVote();
	}

}
